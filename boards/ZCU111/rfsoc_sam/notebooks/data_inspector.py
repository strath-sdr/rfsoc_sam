from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import Xlnk
import numpy as np

class DataInspector(DefaultHierarchy):

    def __init__(self, description):
        super().__init__(description)
        
        xlnk = Xlnk()
        self.buf_data = xlnk.cma_array(shape=(2048, ), dtype=np.single)
        
        self.type = 1
        self.data_inspector.transfer = 0
        self.data_inspector.reset = 1

    def get_buffer_frame(self):
        """Get a single buffer of FFT data from the pulse shaped signal
        """
        self.data_inspector.reset = 0
        self.axi_dma_inspector.recvchannel.transfer(self.buf_data)
        self.data_inspector.transfer = 1
        self.axi_dma_inspector.recvchannel.wait()
        self.data_inspector.transfer = 0
        self.data_inspector.reset = 1
        
        buff_length = int(len(self.buf_data))
        data = np.array(self.buf_data)
        #data = np.fft.fftshift(self.buf_data)
        data = np.concatenate((data[int(buff_length/2+1):buff_length], data[0:int(buff_length/2+1)]))
        
        if not self.type:
            data = 10 * np.where(data>0.0, np.log10(data), 0.0)
        
        return data
        
    @staticmethod
    def checkhierarchy(description):
        if 'axi_dma_inspector' in description['ip'] \
           and 'data_inspector' in description['ip']:
            return True
        return False 

class DataInspectorCore(DefaultIP):
    """Driver for Data Inspector's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ['UoS:RFSoC:DataInspector:0.2.1']
    
    
# LUT of property addresses for our data-driven properties
_dataInspector_props = [("transfer", 256), ("reset", 260)]

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