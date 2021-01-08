import time
import threading
import plotly.io as pio
import numpy as np
import ipywidgets as ipw
import struct
import plotly.graph_objs as go
from scipy import signal
from PIL import Image

from contextlib import contextmanager

import plotly.io as pio
pio.renderers.default = "browser"

from pynq import DefaultIP
from pynq import allocate

import quick_widgets as qw

import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

class SpectrumAnalyser(DefaultIP):
    """The Spectrum Analyser object."""
    def __init__(self,
                 description,
                 sample_frequency = 2048e6,
                 update_frequency = 5,
                 centre_frequency = 0,
                 nyquist_stopband = 1,
                 plot_width = 800,
                 plot_height = 400):
        
        super().__init__(description=description)
        
        # SSR Subset Converter Registers
        self.ssr_mode = 3
        self.ssr_packetsize = 512
        
        # Window Registers and type
        self.window_packetsize = 4096
        self.window_address = 0
        self.window_transfer = 0
        
        self.window_squaresum = 4096
        self.window_sum = 4096
        self.window_type = 'rectangular'
        
        # Spectrum Registers
        self._spectrum_units = 0
        self._spectrum_type = 1
        self._spectrum_vrms = 0
        self.spectrum_typescale = int(struct.unpack('!i',struct.pack('!f',float(sample_frequency/4096)))[0])
        self.spectrum_powerscale = int(struct.unpack('!i',struct.pack('!f',float(1/(sample_frequency*4096))))[0])
        self.spectrum_fftselector = 6
        
        # Auto DMA Registers and buffer initialisation
        self.dma_length = 4096
        self.buffer = [allocate(shape=(self.dma_length,), dtype=np.single) for x in range(0, 3) ]
        self.dma_bufferaddress_0 = self.buffer[0].device_address
        self.dma_bufferaddress_1 = self.buffer[1].device_address
        self.dma_bufferaddress_2 = self.buffer[2].device_address
        self.dma_enable = 0
        self.__dma_enable = 0
        self._dma_count = 2000000 # No touchy
        
        """Initialise"""
        self._sample_frequency = int(sample_frequency)
        self._update_frequency = update_frequency
        self._last_buffer = np.zeros(self.dma_length, dtype=np.single) - 300
        self._number_samples = int(2**(self.spectrum_fftselector+6))
        self._centre_frequency = centre_frequency
        self._nyquist_stopband = nyquist_stopband
        
        """Set plotly dark mode as default"""
        pio.templates.default = 'plotly_dark'
        
        """Create Spectrum Plot object for presenting the frequency spectrum."""
        self.plot = SpectrumPlot(plot_data=np.zeros((self._number_samples,), dtype=np.single),
                                  sample_frequency=self._sample_frequency,
                                  number_samples=self._number_samples,
                                  centre_frequency=self._centre_frequency,
                                  nyquist_stopband=self._nyquist_stopband,
                                  xlabel='Frequency (Hz)',
                                  ylabel='Power Spectrum (dBW)',
                                  plot_width=plot_width,
                                  plot_height=plot_height,
                                  display_mode=0,
                                  spectrum_mode=True,
                                  animation_duration=0)
        
        """Create Spectrogram Plot object for presenting the waterfall spectrum."""
        self.spectrogram = SpectrogramPlot(sample_frequency=self._sample_frequency,
                                           centre_frequency=self._centre_frequency,
                                           nyquist_stopband=self._nyquist_stopband,
                                           width=plot_width,
                                           height=plot_height,
                                           plot_time=10,)
        
        """Create a Function Timer object to enable plot data updates through threading."""
        self.timer = FunctionTimer(plot=self.plot,
                                    dma=self,
                                    update_frequency=self._update_frequency)
        
        """Create a Function Timer object to enable spectrogram plot data updates through threading."""
        self.spectro_timer = FunctionTimer(plot=self.spectrogram,
                                           dma=self,
                                           update_frequency=10)
        
        """Create a widget for enabling/disabling dma movement."""
        def callback_bt_dma(value, button_id):
            if value:
                self.dma_enable = 1
            else:
                self.dma_enable = 0
                
        self.bt_dma = qw.Button(callback=callback_bt_dma,
                                description_on = 'On',
                                description_off = 'Off',
                                state=False,
                                button_id=0)
        
        """Create a widget for enabling/disabling plotting."""
        def callback_bt_plotting(value, button_id):
            if value:
                self.timer.start()
            else:
                self.timer.stop()
                
        self.bt_plotting = qw.Button(callback=callback_bt_plotting,
                              description_on = 'On',
                              description_off = 'Off',
                              state=False,
                              button_id=0)
        
        """Create a widget for enabling/disabling spectrogram plotting."""
        def callback_bt_spectrogram(value, button_id):
            if value:
                self.spectro_timer.start()
            else:
                self.spectro_timer.stop()
                
        self.bt_spectrogram = qw.Button(callback=callback_bt_spectrogram,
                              description_on = 'On',
                              description_off = 'Off',
                              state=False,
                              button_id=0)
        
        """Create a widget for selecting the FFT size."""        
        def callback_dd_fftsize(value):
            self.fft_size = value
        
        self.dd_fftsize = qw.DropDown(callback=callback_dd_fftsize,
                                      options=[('64', 64),
                                               ('128', 128),
                                               ('256', 256),
                                               ('512', 512),
                                               ('1024', 1024),
                                               ('2048', 2048),
                                               ('4096', 4096),
                                               ('8192', 8192)],
                                      value = 4096,
                                      description = 'FFT Size:')
        
        """Create a widget for selecting the Spectrum Type."""
        def callback_dd_spectrumtype(value):
            self.spectrum_type = value
            
        self.dd_spectrumtype = qw.DropDown(callback=callback_dd_spectrumtype,
                                           options=[('Power Spectrum'),
                                                    ('Power Spectral Density')],
                                           value='Power Spectrum',
                                           description='Spectrum Type:')
        
        """Create a widget for selecting the Spectrum Units."""
        def callback_dd_spectrumunits(value):
            self.spectrum_units = value
            
        self.dd_spectrumunits = qw.DropDown(callback=callback_dd_spectrumunits,
                                           options=[('dBW'),
                                                    ('dBm')],
                                           value='dBW',
                                           description='Spectrum Units:')
        
        """Create a widget for selecting the window type."""
        def callback_dd_windowtype(value):
            self.spectrum_window = value
            
        self.dd_windowtype = qw.DropDown(callback=callback_dd_windowtype,
                                         options=[('Rectangular', 'rectangular'),
                                                  ('Bartlett', 'bartlett'),
                                                  ('Blackman', 'blackman'),
                                                  ('Hamming', 'hamming'),
                                                  ('Hanning', 'hanning')],
                                         value='rectangular',
                                         description='')
        
        """Create a figure using plotly to display the selected window."""
        layout = {
            'hovermode' : 'closest',
            'height' : 225,
            'width' : 300,
            'margin' : {
                't':0, 'b':20, 'l':0, 'r':0
            },
            'showlegend' : False,
        }
        self.window_plot = go.FigureWidget(layout=layout,
                                           data=[{
                                               'x': np.arange(self.window_packetsize),
                                               'y': np.ones(self.window_packetsize)}])
        self.window_plot.data[0].marker.color = '#005d95'
        
        """Create a dropdown for plot update type."""
        def callback_dd_updatetype(value):
            if value == 0:
                self.plot.hold_max = False
            if value == 1:
                self.plot.hold_max = True
        
        self.dd_updatetype = qw.DropDown(callback=callback_dd_updatetype,
                                         options=[('Continuous Update', 0),
                                                  ('Maximum Hold', 1)],
                                         value=0,
                                         description='Update Type:')
        
        """Create a dropdown for the displaymode."""
        def callback_dd_displaymode(value):
            self.plot.display_mode = value
        
        self.dd_displaymode = qw.DropDown(callback=callback_dd_displaymode,
                                         options=[('Double-Sided', 0),
                                                  ('Single-Sided', 1)],
                                         value=0,
                                         description='Display Mode:')
        
        """Create a widget for nyquist stopband selection."""
        def callback_ft_nstopband(value):
            self.plot.nyquist_stopband = value
            
        self.ft_nstopband = qw.FloatText(value=0.8,
                                   min_value=0.5,
                                   max_value=1.0,
                                   step=0.01,
                                   description='Nyquist Stopband (%):',
                                   callback=callback_ft_nstopband)
        
        """Create a widget for plot width selection."""
        def callback_ft_width(value):
            self.plot.width = value
            self.spectrogram.width = value
            
        self.ft_width = qw.FloatText(value=self.plot.width,
                                   min_value=400,
                                   max_value=4096,
                                   step=1,
                                   description='Plot Width (Px):',
                                   callback=callback_ft_width)
        
        """Create a widget for plot height selection."""
        def callback_ft_height(value):
            self.plot.height = value
            self.spectrogram.height = value
            
        self.ft_height = qw.FloatText(value=self.plot.height,
                                   min_value=200,
                                   max_value=2160,
                                   step=1,
                                   description='Plot Height (Px):',
                                   callback=callback_ft_height)
        
        """Create Plot accordion for holding plot related properties."""
        self.ac_plot = qw.Accordion(title='Plot Settings',
                                    widgets=[self.dd_updatetype.get_widget(),
                                             self.dd_displaymode.get_widget(),
                                             self.ft_nstopband.get_widget(),
                                             self.ft_width.get_widget(),
                                             self.ft_height.get_widget()])
        
        """Create Spectrum Window accordion for holding window plot and dropdown selector."""
        self.ac_window = qw.Accordion(title='Window',
                                      widgets=[self.window_plot,
                                               self.dd_windowtype.get_widget()])
        
        """Create accordion for holding control widgets."""
        self.ac_control = qw.Accordion(title='Spectrum Analyser',
                                       widgets=[self.dd_fftsize.get_widget(),
                                                self.dd_spectrumtype.get_widget(),
                                                self.dd_spectrumunits.get_widget()])
        
        """Create spectrum analyser."""
        self.analyser = ipw.HBox([ipw.VBox([self.ac_control.get_widget(),
                                             self.ac_window.get_widget()]),
                                   self.plot.get_plot(),
                                   self.bt_plotting.get_widget()],
                                   layout=ipw.Layout(width='auto', height='auto'))
        
    @property
    def centre_frequency(self):
        return self._centre_frequency
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        self._centre_frequency = centre_frequency
        self.plot.centre_frequency = centre_frequency
        self.spectrogram.centre_frequency = centre_frequency
        
    @property
    def spectrum_units(self):
        if self._spectrum_units:
            return 'dBm'
        else:
            return 'dBW'
        
    @spectrum_units.setter
    def spectrum_units(self, spectrum_units):
        if spectrum_units == 'dBm':
            self._spectrum_units = 1
        elif spectrum_units == 'dBW':
            self._spectrum_units = 0
        self.spectrum_type = self.spectrum_type
        
    @property
    def spectrum_type(self):
        if self._spectrum_type:
            return 'Power Spectrum'
        else:
            return 'Power Spectral Density'
    
    @spectrum_type.setter
    def spectrum_type(self, spectrum_type):
        if spectrum_type == 'Power Spectrum':
            self.plot.clear_plot()
            self._spectrum_type = 1
            self.plot.ylabel = ''.join([spectrum_type, ' (', self.spectrum_units, ')'])
            self.plot._plot.layout.yaxis.range = [-150 + self._spectrum_units*30, 0 + self._spectrum_units*30]
        elif spectrum_type == 'Power Spectral Density':
            self.plot.clear_plot()
            self._spectrum_type = 0
            self.plot.ylabel = ''.join([spectrum_type, ' (', self.spectrum_units, ')'])
            self.plot._plot.layout.yaxis.range = [-210 + self._spectrum_units*30, -60 + self._spectrum_units*30]     
        
    @property
    def update_frequency(self):
        return self.timer.update_frequency
    
    @update_frequency.setter
    def update_frequency(self, update_frequency):
        if update_frequency > 10:
            self.timer.update_frequency = 10
        elif update_frequency < 1:
            self.timer.update_frequency = 1
        else:
            self.timer.update_frequency = update_frequency
            
    @property
    def fft_size(self):
        return int(2**(self.spectrum_fftselector+6))
    
    @fft_size.setter
    def fft_size(self, fft_size):
        if fft_size in [8192, 4096, 2048, 1024, 512, 256, 128, 64]:
            running = False
            if self.dma_enable:
                self.dma_enable = 0
                running = True
            self.set_fftsize(fft_size)
            self.plot.number_samples = fft_size
            self._number_samples = int(2**(self.spectrum_fftselector+6))
            self.spectrum_typescale = \
                int(struct.unpack('!i',struct.pack('!f',float(self._sample_frequency/(self._number_samples))))[0])
            self.spectrum_powerscale = \
                int(struct.unpack('!i',struct.pack('!f',float(1/(self._sample_frequency*self.window_squaresum))))[0])
            if running:
                self.dma_enable = 1
                
    @property
    def spectrum_window(self):
        return self.window_type
    
    @spectrum_window.setter
    def spectrum_window(self, window):
        self.set_window(window_type=window)
        self.spectrum_typescale = \
            int(struct.unpack('!i',struct.pack('!f',float(self._sample_frequency/(self._number_samples))))[0])
        self.spectrum_powerscale = \
            int(struct.unpack('!i',struct.pack('!f',float(1/(self._sample_frequency*self.window_squaresum))))[0])
        self.window_plot.data[0].x = np.arange(self.window_packetsize)
        self.window_plot.data[0].y = self.get_window()
        
    @property
    def dma_enable(self):
        return self.__dma_enable
    
    @dma_enable.setter
    def dma_enable(self, dma_enable):
        self._dma_enable = dma_enable
        self.__dma_enable = dma_enable
        
    @property
    def sample_frequency(self):
        return self._sample_frequency
    
    @sample_frequency.setter
    def sample_frequency(self, sample_frequency):
        self._sample_frequency = sample_frequency
        self.plot.sample_frequency = sample_frequency
        self.spectrogram.sample_frequency = sample_frequency
        
    @property
    def nyquist_stopband(self):
        return self._nyquist_stopband
    
    @nyquist_stopband.setter
    def nyquist_stopband(self, nyquist_stopband):
        self._nyquist_stopband = nyquist_stopband
        self.plot.nyquist_stopband = nyquist_stopband
        self.spectrogram.nyquist_stopband = nyquist_stopband
        
    def get_analyser(self):
        return self.analyser
    
    def get_window(self):
        """Return numpy array
        
        Get the window used in the preprocessing core."""
        window_type = self.window_type
        window_size = self.window_packetsize
        if window_type == 'rectangular':
            buffer = np.array(np.ones(window_size)[:], dtype=np.single)
        elif window_type == 'bartlett':
            buffer = np.array(np.bartlett(window_size)[:], dtype=np.single)
        elif window_type == 'blackman':
            buffer = np.array(np.blackman(window_size)[:], dtype=np.single)
        elif window_type == 'hamming':
            buffer = np.array(np.hamming(window_size)[:], dtype=np.single)
        elif window_type == 'hanning':
            buffer = np.array(np.hanning(window_size)[:], dtype=np.single)
        else:
            buffer = np.array(np.ones(window_size)[:], dtype=np.single)
        return buffer
        
    def set_window(self, window_type='rectangular'):
        """Return void
        
        Set the window used in the preprocessing core. Current selection
        are predefined numpy windows."""
        window_size = self.window_packetsize
        buffer = allocate(shape=(window_size,), dtype=np.int32)
        self.window_address = buffer.device_address
        if window_type == 'rectangular':
            buffer[:] = np.int32(np.ones(window_size)[:]*2**14)
        elif window_type == 'bartlett':
            buffer[:] = np.int32(np.bartlett(window_size)[:]*2**14)
        elif window_type == 'blackman':
            buffer[:] = np.int32(np.blackman(window_size)[:]*2**14)
        elif window_type == 'hamming':
            buffer[:] = np.int32(np.hamming(window_size)[:]*2**14)
        elif window_type == 'hanning':
            buffer[:] = np.int32(np.hanning(window_size)[:]*2**14)
        else:
            buffer[:] = np.int32(np.ones(window_size)[:]*2**14)
            window_type = 'rectangular'
        self.window_transfer = 1
        while not self.window_ready:
            pass
        self.window_transfer = 0
        self.window_type = window_type
        self.window_squaresum = np.sum((np.array(buffer, dtype=np.single)*2**-14)**2)
        self.window_sum = np.sum((np.array(buffer, dtype=np.single)))
        buffer.freebuffer()
        
    def set_fftsize(self, fftsize=4096):
        """Return void
        
        Set the desired FFT size. The core is configured to output the desired
        FFT size. The auto DMA buffer is destroyed and regenerated."""               
        # Disable the SSR Converter
        self.ssr_packetsize = 0
        # Set DMA registers and buffers for new size
        self.dma_length = fftsize
        [self.buffer[x].freebuffer() for x in range(0, 3)]
        self.buffer = [allocate(shape=(self.dma_length,), dtype=np.single) for x in range(0, 3) ]
        self.dma_bufferaddress_0 = self.buffer[0].device_address
        self.dma_bufferaddress_1 = self.buffer[1].device_address
        self.dma_bufferaddress_2 = self.buffer[2].device_address
        # Change the FFT Size
        self.spectrum_fftselector = int(np.log2(fftsize)-6)
        # Setup the new window
        self.window_packetsize = fftsize
        self.spectrum_window = self.window_type
        # Enable the SSR Converter with the new packetsize
        self.ssr_packetsize = int(fftsize/8)
        
    def get_frame(self):
        """Return a numpy array single precision
        
        Retrieves a frame of data from memory using the last known
        pointer in hardware."""
        while not self.dma_enable:
            time.sleep(0.1)
            pass
        frame = np.array(self.buffer[self.dma_bufferpointer], dtype=np.single)
        while not frame.any():
            frame = np.array(self.buffer[self.dma_bufferpointer], dtype=np.single)
        return frame
        
    bindto = ['xilinx.com:ip:SpectrumAnalyser:1.0']
    
