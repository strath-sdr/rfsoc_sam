import numpy as np
import plotly.graph_objs as go

from contextlib import contextmanager

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
                        'redraw': False, # This is our addition
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
                 ylabel='Amplitude (dB)',
                 plot_width=700,
                 plot_height=500,
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
        self._width = plot_width
        self._height = plot_height
        self._x_data = np.arange(self._lower_limit, self._upper_limit, self._rbw) + self._centre_frequency
        self._range = (min(self._x_data), max(self._x_data))
        self._display_mode = display_mode
        self._spectrum_mode = spectrum_mode
        self._nyquist_stopband = nyquist_stopband
        self._animation_duration = animation_duration
        self._hold_max = False
        
        layout = {
            'hovermode' : 'closest',
            'height' : np.ceil(self._height),
            'xaxis' : {
                'title' : self._xlabel,
                'showticklabels' : True,
                'autorange' : True
            },
            'yaxis' : {
                'title' : self._ylabel,
                'range' : [-150, 0]
            },
            'margin' : {
                't':0,
                'b':0,
                'l':0,
                'r':0
            },
            'showlegend' : False,
        }

        self._plot = FastFigureWidget(
            layout=layout,
            data=[{
                'x': self._x_data,
                'y': self._y_data,
            }])
        
        self.update_x_limits()
        self.update_x_axis()
    
    """ Display Mode
    """
    @property
    def display_mode(self):
        return self._display_mode
    
    @display_mode.setter
    def display_mode(self, display_mode):
        if display_mode == 0:
            self._plot.data[0].y = np.zeros( \
                                        (int(np.ceil((self._number_samples)*(self._nyquist_stopband)) - 1 ), ), \
                                         dtype=np.single) - 300
            self._display_mode = display_mode
        elif display_mode == 1:
            self._plot.data[0].y = np.zeros( \
                                        (int(np.ceil((self._number_samples/2)*(self._nyquist_stopband)) - 1 ), ), \
                                         dtype=np.single) - 300
            self._display_mode = display_mode
        else:
            pass
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
        
        if self._hold_max:
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