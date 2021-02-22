__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

import ipywidgets as ipw
import numpy as np
import plotly.graph_objs as go
import warnings
from PIL import Image
from scipy import signal
warnings.simplefilter(action='ignore', category=FutureWarning)


class Spectrum():
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
                 spectrum_mode=True):
    
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
            data=[{'x': self._x_data,
                   'y': self._y_data,
                   'line' : {
                       'color' : 'palevioletred',
                       'width' : 0.75
                   },
                  },
                  {'x': self._x_data,
                   'y': np.zeros(self._number_samples) - 300,
                   'fill' : 'tonexty',
                   'fillcolor' : 'rgba(128, 128, 128, 0.5)'
                }
            ])
        
        self.clear_plot()
        self.update_x_limits()
        self.update_x_axis()
        
    @property
    def line_colour(self):
        return self._plot.data[0].line.color
    
    @line_colour.setter
    def line_colour(self, line_colour):
        self._plot.data[0].line.color = line_colour
        
    @property
    def line_fill(self):
        return self._plot.data[1].fillcolor
    
    @line_fill.setter
    def line_fill(self, line_fill):
        self._plot.data[1].fillcolor = line_fill
        
    @property
    def yrange(self):
        return self._plot.layout.yaxis.range
    
    @yrange.setter
    def yrange(self, yrange):
        self._plot.layout.yaxis.range = yrange
        
    @property
    def template(self):
        return self._plot.layout.template
    
    @template.setter
    def template(self, template):
        self._plot.layout.template = template
    
    @property
    def display_mode(self):
        return self._display_mode
    
    @display_mode.setter
    def display_mode(self, display_mode):
        if display_mode in [0, 1]:
            self._display_mode = display_mode
            self.update_x_limits()
            self.update_x_axis()
        
    @property
    def centre_frequency(self):
        return self._centre_frequency
        
    @centre_frequency.setter
    def centre_frequency(self, fc):
        self._centre_frequency = fc
        self.update_x_axis()
    
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

            self._plot.data[0].update({'x':self._x_data, 'y':self._y_data})
    
    @property
    def xlabel(self):
        return self._xlabel
        
    @xlabel.setter
    def xlabel(self, xlabel):
        self._xlabel = xlabel
        self._plot.layout.xaxis = {'title':{'text':self._xlabel}}
    
    @property
    def ylabel(self):
        return self._ylabel
        
    @ylabel.setter
    def ylabel(self, ylabel):
        self._ylabel = ylabel
        self._plot.layout.yaxis = {'title':{'text':self._ylabel}}
        
    @property
    def nyquist_stopband(self):
        return self._nyquist_stopband
    
    @nyquist_stopband.setter
    def nyquist_stopband(self, stopband):
        self._nyquist_stopband = stopband
        self.update_x_limits()
        self.update_x_axis()

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
        self._x_data = np.arange(self._lower_limit, self._upper_limit, self._rbw) + self._centre_frequency
        self._range = (min(self._x_data), max(self._x_data))
        self._plot.layout.xaxis.range = self._range
        self._plot.data[0].update({'x':self._x_data, 'y':self._y_data})
        self._plot.data[1].update({'x':self._x_data, 'y':np.zeros(self._number_samples) - 300})
        
    def get_plot(self):
        return self._plot


class Spectrogram():
    def __init__(self,
                 width=800,
                 height=400,
                 image_width=400,
                 image_height=200,
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
        self._image_width = image_width
        self._image_height = image_height
        self._sample_frequency = sample_frequency
        self._centre_frequency = centre_frequency
        self._nyquist_stopband = nyquist_stopband
        self._ypixel = ypixel
        self._data = np.ones((self._image_height, self._image_width), dtype=np.uint8)*128
        
        self._image_x = -self._sample_frequency/2 + self._centre_frequency
        self._image_y = 0
        self._lower_limit = (-self._sample_frequency/2) * self._nyquist_stopband + self._centre_frequency
        self._upper_limit = (self._sample_frequency/2) * self._nyquist_stopband + self._centre_frequency
        
        self._plot_time = self._image_height
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
    def template(self):
        return self._plot.layout.template
    
    @template.setter
    def template(self, template):
        self._plot.layout.template = template
        
    @property
    def data(self):
        return self._data[0][:]
    
    @data.setter
    def data(self, data):
        if self.enable_updates:
            value = np.fft.fftshift(data) # FFT Shift
            value = np.array(np.interp(value, (self.zmin, self.zmax), (0, 255)), dtype=np.single) # Scale Z-Axis
            value = np.resize(signal.resample(value, self._image_width), (1, self._image_width)) # Resample X-Axis
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
            self._plot_time = np.ceil(self._image_height/self._ypixel)
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
        self._data = np.ones((self._image_height, self._image_width), dtype=np.uint8)*128
        img = Image.fromarray(self._data, 'L')
        self._plot.update_layout_images({'source' : img,
                                         'x' : self._image_x,
                                         'sizex' : self._sample_frequency})
    
    def get_plot(self):
        return self._plot