_spectrumAnalyser_props = [("ssr_packetsize",        0x100),
                           ("ssr_mode",              0x104),
                           ("_spectrum_units",       0x108),
                           ("_spectrum_type",        0x10C),
                           ("_spectrum_vrms",        0x110),
                           ("spectrum_typescale",   0x114),
                           ("spectrum_powerscale",  0x118),
                           ("spectrum_fftselector", 0x11C),
                           ("window_packetsize",    0x120),
                           ("window_address",       0x124),
                           ("window_transfer",      0x128),
                           ("dma_length",           0x12C),
                           ("dma_bufferaddress_0",  0x130),
                           ("dma_bufferaddress_1",  0x134),
                           ("dma_bufferaddress_2",  0x138),
                           ("_dma_enable",          0x13C),
                           ("_dma_count",           0x140),
                           ("window_ready",         0x144),
                           ("dma_bufferpointer",    0x148),
                           ("dma_status",           0x14C)]

def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
    
    def _set(self, value):
        self.write(addr, value)
        
    return property(_get, _set)

for (name, addr) in _spectrumAnalyser_props:
    setattr(SpectrumAnalyser, name, _create_mmio_property(addr))
                                  
class FunctionTimer():
    """Thread timer class"""
    def __init__(self,
                 plot,
                 dma,
                 update_frequency):
        
        self._plot = plot
        self._time = float(1/update_frequency)
        self._dma = dma
        self.stopping = True
        self.stopped = True
        
    @property
    def update_frequency(self):
        return float(1/self._time)
    
    @update_frequency.setter
    def update_frequency(self, update_frequency):
        self._time = float(1/update_frequency)
        
    def _do(self):
        while not self.stopping:
            next_timer = time.time() + self._time
            self._plot.data = self._dma.get_frame()
            sleep_time = next_timer - time.time()
            if sleep_time > 0:
                time.sleep(sleep_time)
        self.stopped = True
                
    def start(self):
        if self.stopping:
            self.stopping = False
            self.stopped = False
            thread = threading.Thread(target=self._do)
            thread.start()
            
    def stop(self):
        self.stopping = True
    
