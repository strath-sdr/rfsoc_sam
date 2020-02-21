from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import Xlnk
import numpy as np

class SpectrumADC(DefaultHierarchy):

    def __init__(self, description):
        super().__init__(description)
        
        self.FrameMovingAverage.sel = 0
        
    @staticmethod
    def checkhierarchy(description):
        if 'adc_select' in description['ip']:
            return True
        return False 

class DataInspectorCore(DefaultIP):
    """Driver for Data Inspector's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ['UoS:RFSoC:adc_select:0.1']
    
    
# LUT of property addresses for our data-driven properties
_dataInspector_props = [("sel", 0x100)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)


# Generate getters and setters based on _dataInspector_props
for (name, addr) in _dataInspector_props:
    setattr(DataInspectorCore, name, _create_mmio_property(addr))