__author__ = "David Northcote"

import numpy as np
import plotly.io as pio
from pynq import DefaultIP, allocate
import struct
import time
import threading
from .sdr_plots import Spectrum, Spectrogram

pio.renderers.default = "browser"


class SpectrumAnalyser(DefaultIP):
    """Driver for the Spectrum Analyser core.
    
    The Spectrum Analyser contains an SSR converter,
    reprogrammable window upto 8192 samples, several
    FFT cores (N=62 to N=8192), a spectrum processor
    for converting to power spectrum, PSD and dB, and
    finally an automatic DMA that transfers the
    spectrum to memory when ready.
    
    Attributes:
    ----------
    plot : An sdr_plots.Spectrum object
        The Spectrum object displays the frequency
        spectrum data to the user with Plotly go.
        
    spectrogram : An sdr_plot.Spectrogram object
        The Spectrogram object displays the frequency
        spectrum over time using a waterfall
        plotting technique.
    
    timer : A FunctionTimer object
        A threaded timer for updating the spectrum
        analyser plots with new data from the DMA.
        
    """
    
    def __init__(self,
                 description,
                 sample_frequency = 2048e6,
                 update_frequency = 10,
                 centre_frequency = 0,
                 nyquist_stopband = 1,
                 plot_width = 800,
                 plot_height = 400):
        
        super().__init__(description=description)
        
        # SSR Subset Converter Registers
        self.ssr_mode = 3
        self.ssr_packetsize = 512
        
        # Window Registers and type
        self.window_packetsize = 4096
        self.window_address = 0
        self.window_transfer = 0
        
        self.window_squaresum = 4096
        self.window_sum = 4096
        self.window_type = 'rectangular'
        
        # Spectrum Registers
        self._spectrum_units = 0
        self._spectrum_type = 1
        self._spectrum_vrms = 0
        self.spectrum_typescale = int(struct.unpack('!i',struct.pack('!f',float(sample_frequency/4096)))[0])
        self.spectrum_powerscale = int(struct.unpack('!i',struct.pack('!f',float(1/(sample_frequency*4096))))[0])
        self.spectrum_fftselector = 6
        
        # Auto DMA Registers and buffer initialisation
        self.dma_length = 4096
        self.buffer = [allocate(shape=(self.dma_length,), dtype=np.single) for x in range(0, 3) ]
        self.dma_bufferaddress_0 = self.buffer[0].device_address
        self.dma_bufferaddress_1 = self.buffer[1].device_address
        self.dma_bufferaddress_2 = self.buffer[2].device_address
        self.dma_enable = 0
        self.__dma_enable = 0
        self._dma_count = 20000000 # No touchy
        
        """Initialise"""
        self._sample_frequency = int(sample_frequency)
        self._update_frequency = update_frequency
        self._last_buffer = np.zeros(self.dma_length, dtype=np.single) - 300
        self._number_samples = int(2**(self.spectrum_fftselector+6))
        self._centre_frequency = centre_frequency
        self._nyquist_stopband = nyquist_stopband
        self._width = plot_width
        self._height = plot_height
        
        """Set plotly dark mode as default"""
        self.plot_theme = 'plotly'
        
        """Create Spectrum Plot object for presenting the frequency spectrum."""
        self.plot = Spectrum(plot_data=np.zeros((self._number_samples,), dtype=np.single),
                             sample_frequency=self._sample_frequency,
                             number_samples=self._number_samples,
                             centre_frequency=self._centre_frequency,
                             nyquist_stopband=self._nyquist_stopband,
                             xlabel='Frequency (Hz)',
                             ylabel='Power Spectrum (dBW)',
                             plot_width=self._width,
                             plot_height=self._height,
                             display_mode=0,
                             spectrum_mode=True,
                             animation_duration=0)
        
        """Create Spectrogram Plot object for presenting the waterfall spectrum."""
        self.spectrogram = Spectrogram(sample_frequency=self._sample_frequency,
                                       centre_frequency=self._centre_frequency,
                                       nyquist_stopband=self._nyquist_stopband,
                                       width=self._width,
                                       height=self._height,
                                       plot_time=10,)
        
        """Create a Function Timer object to enable plot data updates through threading."""
        self.timer = FunctionTimer(plot=[self.plot, self.spectrogram],
                                    dma=self,
                                    update_frequency=self._update_frequency)

    @property
    def width(self):
        return self._width
    
    @width.setter
    def width(self, width):
        self._width = width
        self.plot.width = width
        self.spectrogram.width = width
        
    @property
    def height(self):
        return self._height
    
    @height.setter
    def height(self, height):
        self._height = height
        self.plot.height = height
        self.spectrogram.height = height
        
    @property
    def plotly_theme(self):
        return pio.templates.default
    
    @plotly_theme.setter
    def plotly_theme(self, theme):
        if theme in ['seaborn', 'simple_white', 'plotly', 
                     'plotly_white', 'plotly_dark']:
            pio.templates.default = theme
            self.plot._plot.layout.template = theme
            self.spectrogram._plot.layout.template = theme
        
    @property
    def centre_frequency(self):
        return self._centre_frequency
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        self._centre_frequency = centre_frequency
        self.plot.centre_frequency = centre_frequency
        self.spectrogram.centre_frequency = centre_frequency
        
    @property
    def spectrum_units(self):
        if self._spectrum_units:
            return 'dBm'
        else:
            return 'dBW'
        
    @spectrum_units.setter
    def spectrum_units(self, spectrum_units):
        if spectrum_units == 'dBm':
            self._spectrum_units = 1
        elif spectrum_units == 'dBW':
            self._spectrum_units = 0
        self.spectrum_type = self.spectrum_type
        
    @property
    def spectrum_type(self):
        if self._spectrum_type:
            return 'Power Spectrum'
        else:
            return 'Power Spectral Density'
    
    @spectrum_type.setter
    def spectrum_type(self, spectrum_type):
        if spectrum_type == 'Power Spectrum':
            self.plot.clear_plot()
            self._spectrum_type = 1
            self.plot.ylabel = ''.join([spectrum_type, ' (', self.spectrum_units, ')'])
            self.plot._plot.layout.yaxis.range = [-150 + self._spectrum_units*30, 0 + self._spectrum_units*30]
        elif spectrum_type == 'Power Spectral Density':
            self.plot.clear_plot()
            self._spectrum_type = 0
            self.plot.ylabel = ''.join([spectrum_type, ' (', self.spectrum_units, ')'])
            self.plot._plot.layout.yaxis.range = [-210 + self._spectrum_units*30, -60 + self._spectrum_units*30]     
        
    @property
    def update_frequency(self):
        return self.timer.update_frequency
    
    @update_frequency.setter
    def update_frequency(self, update_frequency):
        if update_frequency > 10:
            self.timer.update_frequency = 10
        elif update_frequency < 1:
            self.timer.update_frequency = 1
        else:
            self.timer.update_frequency = update_frequency
            
    @property
    def fft_size(self):
        return int(2**(self.spectrum_fftselector+6))
    
    @fft_size.setter
    def fft_size(self, fft_size):
        if fft_size in [8192, 4096, 2048, 1024, 512, 256, 128, 64]:
            running = False
            if self.dma_enable:
                self.dma_enable = 0
                running = True
            self.ssr_packetsize = 0
            self.dma_length = fft_size
            [self.buffer[x].freebuffer() for x in range(0, 3)]
            self.buffer = [allocate(shape=(self.dma_length,), dtype=np.single) for x in range(0, 3) ]
            self.dma_bufferaddress_0 = self.buffer[0].device_address
            self.dma_bufferaddress_1 = self.buffer[1].device_address
            self.dma_bufferaddress_2 = self.buffer[2].device_address
            self.spectrum_fftselector = int(np.log2(fft_size)-6)
            self.window_packetsize = fft_size
            self.window = self.window_type
            self.ssr_packetsize = int(fft_size/8)
            self.plot.number_samples = fft_size
            self._number_samples = int(2**(self.spectrum_fftselector+6))
            self.spectrum_typescale = \
                int(struct.unpack('!i',struct.pack('!f',float(self._sample_frequency/(self._number_samples))))[0])
            self.spectrum_powerscale = \
                int(struct.unpack('!i',struct.pack('!f',float(1/(self._sample_frequency*self.window_squaresum))))[0])
            if running:
                self.dma_enable = 1
      
    @property
    def window(self):
        return self.window_type
    
    @window.setter
    def window(self, window):
        window_size = self.window_packetsize
        buffer = allocate(shape=(window_size,), dtype=np.int32)
        self.window_address = buffer.device_address
        if window == 'rectangular':
            buffer[:] = np.int32(np.ones(window_size)[:]*2**14)
        elif window == 'bartlett':
            buffer[:] = np.int32(np.bartlett(window_size)[:]*2**14)
        elif window == 'blackman':
            buffer[:] = np.int32(np.blackman(window_size)[:]*2**14)
        elif window == 'hamming':
            buffer[:] = np.int32(np.hamming(window_size)[:]*2**14)
        elif window == 'hanning':
            buffer[:] = np.int32(np.hanning(window_size)[:]*2**14)
        else:
            buffer[:] = np.int32(np.ones(window_size)[:]*2**14)
            window = 'rectangular'
        self.window_transfer = 1
        while not self.window_ready:
            pass
        self.window_transfer = 0
        self.window_type = window
        self.window_squaresum = np.sum((np.array(buffer, dtype=np.single)*2**-14)**2)
        self.window_sum = np.sum((np.array(buffer, dtype=np.single)))
        buffer.freebuffer()
        self.spectrum_typescale = \
            int(struct.unpack('!i',struct.pack('!f',float(self._sample_frequency/(self._number_samples))))[0])
        self.spectrum_powerscale = \
            int(struct.unpack('!i',struct.pack('!f',float(1/(self._sample_frequency*self.window_squaresum))))[0])
        
    @property
    def spectrum_window(self):
        window_type = self.window_type
        window_size = self.window_packetsize
        if window_type == 'rectangular':
            buffer = np.array(np.ones(window_size)[:], dtype=np.single)
        elif window_type == 'bartlett':
            buffer = np.array(np.bartlett(window_size)[:], dtype=np.single)
        elif window_type == 'blackman':
            buffer = np.array(np.blackman(window_size)[:], dtype=np.single)
        elif window_type == 'hamming':
            buffer = np.array(np.hamming(window_size)[:], dtype=np.single)
        elif window_type == 'hanning':
            buffer = np.array(np.hanning(window_size)[:], dtype=np.single)
        else:
            buffer = np.array(np.ones(window_size)[:], dtype=np.single)
        return buffer
        
    @property
    def dma_enable(self):
        return self.__dma_enable
    
    @dma_enable.setter
    def dma_enable(self, dma_enable):
        self._dma_enable = dma_enable
        self.__dma_enable = dma_enable
        
    @property
    def sample_frequency(self):
        return self._sample_frequency
    
    @sample_frequency.setter
    def sample_frequency(self, sample_frequency):
        self._sample_frequency = sample_frequency
        self.plot.sample_frequency = sample_frequency
        self.spectrogram.sample_frequency = sample_frequency
        
    @property
    def nyquist_stopband(self):
        return self._nyquist_stopband
    
    @nyquist_stopband.setter
    def nyquist_stopband(self, nyquist_stopband):
        self._nyquist_stopband = nyquist_stopband
        self.plot.nyquist_stopband = nyquist_stopband
        self.spectrogram.nyquist_stopband = nyquist_stopband
        
    @property
    def zmin(self):
        return self.spectrogram.zmin
    
    @zmin.setter
    def zmin(self, zmin):
        self.spectrogram.zmin = zmin
        
    @property
    def zmax(self):
        return self.spectrogram.zmax
    
    @zmax.setter
    def zmax(self, zmax):
        self.spectrogram.zmax = zmax
        
    @property
    def quality(self):
        return self.spectrogram.quality
    
    @quality.setter
    def quality(self, quality):
        self.spectrogram.quality = quality
        
    def get_frame(self):
        """Return a numpy array single precision
        
        Retrieves a frame of data from memory using the last known
        pointer in hardware."""
        while not self.dma_enable:
            pass
        return np.array(self.buffer[self.dma_bufferpointer], dtype=np.single)
        
    bindto = ['xilinx.com:ip:SpectrumAnalyser:1.0']
    
