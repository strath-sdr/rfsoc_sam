import numpy as np
import ipywidgets as ipw
import plotly.graph_objs as go
import time

from .spectrum_analyser import SpectrumAnalyser
from .bandwidth_selector import BandwidthSelector
from .quick_widgets import FloatText, Button, Accordion, DropDown, Label, Image

class RadioAnalyser():
    
    def __init__(self, 
                 adc_tile,
                 adc_block,
                 spectrum_analyser,
                 decimator):
        
        self._tile = adc_tile
        self._block = adc_block
        self._spectrum_analyser = spectrum_analyser
        self._decimator = decimator
        
        
    @property
    def centre_frequency(self):
        return abs(self._block.MixerSettings['Freq'])
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        nyquist_zone = int(np.ceil(centre_frequency/(self._block.BlockStatus['SamplingFreq']*1e3/2)))
        if nyquist_zone != self._block.NyquistZone:
            self._block.NyquistZone = nyquist_zone
        if (nyquist_zone % 2) == 0:
            self._block.MixerSettings['Freq'] = centre_frequency
        else:
            self._block.MixerSettings['Freq'] = -centre_frequency
        self._block.UpdateEvent(1)
        self._spectrum_analyser.centre_frequency = centre_frequency*1e6
        
    @property
    def decimation_factor(self):
        if self._decimator.decimation_factor > 0:
            return self._block.DecimationFactor * self._decimator.decimation_factor
        else:
            return self._block.DecimationFactor
        
    @decimation_factor.setter
    def decimation_factor(self, decimation_factor):
        word_lut = [8, 4, 2]
        sel = int(np.log2(decimation_factor))
        running = False
        if self._spectrum_analyser.dma_enable:
            self._spectrum_analyser.dma_enable = 0
            running = True
        if decimation_factor in [2, 4, 8]:
            self._spectrum_analyser.ssr_packetsize = 0
            self._tile.ShutDown()
            self._block.DecimationFactor = decimation_factor
            self._block.FabRdVldWords = word_lut[sel-1]
            self._tile.StartUp()
            time.sleep(0.1)
            self._spectrum_analyser.ssr_mode = 4-sel
            self._decimator.decimation_factor = 0
            self._spectrum_analyser.sample_frequency = \
            (self._block.BlockStatus['SamplingFreq']/decimation_factor)*1e9
            self._spectrum_analyser.ssr_packetsize = int(self._spectrum_analyser.fft_size/8)
        elif decimation_factor in [16, 32, 64, 128, 256, 512, 1024]:
            self._spectrum_analyser.ssr_packetsize = 0
            self._tile.ShutDown()
            self._block.DecimationFactor = 8
            self._block.FabRdVldWords = 2
            self._tile.StartUp()
            time.sleep(0.1)
            self._spectrum_analyser.ssr_mode = 0
            self._decimator.decimation_factor = int(decimation_factor/8)
            self._spectrum_analyser.sample_frequency = \
            (self._block.BlockStatus['SamplingFreq']/decimation_factor)*1e9
            self._spectrum_analyser.ssr_packetsize = int(self._spectrum_analyser.fft_size/8)
        if running:
            self._spectrum_analyser.dma_enable = 1
            
    @property
    def sample_frequency(self):
        return self._spectrum_analyser.sample_frequency
            
    @property
    def calibration_mode(self):
        return self._block.CalibrationMode
        
    @calibration_mode.setter
    def calibration_mode(self, calibration_mode):
        running = False
        if self._spectrum_analyser.dma_enable:
            self._spectrum_analyser.dma_enable = 0
            running = True
        if calibration_mode in [1, 2]:
            self._block.CalibrationMode = calibration_mode
            self._tile.ShutDown()
            self._tile.StartUp()
        if running:
            self._spectrum_analyser.dma_enable = 1
            
    @property
    def nyquist_stopband(self):
        return self._spectrum_analyser.nyquist_stopband
    
    @nyquist_stopband.setter
    def nyquist_stopband(self, nyquist_stopband):
        self._spectrum_analyser.nyquist_stopband = nyquist_stopband
        
    @property
    def fftsize(self):
        return self._spectrum_analyser.fft_size
    
    @fftsize.setter
    def fftsize(self, fftsize):
        self._spectrum_analyser.fft_size = fftsize
        
    @property
    def spectrum_type(self):
        return self._spectrum_analyser.spectrum_type
    
    @spectrum_type.setter
    def spectrum_type(self, spectrum_type):
        self._spectrum_analyser.spectrum_type = spectrum_type
        
    @property
    def spectrum_units(self):
        return self._spectrum_analyser.spectrum_units
    
    @spectrum_units.setter
    def spectrum_units(self, spectrum_units):
        self._spectrum_analyser.spectrum_units = spectrum_units
        
    @property
    def window(self):
        return self._spectrum_analyser.window
    
    @window.setter
    def window(self, window_type):
        self._spectrum_analyser.window = window_type
        
    @property
    def spectrum_window(self):
        return self._spectrum_analyser.spectrum_window
        
    @property
    def height(self):
        return self._spectrum_analyser.height
    
    @height.setter
    def height(self, height):
        self._spectrum_analyser.height = height
        
    @property
    def width(self):
        return self._spectrum_analyser.width
    
    @width.setter
    def width(self, width):
        self._spectrum_analyser.width = width
        
    @property
    def spectrum_enable(self):
        return self._spectrum_analyser.plot.enable_updates
    
    @spectrum_enable.setter
    def spectrum_enable(self, enable):
        if enable:
            self._spectrum_analyser.plot.enable_updates = True
        else:
            self._spectrum_analyser.plot.enable_updates = False
            
    @property
    def waterfall_enable(self):
        return self._spectrum_analyser.spectrogram.enable_updates
    
    @waterfall_enable.setter
    def waterfall_enable(self, enable):
        if enable:
            self._spectrum_analyser.spectrogram.enable_updates = True
        else:
            self._spectrum_analyser.spectrogram.enable_updates = False
            
    @property
    def dma_enable(self):
        return self._spectrum_analyser.dma_enable
    
    @dma_enable.setter
    def dma_enable(self, enable):
        if enable:
            self._spectrum_analyser.dma_enable = 1
            self._spectrum_analyser.timer.start()
        else:
            self._spectrum_analyser.timer.stop()
            self._spectrum_analyser.dma_enable = 0
            
    @property
    def update_frequency(self):
        return self._spectrum_analyser.update_frequency
    
    @update_frequency.setter
    def update_frequency(self, update_frequency):
        self._spectrum_analyser.update_frequency = update_frequency
        
    @property
    def plotly_theme(self):
        return self._spectrum_analyser.plotly_theme
    
    @plotly_theme.setter
    def plotly_theme(self, plotly_theme):
        self._spectrum_analyser.plotly_theme = plotly_theme
        
    @property
    def zmin(self):
        return self._spectrum_analyser.zmin
    
    @zmin.setter
    def zmin(self, zmin):
        self._spectrum_analyser.zmin = zmin
        
    @property
    def zmax(self):
        return self._spectrum_analyser.zmax
    
    @zmax.setter
    def zmax(self, zmax):
        self._spectrum_analyser.zmax = zmax
        
    @property
    def quality(self):
        return self._spectrum_analyser.quality
    
    @quality.setter
    def quality(self, quality):
        self._spectrum_analyser.quality = quality
            
    def spectrum(self):
        return self._spectrum_analyser.plot.get_plot()
    
    def waterfall(self):
        return self._spectrum_analyser.spectrogram.get_plot()
    
    
