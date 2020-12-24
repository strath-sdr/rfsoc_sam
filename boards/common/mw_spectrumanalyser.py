from pynq import DefaultIP
from pynq import allocate
import numpy as np
import struct

class SpectrumAnalyserCore(DefaultIP):
    
    def __init__(self, description):
        super().__init__(description=description)
        
        self.units = 0
        self.type = 1
        self.vrms = 0
        self.tscale = int(struct.unpack('!i',struct.pack('!f',float(2048e6/4096)))[0])
        self.pwscale = int(struct.unpack('!i',struct.pack('!f',float(1/(2048e6*4096))))[0])
        self.selector = 0
        self.selector = 6
        
    bindto = ['xilinx.com:ip:mw_spectrumanalyser:1.0']
    
_spectrumAnalyser_props = [("units",     0x100),
                           ("type",      0x104),
                           ("vrms",      0x108),
                           ("tscale",    0x10C),
                           ("pwscale",   0x110),
                           ("selector",  0x114)]

def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
    
    def _set(self, value):
        self.write(addr, value)
        
    return property(_get, _set)

for (name, addr) in _spectrumAnalyser_props:
    setattr(SpectrumAnalyserCore, name, _create_mmio_property(addr))