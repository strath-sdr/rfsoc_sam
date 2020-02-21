from pynq import DefaultIP
from pynq import DefaultHierarchy
from pynq import Xlnk
import numpy as np
import ipywidgets as ipw

import plotly.io as pio
import plotly.graph_objs as go
pio.renderers.default = "browser"

class SpectrumWindow(DefaultHierarchy):
    
    def __init__(self, description, pkt_wind=2048):
        super().__init__(description)
        
        xlnk = Xlnk()
        self.buf_wind = xlnk.cma_array(shape=(pkt_wind, ), dtype=np.int16)
        
        self.set_length(2048)
        self.set_window_coeffs(np.ones(2048))
        self.set_enable(1)
        
        self.Window.dc_enable = 1

        self.params = ipw.VBox([],layout=ipw.Layout(width='auto'))
        self.window_sel = ipw.HBox([],layout=ipw.Layout(width='auto'))
        self.coeffs = np.ones(2048)
        self.window_length = 2048
        self.window_type = 'Rectangular'

        self.coeffs_sat = np.ones(2048)

        self.frequency = 0
        self.input = 0
        
    def set_enable(self, enable):
        self.Window.enable = int(enable)
       
    def set_step(self, step):
        self.Window.step = int(step)
        
    def set_length(self, length):
        self.Window.length = int(length-1)
        self.set_step(2048/length)
    
    def set_window_coeffs(self, data):
        coeffs = np.int16(data*2**14)
        np.copyto(self.buf_wind,coeffs)
        self.axi_dma_window.sendchannel.transfer(self.buf_wind)
        self.axi_dma_window.sendchannel.wait()
        self.buf_wind.close()     
        
    def send(self, window_coeffs, n):
        xlnk = Xlnk()
        self.input_buffer = xlnk.cma_array(shape=(self.window_length,), dtype=np.int16)
        dma = self.axi_dma_window
        np.copyto(self.input_buffer,window_coeffs)
        dma.sendchannel.transfer(self.input_buffer)
        dma.sendchannel.wait()
        self.input_buffer.close()

    def updateParameters(self, update): 
        self.update.style.button_color = 'red'
        self.coeffs_sat = np.int16(self.coeffs*2**14)
        self.update.style.button_color = 'orange'
        self.send(self.coeffs_sat, self.window_length)

        self.update.style.button_color = 'yellowgreen'

    def change(self, chng):
        self.update.style.button_color = None

        self.window_type = str(self.window.value)

        if self.window_type == 'Bartlett':
            self.coeffs = np.bartlett(self.window_length)
        elif self.window_type == 'Blackman':
            self.coeffs = np.blackman(self.window_length)
        elif self.window_type == 'Hamming':
            self.coeffs = np.hamming(self.window_length)
        elif self.window_type == 'Hanning':
            self.coeffs = np.hanning(self.window_length)
        elif self.window_type == 'Rectangular':
            self.coeffs = np.ones(self.window_length)
        else:
            self.coeffs = 0

        self.fig.update(data=[{'y':self.coeffs}])
        
    def Setup(self):   
        # Drop down menu widget for selecting the window type
        self.window = ipw.Dropdown(
        options=['Bartlett', 'Blackman', 'Hamming', 'Hanning', 'Rectangular'],
        value='Rectangular',
        description='',
        disabled=False,
        button_style='', # 'success', 'info', 'warning', 'danger' or ''
        layout=ipw.Layout(width='60%'),
        )

        # Button widget to update hardware when parameters have been set
        self.update = ipw.Button(description="Load",
        button_style='', # 'success', 'info', 'warning', 'danger' or '' 
        layout=ipw.Layout(width='40%'),
        )
        self.update.on_click(self.updateParameters)

        self.fig = go.FigureWidget()
        self.fig.layout.width=250
        self.fig.layout.height=225
        self.fig.layout.margin=dict(t=0,b=20,l=0,r=0)
        self.fig.add_scatter(x=np.arange(2048),y=self.coeffs)
        self.fig.data[0].marker.color='#005d95'

        # Group widgets together
        self.window_sel.children+=(self.window,)
        self.window_sel.children+=(self.update,)
        self.params.children += (self.fig,)
        self.params.children += (self.window_sel,)

        self.window.observe(self.change, names='value')

        accordion = ipw.Accordion(children=[self.params])
        accordion.set_title(0, 'Window')
        
        return accordion
         
    @staticmethod
    def checkhierarchy(description):
        if 'axi_dma_window' in description['ip'] \
           and 'Window' in description['ip']:
            return True
        return False  

class WindowCore(DefaultIP):
    """Driver for Window's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    
    def __init__(self,description):
        super().__init__(description=description)
        
    bindto = ["UoS:RFSoC:window:0.4"]
    
# LUT of property addresses for our data-driven properties
_window_props = [("dc_enable", 0x104), ("enable", 0x100)]

#     bindto = ["UoS:RFSoC:window:0.2.2"]
    
# # LUT of property addresses for our data-driven properties
# _window_props = [("dc_enable", 12), ("step", 0), ("length", 4), ("length_out", 16), ("step_out", 20), ("enable", 8)]

# Func to return a MMIO getter and setter based on a relative addr
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)

    def _set(self, value):
        self.write(addr, value)

    return property(_get, _set)


# Generate getters and setters based on _window_props
for (name, addr) in _window_props:
    setattr(WindowCore, name, _create_mmio_property(addr))
