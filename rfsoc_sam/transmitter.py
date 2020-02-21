from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import Xlnk
import numpy as np

class Transmitter(DefaultHierarchy):
    
    def __init__(self, description):
        super().__init__(description)
        
        self.set_modulation('QPSK')
        
    def set_modulation(self, mod):
        switcher = {
            'BPSK' : 0,
            'QPSK' : 1,
            '8-PSK' : 2,
            '16-QAM' : 3,
        }
        num = switcher.get(mod, 3)
        self.TXInterpolator.enable = 0
        self.TXInterpolator.reset = 1
        self.TXInterpolator.modulation = num # 0-BPSK | 1-QPSK | 2-8PSK | 3-QAM16
        self.TXInterpolator.enable = 1
        self.TXInterpolator.reset = 0        
        
    @staticmethod
    def checkhierarchy(description):
        if 'TXInterpolator' in description['ip']:
            return True
        return False
        
        
class TransmitterCore(DefaultIP):
    """Driver for Signal Generator's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["UoS:RFSoC:transmitter:0.1.1"]
    
# LUT of property addresses for our data-driven properties
_trans_props = [("reset", 0), ("modulation", 4), ("enable", 8)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)


# Generate getters and setters based on _trans_props
for (name, addr) in _trans_props:
    setattr(TransmitterCore, name, _create_mmio_property(addr))