_spectrumAnalyser_props = [("ssr_packetsize",       0x104),
                           ("ssr_mode",             0x108),
                           ("_spectrum_units",      0x10C),
                           ("_spectrum_type",       0x110),
                           ("_spectrum_vrms",       0x114),
                           ("spectrum_typescale",   0x118),
                           ("spectrum_powerscale",  0x11C),
                           ("spectrum_fftselector", 0x120),
                           ("window_packetsize",    0x124),
                           ("window_address",       0x128),
                           ("window_transfer",      0x12C),
                           ("dma_length",           0x130),
                           ("dma_bufferaddress_0",  0x134),
                           ("dma_bufferaddress_1",  0x138),
                           ("dma_bufferaddress_2",  0x13C),
                           ("_dma_enable",          0x140),
                           ("_dma_count",           0x144),
                           ("window_ready",         0x148),
                           ("dma_bufferpointer",    0x14C),
                           ("dma_status",           0x150)]

def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
    
    def _set(self, value):
        self.write(addr, value)
        
    return property(_get, _set)

for (name, addr) in _spectrumAnalyser_props:
    setattr(SpectrumAnalyser, name, _create_mmio_property(addr))
    
                                  
class FunctionTimer():
    """Thread timer class"""
    def __init__(self,
                 plot,
                 dma,
                 update_frequency):
        
        self._plot = plot
        self._time = float(1/update_frequency)
        self._dma = dma
        self.stopping = True
        self.stopped = True
        
    @property
    def update_frequency(self):
        return float(1/self._time)
    
    @update_frequency.setter
    def update_frequency(self, update_frequency):
        self._time = float(1/update_frequency)
        
    def _do(self):
        while not self.stopping:
            next_timer = time.time() + self._time
            data = self._dma.get_frame()
            if data.any():
                for plot in self._plot:
                    plot.data = data
            sleep_time = next_timer - time.time()
            if sleep_time > 0:
                time.sleep(sleep_time)
        self.stopped = True
                
    def start(self):
        if self.stopping:
            self.stopping = False
            self.stopped = False
            thread = threading.Thread(target=self._do)
            thread.start()
            
    def stop(self):
        self.stopping = True