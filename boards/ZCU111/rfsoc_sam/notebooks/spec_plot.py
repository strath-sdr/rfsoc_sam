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
                 animation_period=100,
                 animation_period_range=100,
                 xlabel='Frequency (Hz)',
                 ylabel='Time (s)',
                 w=700,
                 h=500,
                 autosize=True,
                 debug=False,
                 colourscale='jet',
                 time=15,
                 zmin=-50,
                 zmax=20,
                 dark_theme=False):
        
        
        """Create a new plot object parametrized for I/Q spectrum data."""
        self._Fs = Fs
        self._time = time
        self.animation_period = animation_period
        self.animation_period_range = animation_period_range
        self._data = data[::-1]
        self._data[1024] = np.mean([self._data[1023], self._data[1025]])
        self._data[1023] = np.mean([self._data[1022], self._data[1024]])
        self._z = np.empty((self._time,2048))
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
        self._spectogramcount = 0
        self._maxhold = False
        self._datamaxhold = np.zeros((2048))
        
        if dark_theme:
            self.trace_colour = 'yellow'
        else:
            self.trace_colour = '#005d95'
        
        layout_spectrum={
                'hovermode': 'closest',
                'height': np.ceil(h*0.4),
                'autosize': True,
                'xaxis': {
                    'showticklabels' : False,
                },
                'yaxis': {
                    'title': 'Power Spectral Density (dB/Hz)',
                    'range': [-60, 20]
                },
                'margin': {
                    't':0,
                    'b':0,
                    'l':0,
                    'r':0
                },
                'showlegend' : False,
        }
        
        layout_spectogram={
                'hovermode': 'closest',
                'height':  np.ceil(h*0.6),
                'autosize': True,
                'xaxis': {
                    'autorange' : False,
                    'title': 'Frequency (Hz)',
                    'range': [min(self._x_data),
                      max(self._x_data)]
                },
                'yaxis': {
                     'title': 'Time (us)',
#                      'range': [time*(2048/self._Fs),0]
                },
                'margin': {
                    't':0,
                    'b':0,
                    'l':0,
                    'r':0
                }
        }
        
        # 2D Spectrum Plot
        self._plot_spectrum = FastFigureWidget(
            layout=layout_spectrum,
            data=[{
                #'mode': 'markers',
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
        
        # Max Trace Hold
        self._plot_spectrum.add_trace(go.Scatter(y=self._data, x=self._x_data,
                                     marker=dict(color='#f05b83'),
                                                visible=False))
        
        # 3D Spectogram Plot
        trace = go.Heatmap(x=self._x_data, y=self._y, z=self._z, colorscale = colourscale, zmin=-50, zmax=10,showscale=False,zsmooth='best')
        self._plot_spectogram = go.FigureWidget(
            layout=layout_spectogram,
            data=[trace])
        
       
        
    def add_frame_spectogram(self):
        self._spectogramcount += 1
        self._z=np.roll(self._z,-1,0)
        self._z[self._time-1] = self._data
        if self._spectogramcount == 20:
            self._spectogramcount = 0
            self._plot_spectogram.data[0].z = self._z
            self._plot_spectogram.data[0].x = self._x_data
            
        
    def add_frame(self, frame):
        """Add a new frame (based on time domain data) to the averaged plot

        frame (list): new time domain samples to FFT and add to the plot"""
        
        self._data = frame[::-1]
        self._data[1024] = np.mean([self._data[1023], self._data[1025]])
        self._data[1023] = np.mean([self._data[1022], self._data[1024]])
        
        if self._updaterange is True:
            with self._plot_spectrum._fast_batch_anim(duration=self.animation_period_range):
                self._plot_spectrum.layout.xaxis.range = self._range
                self._plot_spectrum.data[0].x = self._x_data
                self._plot_spectrum.data[0].y = self._data
            self._plot_spectogram.layout.xaxis.range = self._range
            self._plot_spectogram.data[0].x = self._x_data
            frameTime = 2048/self._Fs * 1e6
            self._plot_spectogram.data[0].y = np.arange(0,20*frameTime, frameTime)[::-1] * -1

            self._updaterange = False
        else:
            with self._plot_spectrum._fast_batch_anim(duration=self.animation_period):
                self._plot_spectrum.data[0].x = self._x_data
                self._plot_spectrum.data[0].y = self._data
                
        if self._peakdetect: 
            x_pk = np.argmax(self._plot_spectrum.data[0].y)
            self._plot_spectrum.data[1].y = [self._plot_spectrum.data[0].y[x_pk]+0.5]
            self._plot_spectrum.data[1].x = [self._plot_spectrum.data[0].x[x_pk]]
            
#         if self._maxhold:
#             self._datamaxhold = (np.greater(self._datamaxhold, self._data) * self._datamaxhold) + self._data
#             self._plot_spectrum.data[2].y = self._datamaxhold
#             self._plot_spectrum.data[2].x = self._x_data
        
            
    def get_widget(self):
        return ipw.VBox([self._plot_spectrum, self._plot_spectogram])
    
    
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