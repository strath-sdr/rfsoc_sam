from pynq import DefaultIP
from pynq import allocate
import numpy as np

class SsrConverterCore(DefaultIP):
    
    def __init__(self, description):
        super().__init__(description=description)
        
        self.ssrmode = 3
        self.packetsize = 512
        
    bindto = ['xilinx.com:ip:mw_ssrconverter:1.0']
    
_ssrConverter_props = [("packetsize",   0x100),
                       ("ssrmode",      0x104)]

def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
    
    def _set(self, value):
        self.write(addr, value)
        
    return property(_get, _set)

for (name, addr) in _ssrConverter_props:
    setattr(SsrConverterCore, name, _create_mmio_property(addr))