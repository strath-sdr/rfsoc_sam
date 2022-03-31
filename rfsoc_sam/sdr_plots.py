__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

import ipywidgets as ipw
import numpy as np
import plotly.graph_objs as go
import warnings
import matplotlib.pyplot as plt
from PIL import Image
from scipy import signal
#from rfsoc_freqplan import calculation
from .constants import *
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
                 data_windowsize=16,
                 spectrum_mode=True,
                 decimation_factor=2):
    
        self._y_data = plot_data
        self._y_data_current = plot_data
        self._sample_frequency = sample_frequency
        self._number_samples = number_samples
        self._decimation_factor = decimation_factor
        self._centre_frequency = centre_frequency
        self._rbw = (self._sample_frequency/self._decimation_factor) \
            /self._number_samples
        self._upper_limit = (self._sample_frequency/self._decimation_factor)/2
        self._lower_limit = -(self._sample_frequency/self._decimation_factor)/2
        self._upper_index = self._number_samples-1
        self._lower_index = 0
        self._xlabel = xlabel
        self._ylabel = ylabel
        self._x_data = np.arange(self._lower_limit,
                                 self._upper_limit,
                                 self._rbw) + self._centre_frequency
        self._range = (min(self._x_data), max(self._x_data))
        self._yrange = [-150, 0]
        self._display_mode = display_mode
        self._spectrum_mode = spectrum_mode
        self._nyquist_stopband = nyquist_stopband
        self._data_window = np.empty(1)
        self._min_indices = [0]
        self._max_indices = [0]
        self._number_min_indices = 1
        self._number_max_indices = 1
        self._update_ddc_counter = 0
        self.ddc_centre_frequency = 0
        self.data_windowsize = data_windowsize
        self.post_process = 'none'
        self.enable_updates = False
        self.display_min = False
        self.display_max = False
        self.display_ddc_plan = []
        
        
        if (np.ceil(self._centre_frequency/(self._sample_frequency/2)) % 2) == 0:
            self._nyquist_direction = -1
        else:
            self._nyquist_direction = 1
        
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
                'range' : self._yrange,
                'autorange' : True
            },
            'margin' : {
                't':25,
                'b':25,
                'l':25,
                'r':25
            },
            'showlegend' : False,
        }
        
        config = {'displayModeBar' : False}
        
        plot_data = []
        
        plot_data.append(
            go.Scatter(
                x = self._x_data,
                y = self._y_data,
                name = 'Spectrum',
                line = {'color' : 'palevioletred',
                        'width' : 0.75
                       }
            )
        )
        
        plot_data.append(
            go.Scatter(
                x = self._x_data,
                y = np.zeros(self._number_samples) - 300,
                name = '',
                fill = 'tonexty',
                fillcolor = 'rgba(128, 128, 128, 0.5)'
            )
        )
        
        plot_data.append(
            go.Scatter(
                x = None,
                y = None,
                mode = 'markers',
                name = 'Maximum',
                marker = {
                    'size' : 8,
                    'color' : 'red',
                    'symbol' : 'cross'
                }
            )
        )
        
        plot_data.append(
            go.Scatter(
                x = None,
                y = None,
                mode = 'markers',
                name = 'Minimum',
                marker = {
                    'size' : 8,
                    'color' : 'blue',
                    'symbol' : 'cross'
                }
            )
        )
        
#        self.ddc_plan = calculation.FrequencyPlannerDDC(
#            fs_rf=self._sample_frequency,
#            il_factor=IL_FACTOR,
#            fc=self.ddc_centre_frequency,
#            dec=self._decimation_factor,
#            nco=self._centre_frequency,
#            pll_ref=PLL_FREQUENCY
#        )
        
#        self._spurs_list = ['rx_alias', 'rx_image',
#                            'hd2', 'hd2_image', 'hd3', 'hd3_image',
#                            'pll_mix_up', 'pll_mix_up_image', 'pll_mix_down', 'pll_mix_down_image']
        
