__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

from pynq import DefaultIP
import numpy as np


class BandwidthSelector(DefaultIP):
    
    def __init__(self, description):
        super().__init__(description=description)
        
    @property
    def decimation_factor(self):
        return 2**(self._decimation_factor)
    
    @decimation_factor.setter
    def decimation_factor(self, decimation_factor):
        if decimation_factor in [0, 2, 4, 8, 16, 32, 64, 128, 256]:
            if decimation_factor > 0:
                self._decimation_factor = int(np.log2(decimation_factor))
            else:
                self._decimation_factor = 0
        
    bindto = ['strath.ac.uk:RFSoC:xsg_bwselector:1.1']
    
_bwselector_props = [("_decimation_factor",   0x00)]

def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
    
    def _set(self, value):
        self.write(addr, value)
        
    return property(_get, _set)

for (name, addr) in _bwselector_props:
    setattr(BandwidthSelector, name, _create_mmio_property(addr))