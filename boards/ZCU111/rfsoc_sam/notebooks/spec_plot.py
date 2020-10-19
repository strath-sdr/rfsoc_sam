import numpy as np
import plotly.graph_objs as go
import ipywidgets as ipw
from contextlib import contextmanager
import threading

import plotly.io as pio
pio.renderers.default = "browser"

class SpecPlot():
    def __init__(self,
                 data,
                 Fs,
                 animation_period=50,
                 animation_period_range=100,
                 xlabel='Frequency (Hz)',
                 ylabel='Time (s)',
                 w=700,
                 h=500,
                 autosize=True,
                 debug=False,
                 colourscale='jet',
                 time=30,
                 zmin=-120,
                 zmax=0,
                 dark_theme=False):
        
        
        """Create a new plot object parametrized for I/Q spectrum data."""
        self._Fs = Fs
        self._time = time
        self.animation_period = animation_period
        self.animation_period_range = animation_period_range
        self._data = data[::-1]
        #self._data[1024] = np.mean([self._data[1023], self._data[1025]])
        #self._data[1023] = np.mean([self._data[1022], self._data[1024]])
        self._z = np.empty((self._time,int(2048/4)))
        self._z[:] = np.nan
        frameTime = 2048/self._Fs * 1e6
        self._y = np.arange(0,self._time*frameTime, frameTime)[::-1] * -1
        self._x = np.arange(0, 1, 1 / len(self._z[0])) * self._Fs - self._Fs / 2
        lim = self._Fs/2
        div = self._Fs/2048 
        self._x_data = np.arange(-lim, lim, div) + 64e6
        self.autosize = autosize
        self._range = [min(self._x_data), max(self._x_data)]
        self._updaterange = False
        self._peakdetect = False
        self._spectrogramcount = 0
        self._maxhold = False
        self._datamaxhold = np.zeros((2048))
        self.indices_0 = np.arange(0,int(2048),4)
        self.indices_1 = np.arange(1,int(2048),4)
        self.indices_2 = np.arange(2,int(2048),4)
        self.indices_3 = np.arange(3,int(2048),4)
        self._plot_data = ((np.take(self._data, self.indices_0) + np.take(self._data, self.indices_1) \
                          + np.take(self._data, self.indices_2) + np.take(self._data, self.indices_3))/4)
        self._x_data_spectrogram = np.take(self._x_data, self.indices_2)
        self._buf = 2
        self._avg_window = np.zeros((1,2048))
        
        if dark_theme:
            self.trace_colour = 'yellow'
        else:
            self.trace_colour = '#005d95'
        
        layout_spectrum={
                'hovermode': 'closest',
                'height': np.ceil(h*0.4),
                'autosize': True,
                'xaxis': {
                    'showticklabels' : True,
                },
                'yaxis': {
                    'title': 'Power Spectrum (dBm/Hz)',
                    'range': [-140, 0]
                },
                'margin': {
                    't':0,
                    'b':0,
                    'l':0,
                    'r':0
                },
                'showlegend' : False,
        }
        
        layout_spectrogram={
                'hovermode': 'closest',
                'height':  np.ceil(h*0.4),
                'autosize': True,
                'xaxis': {
                    'autorange' : False,
                    'title': 'Frequency (Hz)',
                    'range': [min(self._x_data_spectrogram),
                      max(self._x_data_spectrogram)]
                },
                'yaxis': {
                     'title': 'Frame Number',
                },
                'margin': {
                    't':0,
                    'b':25,
                    'l':0,
                    'r':0
                }
        }
        
        # 2D Spectrum Plot
        self._plot_spectrum = FastFigureWidget(
            layout=layout_spectrum,
            data=[{
                'x': self._x_data,
                'y': self._data,
            }])
        self._plot_spectrum.data[0].marker.color=self.trace_colour
        
        # Peak Detection
        self._plot_spectrum.add_trace(go.Scatter(y=[0],x=[0],
                            marker=dict(symbol='triangle-down',
                                        size=15,
                                        color='#f05b83'),
                                        visible=False))
        
        # 3D Spectrogram Plot
        trace = go.Heatmap(x=self._x_data_spectrogram, y=self._y, z=self._z, colorscale = colourscale, zmin=-120, zmax=0,showscale=False,zsmooth='fast')
        self._plot_spectrogram = go.FigureWidget(
            layout=layout_spectrogram,
            data=[trace])
        
       
    def add_frame_spectrogram(self):
        self._spectrogramcount += 1
        self._z=np.roll(self._z,-1,0)
        self._z[self._time-1] = self._plot_data
        if self._spectrogramcount >= self._buf:
            self._spectrogramcount = 0
            self._plot_spectrogram.data[0].z = self._z
            self._plot_spectrogram.data[0].x = self._x_data_spectrogram
            
        
    def add_frame(self, frame):
        """Add a new frame (based on time domain data) to the averaged plot

        frame (list): new time domain samples to FFT and add to the plot"""
        
        self._data = frame[::-1]
        #self._data[1024] = np.mean([self._data[1023], self._data[1025]])
        #self._data[1023] = np.mean([self._data[1022], self._data[1024]])
        
        self._avg_window = np.roll(self._avg_window, 1, axis=0)
        self._avg_window[0] = self._data
        self._data = np.mean(self._avg_window,0)
        
        self._plot_data = ((np.take(self._data, self.indices_0) + np.take(self._data, self.indices_1) \
                          + np.take(self._data, self.indices_2) + np.take(self._data, self.indices_3))/4)
        
        if self._updaterange is True:
            with self._plot_spectrum._fast_batch_anim(duration=self.animation_period_range):
                self._plot_spectrum.layout.xaxis.range = self._range
                self._plot_spectrum.data[0].x = self._x_data
                self._plot_spectrum.data[0].y = self._data
            self._plot_spectrogram.layout.xaxis.range = self._range
            self._plot_spectrogram.data[0].x = self._x_data_spectrogram
            frameTime = 2048/self._Fs * 1e6
            self._plot_spectrogram.data[0].y = np.arange(0,self._time*frameTime, frameTime)[::-1] * -1

            self._updaterange = False
        else:
            with self._plot_spectrum._fast_batch_anim(duration=self.animation_period):
                self._plot_spectrum.data[0].x = self._x_data
                self._plot_spectrum.data[0].y = self._data
                
        if self._peakdetect: 
            x_pk = np.argmax(self._plot_spectrum.data[0].y)
            self._plot_spectrum.data[1].y = [self._plot_spectrum.data[0].y[x_pk]+0.5]
            self._plot_spectrum.data[1].x = [self._plot_spectrum.data[0].x[x_pk]]
            
            
    def get_widget(self):
        return ipw.VBox([self._plot_spectrum, self._plot_spectrogram])
    
    
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