#        for spur in self._spurs_list:
#            spur_data = getattr(self.ddc_plan, spur)
#            spur_data['x'] = self._nyquist_direction*spur_data['x'] + self._centre_frequency
#        
#            plot_data.append(
#                go.Scatter(
#                    x = None,
#                    y = None,
#                    name = spur_data['label'],
#                    line = dict(color=spur_data['color'])
#                )
#            )
#            self.display_ddc_plan.append(False)

        self._plot = go.FigureWidget(
            layout=layout,
            data=plot_data,
        )
        
        self._clear_plot()
        self._update_x_limits()
        self._update_x_axis()
        
    @property
    def decimation_factor(self):
        return self._decimation_factor
    
    @decimation_factor.setter
    def decimation_factor(self, decimation_factor):
        self._decimation_factor = decimation_factor
        self._rbw = (self._sample_frequency/self._decimation_factor) \
            /self._number_samples
        self._clear_plot()
        self._update_x_limits()
        self._update_x_axis()
        
    @property
    def number_min_indices(self):
        return self._number_min_indices
    
    @number_min_indices.setter
    def number_min_indices(self, number_min_indices):
        self._number_min_indices = number_min_indices
        
    @property
    def number_max_indices(self):
        return self._number_max_indices
    
    @number_max_indices.setter
    def number_max_indices(self, number_max_indices):
        self._number_max_indices = number_max_indices
        
    @property
    def data_windowsize(self):
        return self._data_window.shape[0]
    
    @data_windowsize.setter
    def data_windowsize(self, data_windowsize):
        temp_average = np.average(self._y_data)
        self._data_window = np.full((data_windowsize, self._number_samples), 
                                    fill_value=temp_average, dtype=np.single)
        
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
        return self._yrange
    
    @yrange.setter
    def yrange(self, yrange):
        self._yrange = yrange
        self._plot.layout.yaxis.range = self._yrange
        
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
            self._update_x_limits()
            self._update_x_axis()
        
    @property
    def centre_frequency(self):
        return self._centre_frequency
        
    @centre_frequency.setter
    def centre_frequency(self, fc):
        self._centre_frequency = fc
        if (np.ceil(self._centre_frequency/(self._sample_frequency/2)) % 2) == 0:
            self._nyquist_direction = -1
        else:
            self._nyquist_direction = 1
        self._update_x_axis()
    
    @property
    def sample_frequency(self):
        return self._sample_frequency
        
    @sample_frequency.setter
    def sample_frequency(self, fs):
        self._sample_frequency = fs
        self._rbw = (self._sample_frequency/self._decimation_factor) \
            /self._number_samples
        self._clear_plot()
        self._update_x_limits()
        self._update_x_axis()
    
    @property
    def data(self):
        return self._y_data
        
    @data.setter
    def data(self, data):
        if self.enable_updates:
            data = self._apply_post_process(data)
            self._y_data_current = data
            self._y_data = self._y_data_current[self._lower_index:self._upper_index]
            self._plot.data[0].update({'x':self._x_data, 'y':self._y_data})
            self._apply_analysis()
            self._display_analysis()
#            if self._update_ddc_counter > 8:
#                self.update_ddc_amplitude()
#                self._update_ddc_counter = 0
#            else:
#                self._update_ddc_counter = self._update_ddc_counter + 1
    
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
        self._update_x_limits()
        self._update_x_axis()

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
        self._rbw = (self._sample_frequency/self._decimation_factor) \
            /self._number_samples
        self._clear_plot()
        self._update_x_limits()
        self._update_x_axis()
        
    def _display_analysis(self):
        if self.display_max:
            self._plot.data[2].update({'x':[self._x_data[j] for j in self._max_indices],
                                       'y':[self._y_data[j] for j in self._max_indices]})
            #self._plot.plotly_relayout({'xaxis' : {'range' : self._range}})
            self._plot.layout.xaxis.range = self._range
        else:
            self._plot.data[2].update({'x':None,
                                       'y':None})
        if self.display_min:
            self._plot.data[3].update({'x':[self._x_data[j] for j in self._min_indices],
                                       'y':[self._y_data[j] for j in self._min_indices]})
            #self._plot.plotly_relayout({'xaxis' : {'range' : self._range}})
            self._plot.layout.xaxis.range = self._range
        else:
            self._plot.data[3].update({'x':None,
                                       'y':None})
        
    def _apply_analysis(self):
        if self.display_max:
            self._max_indices = self._y_data.argsort()[-self._number_max_indices:]
        if self.display_min:
            self._min_indices = self._y_data.argsort()[:self._number_min_indices]
        
    def _apply_post_process(self, data):
        fdata = np.fft.fftshift(data)
        if self.post_process == 'average':
            self._data_window = np.roll(self._data_window, shift=1, axis=0)
            self._data_window[0, :] = fdata
            fdata = np.average(self._data_window, axis=0)
        elif self.post_process == 'median':
            self._data_window = np.roll(self._data_window, shift=1, axis=0)
            self._data_window[0, :] = fdata
            fdata = np.median(self._data_window, axis=0)
        elif self.post_process == 'max':
            fdata = np.maximum(self._y_data_current, fdata)
        elif self.post_process == 'min':
            fdata = np.minimum(self._y_data_current, fdata)
        else:
            pass
        return fdata
        
    def _clear_plot(self):
        zeros = np.zeros(self._number_samples, dtype=np.single) - 300
        zdata = zeros[self._lower_index : self._upper_index]
        self._plot.data[0].y = zdata
        
    def _update_x_limits(self):
        self._upper_limit = ((self._sample_frequency/self._decimation_factor)/2)-self._rbw* \
            np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))
        self._lower_limit = -((self._sample_frequency/self._decimation_factor)/2)+self._rbw* \
            np.ceil((self._number_samples/2)*(1-self._nyquist_stopband))
        self._upper_index = int(self._number_samples- \
                                int(np.ceil((self._number_samples/2)* \
                                            (1-self._nyquist_stopband))))
        self._lower_index = int(np.ceil((self._number_samples/2)* \
                                        (1-self._nyquist_stopband)))
        
    def _update_x_axis(self):
        self._x_data = np.arange(self._lower_limit,
                                 self._upper_limit,
                                 self._rbw) + self._centre_frequency
        self._range = (min(self._x_data), max(self._x_data))
        self._plot.layout.xaxis.range = self._range
        self.data_windowsize = self._data_window.shape[0]
        if self.post_process == 'max':
            self._y_data = np.zeros(len(self._x_data)) - 300
            self._y_data_current = np.zeros(self._number_samples) - 300
        elif self.post_process == 'min':
            self._y_data = np.zeros(len(self._x_data)) + 300
            self._y_data_current = np.zeros(self._number_samples) + 300
        else:
            temp_average = np.average(self._y_data)
            self._y_data = np.zeros(len(self._x_data)) + temp_average
            self._y_data_current = np.zeros(self._number_samples) + temp_average
        self._plot.data[1].update({
            'x':self._x_data,
            'y':np.zeros(len(self._x_data)) - 300
        })