class RadioFrontEnd():
    
    def __init__(self, 
                 adc_tile,
                 adc_block,
                 spectrum_analyser,
                 decimator):
        
        self._widgets = {}
        self._accordions = {}
        self.analyser = RadioAnalyser(adc_tile=adc_tile, 
                                       adc_block=adc_block, 
                                       spectrum_analyser=spectrum_analyser, 
                                       decimator=decimator)
        self._config = {'centre_frequency' : self.analyser.centre_frequency,
                        'nyquist_stopband' : 0.8,
                        'decimation_factor' : self.analyser.decimation_factor,
                        'calibration_mode' : self.analyser.calibration_mode,
                        'fftsize' : self.analyser.fftsize,
                        'spectrum_type' : self.analyser.spectrum_type,
                        'spectrum_units' : self.analyser.spectrum_units,
                        'window' : self.analyser.window,
                        'height' : self.analyser.height,
                        'spectrum_enable' : self.analyser.spectrum_enable,
                        'waterfall_enable' : self.analyser.waterfall_enable,
                        'dma_enable' : self.analyser.dma_enable,
                        'update_frequency' : self.analyser.update_frequency,
                        'plotly_theme' : self.analyser.plotly_theme,
                        'zmin' : self.analyser.zmin,
                        'zmax' : self.analyser.zmax,
                        'quality' : self.analyser.quality,
                        'width' : self.analyser.width}
        self._initialise_frontend()
        
                             
    @property
    def config(self):
        return self._config
    
    
    @config.setter
    def config(self, config_dict):
        self._update_config(config_dict)
        
        
    def _initialise_frontend(self):
        
        self._widgets.update({'decimation_factor' : 
                              DropDown(callback=self._update_config,
                                       options=[2, 4, 8, 16, 32, 64, 128, 256, 512, 1024],
                                       value=self._config['decimation_factor'],
                                       dict_id='decimation_factor',
                                       description='Decimation Factor:')})
        
        self._widgets.update({'spectrum_type' : 
                              DropDown(callback=self._update_config,
                                       options=[('Power Spectrum'),
                                                ('Power Spectral Density')],
                                       value=self._config['spectrum_type'],
                                       dict_id='spectrum_type',
                                       description='Spectrum Type:')})
        
        self._widgets.update({'spectrum_units' :
                              DropDown(callback=self._update_config,
                                       options=[('dBW'),
                                                ('dBm')],
                                       value=self._config['spectrum_units'],
                                       dict_id='spectrum_units',
                                       description='Spectrum Units:')})
        
        self._widgets.update({'fftsize' : 
                              DropDown(callback=self._update_config,
                                       options=[64, 128, 256, 512, 1024, 2048, 4096, 8192],
                                       value=4096,
                                       dict_id='fftsize',
                                       description = 'FFT Size:')})
        
        self._widgets.update({'calibration_mode' : 
                              DropDown(callback=self._update_config,
                                       options=[('1 (Fs/2(Nyquist) ≤ ±30%)', 1),
                                                ('2 (Fs/2(Nyquist) > ±30%)', 2)],
                                       value=self._config['calibration_mode'],
                                       dict_id='calibration_mode',
                                       description='Calibration Mode:')})
        
        self._widgets.update({'window' : 
                              DropDown(callback=self._update_config,
                                       options=[('Rectangular', 'rectangular'),
                                                ('Bartlett', 'bartlett'),
                                                ('Blackman', 'blackman'),
                                                ('Hamming', 'hamming'),
                                                ('Hanning', 'hanning')],
                                       value='rectangular',
                                       dict_id='window',
                                       description='')})
        
        self._widgets.update({'plotly_theme' :
                              DropDown(callback=self._update_config,
                                       options=[('Seaborn', 'seaborn'),
                                                ('Simple White', 'simple_white'),
                                                ('Plotly', 'plotly'),
                                                ('Plotly White', 'plotly_white'),
                                                ('Plotly Dark', 'plotly_dark')],
                                       value='plotly',
                                       dict_id='plotly_theme',
                                       description='Plotly Theme:')})
        
        self._widgets.update({'centre_frequency' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['centre_frequency'],
                                        min_value=0,
                                        max_value=self.analyser._block.BlockStatus['SamplingFreq']*1e3,
                                        step=1,
                                        dict_id='centre_frequency',
                                        description='Centre Frequency (MHz):')})
        
        self._widgets.update({'nyquist_stopband' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['nyquist_stopband'],
                                        min_value=0.5,
                                        max_value=1.0,
                                        step=0.01,
                                        dict_id='nyquist_stopband',
                                        description='Nyquist Stopband (%):')})
        
        self._widgets.update({'height' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['height'],
                                        min_value=200,
                                        max_value=2160,
                                        step=1,
                                        dict_id='height',
                                        description='Plot Height (Px):')})
        
        self._widgets.update({'width' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['width'],
                                        min_value=400,
                                        max_value=4096,
                                        step=1,
                                        dict_id='width',
                                        description='Plot Width (Px):')})
        
        self._widgets.update({'update_frequency' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['update_frequency'],
                                        min_value=5,
                                        max_value=12,
                                        step=1,
                                        dict_id='update_frequency',
                                        description='Update Frequency:')})
        
        self._widgets.update({'zmin' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['zmin'],
                                        min_value=-300,
                                        max_value=300,
                                        step=1,
                                        dict_id='zmin',
                                        description='Z-Low (dB):')})
        
        self._widgets.update({'zmax' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['zmax'],
                                        min_value=-300,
                                        max_value=300,
                                        step=1,
                                        dict_id='zmax',
                                        description='Z-High (dB):')})
        
        self._widgets.update({'quality' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['quality'],
                                        min_value=80,
                                        max_value=100,
                                        step=1,
                                        dict_id='quality',
                                        description='Quality (%):')})
        
        self._widgets.update({'dma_enable' :
                              Button(callback=self._update_config,
                                     description_on = 'On',
                                     description_off = 'Off',
                                     state=False,
                                     dict_id='dma_enable')})
        
        self._widgets.update({'spectrum_enable' :
                              Button(callback=self._update_config,
                                     description_on = 'On',
                                     description_off = 'Off',
                                     state=False,
                                     dict_id='spectrum_enable')})
        
        self._widgets.update({'waterfall_enable' :
                              Button(callback=self._update_config,
                                     description_on = 'On',
                                     description_off = 'Off',
                                     state=False,
                                     dict_id='waterfall_enable')})
        
        self._widgets.update({'sample_frequency_label' :
                               Label(value=str(self.analyser.sample_frequency*1e-6),
                                     svalue='Sample Frequency: ',
                                     evalue=' MHz',
                                     dict_id='sample_frequency_label')})
        
        self._widgets.update({'resolution_bandwidth_label' :
                               Label(value=str((self.analyser.sample_frequency/self.analyser.fftsize)*1e-3),
                                     svalue='RBW: ',
                                     evalue=' kHz',
                                     dict_id='resolution_bandwidth_label')})
        
        self._widgets.update({'pynq_image' : 
                              Image(image_file="assets/pynq_logo.png",
                                    width=300,
                                    height=220)})
        
        self._window_plot = go.FigureWidget(layout={'hovermode' : 'closest',
                                                   'height' : 225,
                                                   'width' : 300,
                                                   'margin' : {
                                                       't':0, 'b':20, 'l':0, 'r':0
                                                   },
                                                   'showlegend' : False,
                                                  },
                                           data=[{
                                               'x': np.arange(self.analyser.fftsize),
                                               'y': np.ones(self.analyser.fftsize)}])
        self._window_plot.data[0].marker.color = '#005d95'
        
        self._accordions.update({'plot_control' :
                                 Accordion(title='Plot Settings',
                                           widgets=[self._widgets['nyquist_stopband'].get_widget(),
                                                    self._widgets['height'].get_widget(),
                                                    self._widgets['width'].get_widget(),
                                                    self._widgets['update_frequency'].get_widget(),
                                                    self._widgets['plotly_theme'].get_widget()])})
        
        self._accordions.update({'receiver_control' :
                                 Accordion(title='Receiver',
                                           widgets=[self._widgets['centre_frequency'].get_widget(),
                                                    self._widgets['decimation_factor'].get_widget(),
                                                    self._widgets['calibration_mode'].get_widget(),
                                                    self._widgets['sample_frequency_label'].get_widget(),
                                                    self._widgets['resolution_bandwidth_label'].get_widget()],
                                           selected_index=0)})
        
        self._accordions.update({'spectrum_control' :
                                 Accordion(title='Spectrum Analyser',
                                           widgets=[self._widgets['fftsize'].get_widget(),
                                                    self._widgets['spectrum_type'].get_widget(),
                                                    self._widgets['spectrum_units'].get_widget()])})
        
        self._accordions.update({'waterfall_control' :
                                 Accordion(title='Spectrogram',
                                           widgets=[self._widgets['quality'].get_widget(),
                                                    self._widgets['zmin'].get_widget(),
                                                    self._widgets['zmax'].get_widget()])})
        
        self._accordions.update({'window_control' :
                                 Accordion(title='Spectrum Window',
                                           widgets=[self._window_plot,
                                                    self._widgets['window'].get_widget()])})
        
        self._accordions.update({'system_control' :
                                 Accordion(title='System Control',
                                           widgets=[ipw.HBox([ipw.VBox([ipw.Label(value='Data Transfer: '),
                                                                        ipw.Label(value='Spectrum Analyser: '),
                                                                        ipw.Label(value='Spectrogram: ')]),
                                                              ipw.VBox([self._widgets['dma_enable'].get_widget(),
                                                                        self._widgets['spectrum_enable'].get_widget(),
                                                                        self._widgets['waterfall_enable'].get_widget()])],
                                                             layout=ipw.Layout(justify_content='space-around'))])})
        
        self._update_frontend()
        
        
    def _update_config(self, config_dict):
        for key in config_dict.keys():
            if key not in self._config:
                raise KeyError(''.join(['Key ', str(key), ' not in dictionary.']))
        self._config.update(config_dict)
        self._update_frontend(config_dict.keys())
        
        
    def _update_frontend(self, keys=None):
        if keys is None:
            keys = self._config.keys()
        for key in keys:
            if key in self._config:
                setattr(self.analyser, key, self._config[key])
                self._widgets[key].value = self._config[key]
        for key in keys:
            if key in ['window', 'plotly_theme', 'fftsize']:
                self._update_figurewidgets()
        self._update_textwidgets()
        
        
    def _update_textwidgets(self):
        self._widgets['sample_frequency_label'].value = str(self.analyser.sample_frequency*1e-6)
        self._widgets['resolution_bandwidth_label'].value = str((self.analyser.sample_frequency/self.analyser.fftsize)*1e-3)
        
        
    def _update_figurewidgets(self):
        self._window_plot.data[0].x = np.arange(self.analyser.fftsize)
        self._window_plot.data[0].y = self.analyser.spectrum_window
        self._window_plot.layout.template = self._config['plotly_theme']
        
    
    def spectrum_analyser(self, config=None):
        if config is not None:
            self.config = config
        return ipw.VBox([self._widgets['pynq_image'].get_widget(),
                         ipw.HBox([ipw.VBox([self.analyser.spectrum(),
                                             self.analyser.waterfall()
                                            ]),
                                   ipw.VBox([self._accordions['system_control'].get_widget(),
                                             self._accordions['receiver_control'].get_widget(),
                                             self._accordions['spectrum_control'].get_widget(),
                                             self._accordions['waterfall_control'].get_widget()
                                            ]),
                                   ipw.VBox([self._accordions['window_control'].get_widget(),
                                             self._accordions['plot_control'].get_widget()
                                            ])
                                  ])
                        ])