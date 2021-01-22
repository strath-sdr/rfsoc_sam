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

import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

class SpectrumAnalyser(DefaultIP):
    """The Spectrum Analyser object."""
    def __init__(self,
                 description,
                 sample_frequency = 2048e6,
                 update_frequency = 10,
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
        self._dma_count = 20000000 # No touchy
        
        """Initialise"""
        self._sample_frequency = int(sample_frequency)
        self._update_frequency = update_frequency
        self._last_buffer = np.zeros(self.dma_length, dtype=np.single) - 300
        self._number_samples = int(2**(self.spectrum_fftselector+6))
        self._centre_frequency = centre_frequency
        self._nyquist_stopband = nyquist_stopband
        self._width = plot_width
        self._height = plot_height
        
        """Set plotly dark mode as default"""
        self.plot_theme = 'plotly'
        
        """Create Spectrum Plot object for presenting the frequency spectrum."""
        self.plot = SpectrumPlot(plot_data=np.zeros((self._number_samples,), dtype=np.single),
                                  sample_frequency=self._sample_frequency,
                                  number_samples=self._number_samples,
                                  centre_frequency=self._centre_frequency,
                                  nyquist_stopband=self._nyquist_stopband,
                                  xlabel='Frequency (Hz)',
                                  ylabel='Power Spectrum (dBW)',
                                  plot_width=self._width,
                                  plot_height=self._height,
                                  display_mode=0,
                                  spectrum_mode=True,
                                  animation_duration=0)
        
        """Create Spectrogram Plot object for presenting the waterfall spectrum."""
        self.spectrogram = SpectrogramPlot(sample_frequency=self._sample_frequency,
                                           centre_frequency=self._centre_frequency,
                                           nyquist_stopband=self._nyquist_stopband,
                                           width=self._width,
                                           height=self._height,
                                           plot_time=10,)
        
        """Create a Function Timer object to enable plot data updates through threading."""
        self.timer = FunctionTimer(plot=[self.plot, self.spectrogram],
                                    dma=self,
                                    update_frequency=self._update_frequency)

    @property
    def width(self):
        return self._width
    
    @width.setter
    def width(self, width):
        self._width = width
        self.plot.width = width
        self.spectrogram.width = width
        
    @property
    def height(self):
        return self._height
    
    @height.setter
    def height(self, height):
        self._height = height
        self.plot.height = height
        self.spectrogram.height = height
        
    @property
    def plotly_theme(self):
        return pio.templates.default
    
    @plotly_theme.setter
    def plotly_theme(self, theme):
        if theme in ['seaborn', 'simple_white', 'plotly', 
                     'plotly_white', 'plotly_dark']:
            pio.templates.default = theme
            self.plot._plot.layout.template = theme
            self.spectrogram._plot.layout.template = theme
        
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
            self.ssr_packetsize = 0
            self.dma_length = fft_size
            [self.buffer[x].freebuffer() for x in range(0, 3)]
            self.buffer = [allocate(shape=(self.dma_length,), dtype=np.single) for x in range(0, 3) ]
            self.dma_bufferaddress_0 = self.buffer[0].device_address
            self.dma_bufferaddress_1 = self.buffer[1].device_address
            self.dma_bufferaddress_2 = self.buffer[2].device_address
            self.spectrum_fftselector = int(np.log2(fft_size)-6)
            self.window_packetsize = fft_size
            self.window = self.window_type
            self.ssr_packetsize = int(fft_size/8)
            self.plot.number_samples = fft_size
            self._number_samples = int(2**(self.spectrum_fftselector+6))
            self.spectrum_typescale = \
                int(struct.unpack('!i',struct.pack('!f',float(self._sample_frequency/(self._number_samples))))[0])
            self.spectrum_powerscale = \
                int(struct.unpack('!i',struct.pack('!f',float(1/(self._sample_frequency*self.window_squaresum))))[0])
            if running:
                self.dma_enable = 1
      
    @property
    def window(self):
        return self.window_type
    
    @window.setter
    def window(self, window):
        window_size = self.window_packetsize
        buffer = allocate(shape=(window_size,), dtype=np.int32)
        self.window_address = buffer.device_address
        if window == 'rectangular':
            buffer[:] = np.int32(np.ones(window_size)[:]*2**14)
        elif window == 'bartlett':
            buffer[:] = np.int32(np.bartlett(window_size)[:]*2**14)
        elif window == 'blackman':
            buffer[:] = np.int32(np.blackman(window_size)[:]*2**14)
        elif window == 'hamming':
            buffer[:] = np.int32(np.hamming(window_size)[:]*2**14)
        elif window == 'hanning':
            buffer[:] = np.int32(np.hanning(window_size)[:]*2**14)
        else:
            buffer[:] = np.int32(np.ones(window_size)[:]*2**14)
            window = 'rectangular'
        self.window_transfer = 1
        while not self.window_ready:
            pass
        self.window_transfer = 0
        self.window_type = window
        self.window_squaresum = np.sum((np.array(buffer, dtype=np.single)*2**-14)**2)
        self.window_sum = np.sum((np.array(buffer, dtype=np.single)))
        buffer.freebuffer()
        self.spectrum_typescale = \
            int(struct.unpack('!i',struct.pack('!f',float(self._sample_frequency/(self._number_samples))))[0])
        self.spectrum_powerscale = \
            int(struct.unpack('!i',struct.pack('!f',float(1/(self._sample_frequency*self.window_squaresum))))[0])
        
    @property
    def spectrum_window(self):
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
        
    @property
    def zmin(self):
        return self.spectrogram.zmin
    
    @zmin.setter
    def zmin(self, zmin):
        self.spectrogram.zmin = zmin
        
    @property
    def zmax(self):
        return self.spectrogram.zmax
    
    @zmax.setter
    def zmax(self, zmax):
        self.spectrogram.zmax = zmax
        
    @property
    def quality(self):
        return self.spectrogram.quality
    
    @quality.setter
    def quality(self, quality):
        self.spectrogram.quality = quality
        
    def get_frame(self):
        """Return a numpy array single precision
        
        Retrieves a frame of data from memory using the last known
        pointer in hardware."""
        while not self.dma_enable:
            pass
        return np.array(self.buffer[self.dma_bufferpointer], dtype=np.single)
        
    bindto = ['xilinx.com:ip:SpectrumAnalyser:1.0']
    
_spectrumAnalyser_props = [("ssr_packetsize",       0x104),
                           ("ssr_mode",             0x108),
                           ("_spectrum_units",      0x10C),
                           ("_spectrum_type",       0x110),
                           ("_spectrum_vrms",       0x114),
                           ("spectrum_typescale",   0x118),
                           ("spectrum_powerscale",  0x11C),
                           ("spectrum_fftselector", 0x120),
                           ("window_packetsize",    0x124),
                           ("window_address",       0x128),
                           ("window_transfer",      0x12C),
                           ("dma_length",           0x130),
                           ("dma_bufferaddress_0",  0x134),
                           ("dma_bufferaddress_1",  0x138),
                           ("dma_bufferaddress_2",  0x13C),
                           ("_dma_enable",          0x140),
                           ("_dma_count",           0x144),
                           ("window_ready",         0x148),
                           ("dma_bufferpointer",    0x14C),
                           ("dma_status",           0x150)]

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
            data = self._dma.get_frame()
            if data.any():
                for plot in self._plot:
                    plot.data = data
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
        self.enable_updates = False
        
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

        self._plot = go.FigureWidget(
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
        
        if self.enable_updates:
        
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
        
        self._plot_time = self._height
        self.zmin = zmin
        self.zmax = zmax
        self._display_mode = display_mode
        self.enable_updates = False
        
        self._plot = go.FigureWidget(layout={
            'height' : self._height,
            'width' : self._width,
            'yaxis' : {
                'showgrid' : False,
                'range' : [-self._plot_time, 0],
                'autorange' : False,
                'title' : 'Frame Number',
                'showticklabels': True
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
        if self.enable_updates:
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
        
    @property
    def quality(self):
        return int(101-self._ypixel)
    
    @quality.setter
    def quality(self, quality):
        if quality in range(80, 101):
            self._ypixel = int(101-quality)
            self._plot_time = np.ceil(self._height/self._ypixel)
            self._plot.update_layout({'yaxis': {
                'range' : [-self._plot_time, 0]
            }})
            self._plot.update_layout_images({'sizey' : self._plot_time})
            self._update_image()
        
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