#        self.update_ddc_plan()
        
#    def update_ddc_plan(self):
#        if any(self.display_ddc_plan):
#            self.ddc_plan.fs_rf = self._sample_frequency
#            self.ddc_plan.fc = self.ddc_centre_frequency
#            self.ddc_plan.dec = self._decimation_factor
#            nyquist_zone = np.floor(self._centre_frequency/(self._sample_frequency/2)) + 1
#            if (nyquist_zone % 2) == 0:
#                self.ddc_plan.nco = self._centre_frequency
#            else:
#                self.ddc_plan.nco = -self._centre_frequency
#            self.update_ddc_amplitude()
                
#    def update_ddc_amplitude(self):
#        spectrum_average = np.mean(self._y_data)
#        min_x_data = min(self._x_data)
#        max_x_data = max(self._x_data)
#        minimum_spectrum = min(self._x_data)/self._rbw
#        for index, spur in enumerate(self._spurs_list):
#            if self.display_ddc_plan[index]:
#                spur_data = getattr(self.ddc_plan, spur)
#                xvalue = self._nyquist_direction*spur_data['x'] + self._centre_frequency
#                if (xvalue >= min_x_data) and (xvalue <= max_x_data):
#                    self._plot.data[4+index].update({
#                        'x' : [xvalue, xvalue],
#                        'y' : [spectrum_average, self._y_data[int((xvalue/self._rbw)-minimum_spectrum)]],
#                    })
#                else:
#                    self._plot.data[4+index].update({
#                        'x' : None,
#                        'y' : None,
#                    })
#            else:
#                self._plot.data[4+index].update({
#                    'x' : None,
#                    'y' : None,
#                })
        
    def get_plot(self):
        return self._plot
    