class FastFigureWidget(go.FigureWidget):
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
    @contextmanager
    def _fast_batch_anim(self, duration=0, easing="linear"):
        """Our own copy of basedatatypes.py batch_animate"""
        duration = self._animation_duration_validator.validate_coerce(duration)
        easing = self._animation_easing_validator.validate_coerce(easing)

        if self._in_batch_mode is True:
            yield
        else:
            try:
                self._in_batch_mode = True
                yield
            finally:
                self._in_batch_mode = False
                self._perform_batch_animate({
                    'transition': {
                        'duration': duration,
                        'easing': easing
                    },
                    'frame': {
                        'duration': duration,
                        'redraw': False,
                    },
                    'mode': 'immediate'
                })

class SpectrumPlot():
    def __init__(self,
                 plot_data,
                 sample_frequency,
                 number_samples,
                 centre_frequency=0,
                 nyquist_stopband=1,
                 xlabel='Frequency (Hz)',
                 ylabel='Amplitude',
                 plot_width=800,
                 plot_height=400,
                 display_mode=0,
                 spectrum_mode=True,
                 animation_duration=0):
    
        self._y_data = plot_data
        self._sample_frequency = sample_frequency
        self._number_samples = number_samples
        self._centre_frequency = centre_frequency
        self._rbw = self._sample_frequency/self._number_samples
        self._upper_limit = self._sample_frequency/2
        self._lower_limit = -self._sample_frequency/2
        self._xlabel = xlabel
        self._ylabel = ylabel
        self._x_data = np.arange(self._lower_limit, self._upper_limit, self._rbw) + self._centre_frequency
        self._range = (min(self._x_data), max(self._x_data))
        self._display_mode = display_mode
        self._spectrum_mode = spectrum_mode
        self._nyquist_stopband = nyquist_stopband
        self._animation_duration = animation_duration
        self.hold_max = False
        
        layout = {
            'hovermode' : 'closest',
            'height' : np.ceil(plot_height),
            'width' : np.ceil(plot_width),
            'xaxis' : {
                'title' : self._xlabel,
                'showticklabels' : True,
                'autorange' : True
            },
            'yaxis' : {
                'title' : self._ylabel,
                'range' : [-150, 0],
                'autorange' : False
            },
            'margin' : {
                't':25,
                'b':25,
                'l':25,
                'r':25
            },
            'showlegend' : False,
        }

        self._plot = FastFigureWidget(
            layout=layout,
            data=[{
                'x': self._x_data,
                'y': self._y_data,
            }])
        
        self.clear_plot()
        self.update_x_limits()
        self.update_x_axis()
    
    """ Display Mode
    """
    @property
    def display_mode(self):
        return self._display_mode
    
    @display_mode.setter
    def display_mode(self, display_mode):
        if display_mode in [0, 1]:
            self._display_mode = display_mode
            self.update_x_limits()
            self.update_x_axis()
        
    """ Centre Frequency
    """
    @property
    def centre_frequency(self):
        return self._centre_frequency
        
    @centre_frequency.setter
    def centre_frequency(self, fc):
        self._centre_frequency = fc
        self.update_x_axis()
    
    """ Sample Frequency
    """
    @property
    def sample_frequency(self):
        return self._sample_frequency
        
    @sample_frequency.setter
    def sample_frequency(self, fs):
        self._sample_frequency = fs
        self._rbw = self._sample_frequency/self._number_samples
        self.clear_plot()
        self.update_x_limits()
        self.update_x_axis()
    
    """ Plot Data
    """
    @property
    def data(self):
        return self._y_data
        
    @data.setter
    def data(self, data):
        
        def maximum_hold(old_data, new_data):
            return (old_data > new_data) * old_data + (old_data < new_data) * new_data
        
        if self._spectrum_mode:
            fdata = np.fft.fftshift(data)
        else:
            fdata = data
        
        if self._display_mode == 0:
            self._y_data = fdata[int(np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))) \
                               :int(self._number_samples - int(np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))))]
        elif self._display_mode == 1:
            self._y_data = fdata[int(np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))) \
                               :int(self._number_samples/2)]
        else:
            pass
        
        if self.hold_max:
            self._y_data = maximum_hold(self._plot.data[0].y, self._y_data)
            
        self._plot.data[0].y = self._y_data
    
    """ X Label
    """
    @property
    def xlabel(self):
        return self._xlabel
        
    @xlabel.setter
    def xlabel(self, xlabel):
        self._xlabel = xlabel
        self._plot.layout.xaxis = {'title':{'text':self._xlabel}}
    
    """ Y Label
    """
    @property
    def ylabel(self):
        return self._ylabel
        
    @ylabel.setter
    def ylabel(self, ylabel):
        self._ylabel = ylabel
        self._plot.layout.yaxis = {'title':{'text':self._ylabel}}
        
    """ Nyquist Stopband
    """
    @property
    def nyquist_stopband(self):
        return self._nyquist_stopband
    
    @nyquist_stopband.setter
    def nyquist_stopband(self, stopband):
        self._nyquist_stopband = stopband
        self.update_x_limits()
        self.update_x_axis()
        
    """ Plot Width
    """
    @property
    def width(self):
        return self._plot.layout.width
    
    @width.setter
    def width(self, width):
        self._plot.layout.width = width
        
    """ Plot Height
    """
    @property
    def height(self):
        return self._plot.layout.height
    
    @height.setter
    def height(self, height):
        self._plot.layout.height = height
        
    """ Number Samples
    """
    @property
    def number_samples(self):
        return self._number_samples
    
    @number_samples.setter
    def number_samples(self, number_samples):
        self._number_samples = number_samples
        self._rbw = self._sample_frequency/self._number_samples
        self.clear_plot()
        self.update_x_limits()
        self.update_x_axis()
        
    def clear_plot(self):
        zeros = np.zeros(self._number_samples, dtype=np.single) - 300
        zdata = zeros[int(np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))) \
                               :int(self._number_samples - int(np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))))]
        self._plot.data[0].y = zdata
        
    def update_x_limits(self):
        """ Updates the x-axis limits. Does not update the
        frequency plot.
        """
        if self._display_mode == 0:
            self._upper_limit = (self._sample_frequency/2)-self._rbw* \
                np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))
            self._lower_limit = -(self._sample_frequency/2)+self._rbw* \
                np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))
        elif self._display_mode == 1:
            self._upper_limit = 0
            self._lower_limit = -(self._sample_frequency/2)+self._rbw* \
                np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))
        else:
            pass
        
    def update_x_axis(self):
        """ Updates the x-axis of the frequency plot.
        """
        self._x_data = np.arange(self._lower_limit, self._upper_limit, self._rbw) + self._centre_frequency
        self._range = (min(self._x_data), max(self._x_data))
        self._plot.layout.xaxis.range = self._range
        self._plot.data[0].x = self._x_data            
        
    def get_plot(self):
        return self._plot
    
