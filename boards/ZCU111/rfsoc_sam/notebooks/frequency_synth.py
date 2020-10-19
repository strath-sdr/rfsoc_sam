from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import Xlnk
import numpy as np

class FrequencySynth(DefaultIP):
    """Driver for Signal Generator's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["xilinx.com:ip:frequency_synth:1.0"]
    
    
# LUT of property addresses for our data-driven properties
_freq_synth_props = [("constant_enable", 256),
                ("enable_nco_0", 260), 
                ("enable_nco_1", 264), 
                ("enable_nco_2", 268), 
                ("enable_nco_3", 272),
                ("gain_nco_0", 276),
                ("gain_nco_1", 280),
                ("gain_nco_2", 284),
                ("gain_nco_3", 288),
                ("step_size_0", 292),
                ("step_size_1", 296),
                ("step_size_2", 300),
                ("step_size_3", 304)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)


# Generate getters and setters based on _trans_props
for (name, addr) in _freq_synth_props:
    setattr(FrequencySynth, name, _create_mmio_property(addr))