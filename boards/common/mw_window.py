from pynq import DefaultIP
from pynq import allocate
import numpy as np
import struct

class WindowCore(DefaultIP):
    
    def __init__(self, description):
        super().__init__(description=description)
        
        self.packet_size = 8192
        self.address = 0
        self.enable = 0
        
        self.set_window(window_type='rectangular')

    def set_window(self, window_type='rectangular'):
        buffer = allocate(shape=(self.packet_size,), dtype=np.int32)
        self.address = buffer.device_address
        if window_type == 'rectangular':
            buffer[:] = np.int32(np.ones(self.packet_size)[:]*2**14)
        elif window_type == 'bartlett':
            buffer[:] = np.int32(np.bartlett(self.packet_size)[:]*2**14)
        elif window_type == 'blackman':
            buffer[:] = np.int32(np.blackman(self.packet_size)[:]*2**14)
        elif window_type == 'hamming':
            buffer[:] = np.int32(np.hamming(self.packet_size)[:]*2**14)
        elif window_type == 'hanning':
            buffer[:] = np.int32(np.hanning(self.packet_size)[:]*2**14)
        else:
            buffer[:] = np.int32(np.ones(self.packet_size)[:]*2**14)
        self.enable = 1
        while not self.ready:
            pass
        self.enable = 0
        
    bindto = ['xilinx.com:ip:mw_window:1.0']
        
_window_props = [("packet_size",   0x100),
                 ("address",       0x104),
                 ("enable",        0x108),
                 ("ready",         0x10C)]

def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
    
    def _set(self, value):
        self.write(addr, value)
        
    return property(_get, _set)

for (name, addr) in _window_props:
    setattr(WindowCore, name, _create_mmio_property(addr))