from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import Xlnk
import numpy as np
from scipy import signal
import matplotlib.pyplot as plt

class BandwidthSelector(DefaultHierarchy):

    def __init__(self, description, pkt_config=1, pkt_reload=128): # Find out the correct length of config and reload
        super().__init__(description)

        xlnk = Xlnk()
        self.buf_config = xlnk.cma_array(shape=(pkt_config, ), dtype=np.int8)
        self.buf_reload = xlnk.cma_array(shape=(pkt_reload, ), dtype=np.int16)
        self.BWSelector.enable = 1
        self._taps = 128
        self._fs = 256e6
        self.set_downsample(2)

    def set_downsample(self, factor):
        self.BWSelector.downsample_factor =  factor-1

    def config(self, data):
        np.copyto(self.buf_config,np.int8(data))
        self.axi_dma_config.sendchannel.transfer(self.buf_config)
        self.axi_dma_config.sendchannel.wait()
        self.buf_config.close()

    def reload(self, data):
        np.copyto(self.buf_reload,np.int16(data*2**14))
        self.axi_dma_reload.sendchannel.transfer(self.buf_reload)
        self.axi_dma_reload.sendchannel.wait()
        self.buf_reload.close()
      
    """
    generate_lowpass lifted from here:
    https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.remez.html
    """
    def generate_lowpass(self, fs, cutoff, trans_width, numtaps):
        taps = signal.remez(numtaps, [0, cutoff, cutoff + trans_width, 0.5*fs], [1, 0], Hz=fs)
        w, h = signal.freqz(taps, [1], worN=2000)
        return w, h, taps
    
    """
    plot_response lifted from here:
    https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.remez.html
    """
    def plot_response(self, fs, w, h, title = "Low-Pass Filter"):
        "Utility function to plot response functions"
        fig = plt.figure()
        ax = fig.add_subplot(111)
        ax.plot(0.5*fs*w/np.pi, 20*np.log10(np.abs(h)))
        ax.set_ylim(-40, 5)
        ax.set_xlim(0, 0.5*fs)
        ax.grid(True)
        ax.set_xlabel('Frequency (Hz)')
        ax.set_ylabel('Gain (dB)')
        ax.set_title(title)

    @staticmethod
    def checkhierarchy(description):
        if 'axi_dma_config' in description['ip'] \
           and 'axi_dma_reload' in description['ip'] \
           and 'BWSelector' in description['ip']:
            return True
        return False

class BandwidthSelectorCore(DefaultIP):
    """Driver for Bandwidth Selector's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """

    def __init__(self,description):
        super().__init__(description=description)

    bindto = ["UoS:RFSoC:bandwidthselector:0.3.0"]

# LUT of property addresses for our data-driven properties
_bandSelect_props = [("downsample_factor", 4), ("event_missing", 8), ("event_unexpected", 12), ("enable", 0)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)


# Generate getters and setters based on _bandSelect_props
for (name, addr) in _bandSelect_props:
    setattr(BandwidthSelectorCore, name, _create_mmio_property(addr))