class Spectrogram():
    def __init__(self,
                 width=800,
                 height=400,
                 image_width=400,
                 image_height=200,
                 centre_frequency=0,
                 sample_frequency=4096e6,
                 decimation_factor=2,
                 nyquist_stopband=1,
                 ypixel=2,
                 plot_time=20,
                 zmin=-80,
                 zmax=0,
                 cmap='jet'):
        
        self._width = width
        self._height = height
        self._image_width = image_width
        self._image_height = image_height
        self._sample_frequency = sample_frequency
        self._decimation_factor = decimation_factor
        self._centre_frequency = centre_frequency
        self._nyquist_stopband = nyquist_stopband
        self._ypixel = ypixel
        self._data = np.ones((self._image_height, self._image_width, 3), dtype=np.uint8)*128
        self._data_status = False
        self.cmap = cmap
        
        self._image_x = -(self._sample_frequency/self._decimation_factor)/2 + self._centre_frequency
        self._image_y = 0
        self._lower_limit = (-(self._sample_frequency/self._decimation_factor)/2) * \
            self._nyquist_stopband + self._centre_frequency
        self._upper_limit = ((self._sample_frequency/self._decimation_factor)/2) * \
            self._nyquist_stopband + self._centre_frequency
        
        self._plot_time = self._image_height
        self.zmin = zmin
        self.zmax = zmax
        self.enable_updates = False
        
        self._plot = go.FigureWidget(layout={
            'height' : self._height,
            'width' : self._width,
            'yaxis' : {
                'showgrid' : False,
                'range' : [-self._plot_time, 0],
                'autorange' : False,
                'title' : 'Frame Number',
                'showticklabels' : True,
                'visible' : True
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
        
        img = Image.fromarray(self._data, 'RGB')
        self._plot.add_layout_image(
            dict(
                source=img,
                xref="x",
                yref="y",
                x=self._image_x,
                y=self._image_y,
                sizex=(self._sample_frequency/self._decimation_factor),
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
            self._data_status = True
            value = np.fft.fftshift(data) # FFT Shift
            value = np.array(np.interp(value, (self.zmin, self.zmax), (0, 1)), dtype=np.single) # Scale Z-Axis
            value = np.resize(signal.resample(value, self._image_width), (1, self._image_width)) # Resample X-Axis
            value = np.repeat(value, self._ypixel, 0) # Repeat Y-Axis
            cm = plt.get_cmap(self.cmap)
            value = cm(value)
            self._data = np.roll(self._data, self._ypixel, 0) # Roll data
            self._data[0:self._ypixel, :, :] = (value[:, :, :3]*255).astype(np.uint8) # Update first line
            img = Image.fromarray(self._data, 'RGB') # Create image
            self._plot.update_layout_images({'source' : img}) # Set as background
            self._data_status = False
        
    @property
    def ypixel(self):
        return self._ypixel
    
    @ypixel.setter
    def ypixel(self, ypixel):
        if self.enable_updates:
            self.enable_updates = False
            while self._data_status:
                pass
            self._ypixel = ypixel
            self.enable_updates = True
        else:
            self._ypixel = ypixel
        
    @property
    def sample_frequency(self):
        return self._sample_frequency
    
    @sample_frequency.setter
    def sample_frequency(self, sample_frequency):
        self._sample_frequency = sample_frequency
        self._update_image()
        
    @property
    def decimation_factor(self):
        return self._decimation_factor
    
    @decimation_factor.setter
    def decimation_factor(self, decimation_factor):
        self._decimation_factor = decimation_factor
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
        self._lower_limit = (-(self._sample_frequency/self._decimation_factor)/2) * self._nyquist_stopband + self._centre_frequency 
        self._upper_limit = ((self._sample_frequency/self._decimation_factor)/2) * self._nyquist_stopband + self._centre_frequency
        self._image_x = -(self._sample_frequency/self._decimation_factor)/2 + self._centre_frequency
        self._plot.update_layout({'xaxis': {
            'range' : [self._lower_limit ,self._upper_limit]
        }})
        self._data = np.ones((self._image_height, self._image_width, 3), dtype=np.uint8)*128
        img = Image.fromarray(self._data, 'RGB')
        self._plot.update_layout_images({'source' : img,
                                         'x' : self._image_x,
                                         'sizex' : (self._sample_frequency/self._decimation_factor)})
    
    def get_plot(self):
        return self._plot

    
class Constellation():
    def __init__(self,
                 data,
                 animation_period=50,
                 height=800,
                 width=800,
                 autosize=True):
        """Creates a new plot object for plotting IQ constellations."""
        
        self._data = data
        self._animation_period = 50
        self._width = width
        self._height = height
        self._axisrange = [-1.25, 1.25]
        self._autosize = autosize
        self._complex = isinstance(self._data[0], complex)
        
        if not self._complex:
            raise Exception('Input data is not of type complex.')
        
        self._layout = {
            'hovermode' : 'closest',
            'height' : self._height,
            'width' : self._width,
            'autosize' : self._autosize,
            'xaxis' : {
                'range' : self._axisrange,
                'title' : 'In-phase Amplitude'
            },
            'yaxis' : {
                'range' : self._axisrange,
                'title' : 'Quadrature Amplitude'
            },
            'title' : 'Constellation Plot'
        }
        
        self._plot = go.FigureWidget(
            layout = self._layout,
            data = [{
                'mode' : 'markers',
                'x' : np.real(self._data),
                'y' : np.imag(self._data)
            }])
        
    def set_axisrange(self, axisrange):
        self._axisrange = axisrange
        self._plot.layout.yaxis.range = axisrange
        self._plot.layout.xaxis.range = axisrange
        
    def update_data(self, data):
        """Update the frame of data currently on the canvas
        """
        
        if not isinstance(data[0], complex):
            raise Exception('Input data is not of type complex.')
            
        #if len(data) > 8:
        #    step = int(len(data)/8)
        #    self._data = data[::step]
        #else:
        #    self._data = data
        
        self._data = data
        self._plot.data[0].update({'x' : np.real(self._data),
                                   'y' : np.imag(self._data)})        
        
    def get_widget(self):
        return self._plot
    
