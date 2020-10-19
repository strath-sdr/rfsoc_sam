from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import Xlnk
import numpy as np

class SpectrumFFT(DefaultHierarchy):
    
    def __init__(self, description):
        super().__init__(description)
        
        #self.FFT.buffer_length = 2047
        self.set_output(0)
        
    def set_output(self, sel):
        self.PSD.output_selection = sel # 0 - magnitude | 1 - power(dB)
        
    @staticmethod
    def checkhierarchy(description):
        if 'FFT' in description['ip'] \
            and 'PSD' in description['ip']:
            return True
        return False

class SpectrumFFTCore(DefaultIP):
    """Driver for Window's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["UoS:RFSoC:spectrum_fft:1.2"]
    
# LUT of property addresses for our data-driven properties
_specfft_props = [("reset", 256)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)

# Generate getters and setters based on _specfft_props
for (name, addr) in _specfft_props:
    setattr(SpectrumFFTCore, name, _create_mmio_property(addr))


class PSDCore(DefaultIP):
    """Driver for Window's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["UoS:RFSoC:psd:0.3.1"]
    
# LUT of property addresses for our data-driven properties
_specfft_props = [("output_selection", 256)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)

# Generate getters and setters based on _specfft_props
for (name, addr) in _specfft_props:
    setattr(PSDCore, name, _create_mmio_property(addr))