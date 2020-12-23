from pynq import DefaultIP
from pynq import allocate
import numpy as np

class AutoDmaCore(DefaultIP):
    
    def __init__(self, description):
        """Initialise AutoDmaCore hardware class."""
        super().__init__(description=description)
        
        self.buffer = [allocate(shape=(4096,), dtype=np.single) for x in range(0, 3) ]
        
        self.buffer_0 = self.buffer[0].device_address
        self.buffer_1 = self.buffer[1].device_address
        self.buffer_2 = self.buffer[2].device_address
        self.length = 4096
        self.count = int(2e6)
        self.enable = 0
        
    def get_frame(self):
        """Return a numpy array single precision
        
        Retrieves a frame of data from memory using the last known
        pointer in hardware."""
        return np.array(self.buffer[self.pointer], dtype=np.single)
        
    bindto = ['xilinx.com:ip:mw_autodma:1.0']
    
_autoDma_props = [("length",     0x100),
                  ("buffer_0",   0x104),
                  ("buffer_1",   0x108),
                  ("buffer_2",   0x10C),
                  ("enable",     0x110),
                  ("count",      0x114),
                  ("pointer",    0x124),
                  ("dma_status", 0x128)]

def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
    
    def _set(self, value):
        self.write(addr, value)
        
    return property(_get, _set)

for (name, addr) in _autoDma_props:
    setattr(AutoDmaCore, name, _create_mmio_property(addr))