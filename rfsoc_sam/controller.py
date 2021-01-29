__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

from pynq import DefaultIP
from pynq import allocate
import numpy as np


class Controller(DefaultIP):
    
    def __init__(self, description):
        super().__init__(description)
        
    bindto = ['xilinx.com:ip:mw_transmitter:1.0']
    
_controller_props = [("enable",   0x100),
                      ("value",    0x104)]

def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
    
    def _set(self, value):
        self.write(addr, value)
        
    return property(_get, _set)

for (name, addr) in _controller_props:
    setattr(Controller, name, _create_mmio_property(addr))