class SpectrogramPlot():
    def __init__(self,
                 width=800,
                 height=400,
                 centre_frequency=0,
                 sample_frequency=2048e6,
                 nyquist_stopband=1,
                 ypixel=2,
                 plot_time=20,
                 zmin=-140,
                 zmax=0,
                 display_mode=0):
        
        self._width = width
        self._height = height
        self._sample_frequency = sample_frequency
        self._centre_frequency = centre_frequency
        self._nyquist_stopband = nyquist_stopband
        self._ypixel = ypixel
        self._data = np.ones((self._height, self._width), dtype=np.uint8)*128
        
        self._image_x = -self._sample_frequency/2 + self._centre_frequency
        self._image_y = 0
        self._lower_limit = (-self._sample_frequency/2) * self._nyquist_stopband + self._centre_frequency
        self._upper_limit = (self._sample_frequency/2) * self._nyquist_stopband + self._centre_frequency
        
        self._plot_time = plot_time
        self.zmin = zmin
        self.zmax = zmax
        self._display_mode = display_mode
        
        self._plot = go.FigureWidget(layout={
            'height' : self._height,
            'width' : self._width,
            'yaxis' : {
                'showgrid' : False,
                'range' : [-self._plot_time, 0],
                'autorange' : False,
                'title' : 'Time (s)',
            },
            'xaxis' : {
                'zeroline': False,
                'showgrid' : False,
                'range' : [self._lower_limit, self._upper_limit],
                'autorange' : False,
                'title' : 'Frequency (Hz)',
            },
            'margin' : {
                't':25,
                'b':25,
                'l':25,
                'r':25,
        }})
        
        img = Image.fromarray(self._data, 'L')
        self._plot.add_layout_image(
            dict(
                source=img,
                xref="x",
                yref="y",
                x=self._image_x,
                y=self._image_y,
                sizex=self._sample_frequency,
                sizey=self._plot_time,
                sizing='stretch',
                opacity=1,
                layer="below")
        )
        
        self._update_image()
        
    @property
    def data(self):
        return self._data[0][:]
    
    @data.setter
    def data(self, data):
        value = np.fft.fftshift(data) # FFT Shift
        value = np.array(np.interp(value, (self.zmin, self.zmax), (0, 255)), dtype=np.single) # Scale Z-Axis
        value = np.resize(signal.resample(value, self._width), (1, self._width)) # Resample X-Axis
        value = np.repeat(value, self._ypixel, 0) # Repeat Y-Axis
        self._data = np.roll(self._data, self._ypixel, 0) # Roll data
        self._data[0:self._ypixel, :] = value # Update first line
        img = Image.fromarray(self._data, 'L') # Create image
        self._plot.update_layout_images({'source' : img}) # Set as background
        
    @property
    def ypixel(self):
        return self._ypixel
    
    @ypixel.setter
    def ypixel(self, ypixel):
        self._ypixel = ypixel
        
    @property
    def sample_frequency(self):
        return self._sample_frequency
    
    @sample_frequency.setter
    def sample_frequency(self, sample_frequency):
        self._sample_frequency = sample_frequency
        self._update_image()
        
    @property
    def nyquist_stopband(self):
        return self._nyquist_stopband
    
    @nyquist_stopband.setter
    def nyquist_stopband(self, nyquist_stopband):
        self._nyquist_stopband = nyquist_stopband
        self._update_image()
        
    @property
    def centre_frequency(self):
        return self._centre_frequency
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        self._centre_frequency = centre_frequency
        self._update_image()
        
    @property
    def display_mode(self):
        return self._display_mode
    
    @display_mode.setter
    def display_mode(self, display_mode):
        self._display_mode = display_mode
        self._update_image()

    @property
    def width(self):
        return self._plot.layout.width
    
    @width.setter
    def width(self, width):
        self._plot.layout.width = width

    @property
    def height(self):
        return self._plot.layout.height
    
    @height.setter
    def height(self, height):
        self._plot.layout.height = height
        
    def _update_image(self):
        if self._display_mode:
            self._lower_limit = (-self._sample_frequency/2) * self._nyquist_stopband + self._centre_frequency 
            self._upper_limit = self._centre_frequency
        else:
            self._lower_limit = (-self._sample_frequency/2) * self._nyquist_stopband + self._centre_frequency 
            self._upper_limit = (self._sample_frequency/2) * self._nyquist_stopband + self._centre_frequency
        self._image_x = -self._sample_frequency/2 + self._centre_frequency
        self._plot.update_layout({'xaxis': {
                                  'range' : [self._lower_limit ,self._upper_limit]
        }})
        self._data = np.ones((self._height, self._width), dtype=np.uint8)*128
        img = Image.fromarray(self._data, 'L')
        self._plot.update_layout_images({'source' : img})
        self._plot.update_layout_images({'x' : self._image_x})
        self._plot.update_layout_images({'sizex' : self._sample_frequency})
    
    def get_plot(self):
        return self._plot