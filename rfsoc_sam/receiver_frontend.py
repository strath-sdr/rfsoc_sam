__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

import numpy as np
import ipywidgets as ipw
import plotly.graph_objs as go
import matplotlib.colors as mcolors
import time
from .spectrum_analyser import SpectrumAnalyser
from .bandwidth_selector import BandwidthSelector
from .quick_widgets import FloatText, Button, Accordion, DropDown, Label, Image


class RadioAnalyser():
    
    def __init__(self, 
                 adc_tile,
                 adc_block,
                 adc_description,
                 spectrum_analyser,
                 decimator):
        
        self._tile = adc_tile
        self._block = adc_block
        self._spectrum_analyser = spectrum_analyser
        self._decimator = decimator
        self._adc_description = adc_description
        
        
    @property
    def centre_frequency(self):
        return abs(self._block.MixerSettings['Freq'])
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        nyquist_zone = int(np.ceil(centre_frequency/(self._block.BlockStatus['SamplingFreq']*1e3/2)))
        if nyquist_zone == 0:
            nyquist_zone = 1
        if nyquist_zone != self._block.NyquistZone:
            self._block.NyquistZone = nyquist_zone
        if (nyquist_zone % 2) == 0:
            self._block.MixerSettings['Freq'] = centre_frequency
        else:
            self._block.MixerSettings['Freq'] = -centre_frequency
        self._spectrum_analyser.centre_frequency = centre_frequency*1e6
        self._block.UpdateEvent(1)
        
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
        if decimation_factor in [2, 4, 8]:
            self._block.DecimationFactor = decimation_factor
            self._block.FabRdVldWords = word_lut[sel-1]
            self._spectrum_analyser.ssr_packetsize = 0
            self._spectrum_analyser.ssr_mode = 4-sel
            self._safe_restart()
            self._decimator.decimation_factor = 0
            self._spectrum_analyser.sample_frequency = \
            (self._block.BlockStatus['SamplingFreq']/decimation_factor)*1e9
            self._spectrum_analyser.ssr_packetsize = int(self._spectrum_analyser.fft_size/8)
        elif decimation_factor in [16, 32, 64, 128, 256, 512, 1024, 2048]:
            self._block.DecimationFactor = 8
            self._block.FabRdVldWords = 2
            self._spectrum_analyser.ssr_packetsize = 0
            self._spectrum_analyser.ssr_mode = 0
            self._safe_restart()
            self._decimator.decimation_factor = int(decimation_factor/8)
            self._spectrum_analyser.sample_frequency = \
            (self._block.BlockStatus['SamplingFreq']/decimation_factor)*1e9
            self._spectrum_analyser.ssr_packetsize = int(self._spectrum_analyser.fft_size/8)
            
    @property
    def sample_frequency(self):
        return self._spectrum_analyser.sample_frequency
            
    @property
    def calibration_mode(self):
        return self._block.CalibrationMode
        
    @calibration_mode.setter
    def calibration_mode(self, calibration_mode):
        if calibration_mode in [1, 2]:
            self._block.CalibrationMode = calibration_mode
            self._safe_restart()
            
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
    def line_colour(self):
        return self._spectrum_analyser.line_colour
    
    @line_colour.setter
    def line_colour(self, line_colour):
        self._spectrum_analyser.line_colour = line_colour
        
    @property
    def line_fill(self):
        return self._spectrum_analyser.line_fill
    
    @line_fill.setter
    def line_fill(self, line_fill):
        self._spectrum_analyser.line_fill = line_fill
        
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

    @property
    def post_process(self):
        return self._spectrum_analyser.plot.post_process

    @post_process.setter
    def post_process(self, post_process):
        if post_process == 'max':
            self._spectrum_analyser.plot.post_process = 'max'
        else:
            self._spectrum_analyser.plot.post_process = 'none'

    @property
    def dma_status(self):
        return self._spectrum_analyser.dma_status
            
    def spectrum(self):
        return self._spectrum_analyser.plot.get_plot()
    
    def waterfall(self):
        return self._spectrum_analyser.spectrogram.get_plot()

    def _safe_restart(self):
        tile_number = self._adc_description[0]
        self._tile.ShutDown()
        running = self._tile._parent.IPStatus['ADCTileStatus'][tile_number]['PowerUpState']
        while running:
            time.sleep(0.1)
            running = self._tile._parent.IPStatus['ADCTileStatus'][tile_number]['PowerUpState']
        self._tile.StartUp()
        running = self._tile._parent.IPStatus['ADCTileStatus'][tile_number]['PowerUpState']
        while not running:
            time.sleep(0.1)
            running = self._tile._parent.IPStatus['ADCTileStatus'][tile_number]['PowerUpState']
    
    
class RadioAnalyserGUI():
    
    def __init__(self, 
                 adc_tile,
                 adc_block,
                 adc_description,
                 spectrum_analyser,
                 decimator):
        
        self._widgets = {}
        self._accordions = {}
        self._running_update = False
        self._update_que = []
        self._stopped = False
        self._runtime_status = {'spectrum_enable' : False, 'waterfall_enable' : False}
        self.analyser = RadioAnalyser(adc_tile=adc_tile, 
                                       adc_block=adc_block,
                                       adc_description=adc_description,
                                       spectrum_analyser=spectrum_analyser, 
                                       decimator=decimator)
        self._config = {'centre_frequency' : self.analyser.centre_frequency,
                        'nyquist_stopband' : 0.8,
                        'decimation_factor' : self.analyser.decimation_factor,
                        'calibration_mode' : self.analyser.calibration_mode,
                        'fftsize' : self.analyser.fftsize,
                        'spectrum_type' : self.analyser.spectrum_type,
                        'spectrum_units' : self.analyser.spectrum_units,
                        'window' : 'blackman',
                        'height' : self.analyser.height,
                        'spectrum_enable' : self.analyser.spectrum_enable,
                        'waterfall_enable' : self.analyser.waterfall_enable,
                        'dma_enable' : self.analyser.dma_enable,
                        'update_frequency' : self.analyser.update_frequency,
                        'plotly_theme' : self.analyser.plotly_theme,
                        'line_colour' : self.analyser.line_colour,
                        'zmin' : self.analyser.zmin,
                        'zmax' : self.analyser.zmax,
                        'quality' : self.analyser.quality,
                        'width' : self.analyser.width,
                        'post_process' : self.analyser.post_process}
        self._initialise_frontend()
        
                             
    @property
    def config(self):
        return self._config
    
    
    @config.setter
    def config(self, config_dict):
        self._update_config(config_dict)
        
        
    def start(self):
        self.config = {'spectrum_enable' : self._runtime_status['spectrum_enable'],
                       'waterfall_enable' : self._runtime_status['waterfall_enable']}
        self._stopped = False
        
        
    def stop(self):
        if not self._stopped:
            self._runtime_status.update({'spectrum_enable' : self._config['spectrum_enable'],
                                        'waterfall_enable' : self._config['waterfall_enable']})
            self.config = {'spectrum_enable' : False,
                           'waterfall_enable' : False}
            self._stopped = True
        
        
    def _initialise_frontend(self):
        
        self._widgets.update({'decimation_factor' : 
                              DropDown(callback=self._update_config,
                                       options=[2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048],
                                       value=self._config['decimation_factor'],
                                       dict_id='decimation_factor',
                                       description='Decimation Factor:')})
        
        self._widgets.update({'spectrum_type' : 
                              DropDown(callback=self._update_config,
                                       options=[('Power Spectrum'),
                                                ('Power Spectral Density')],
                                       value=self._config['spectrum_type'],
                                       dict_id='spectrum_type',
                                       description='Spectrum Type:',
                                       description_width='100px')})
        
        self._widgets.update({'spectrum_units' :
                              DropDown(callback=self._update_config,
                                       options=[('dBW'),
                                                ('dBm')],
                                       value=self._config['spectrum_units'],
                                       dict_id='spectrum_units',
                                       description='Spectrum Units:',
                                       description_width='100px')})

        self._widgets.update({'post_process' :
                              DropDown(callback=self._update_config,
                                       options=[('None', 'none'),
                                                ('Max', 'max')],
                                       value=self._config['post_process'],
                                       dict_id='post_process',
                                       description='Post Processing:',
                                       description_width='100px')})
        
        self._widgets.update({'fftsize' : 
                              DropDown(callback=self._update_config,
                                       options=[64, 128, 256, 512, 1024, 2048, 4096, 8192],
                                       value=4096,
                                       dict_id='fftsize',
                                       description = 'FFT Size:',
                                       description_width='100px')})
        
        self._widgets.update({'calibration_mode' : 
                              DropDown(callback=self._update_config,
                                       options=[('1 (Fs/2 ≤ ±30%)', 1),
                                                ('2 (Fs/2 > ±30%)', 2)],
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
        
        self._widgets.update({'line_colour' :
                              DropDown(callback=self._update_config,
                                       options=list(mcolors.CSS4_COLORS),
                                       value='white',
                                       dict_id='line_colour',
                                       description='Line Colour:')})
        
        self._widgets.update({'line_fill' :
                              DropDown(callback=self._update_config,
                                       options=list(mcolors.CSS4_COLORS),
                                       value='lightpink',
                                       dict_id='line_fill',
                                       description='Line Fill:')})
        
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
                                        description='Z-Low (dB):',
                                        description_width='100px')})
        
        self._widgets.update({'zmax' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['zmax'],
                                        min_value=-300,
                                        max_value=300,
                                        step=1,
                                        dict_id='zmax',
                                        description='Z-High (dB):',
                                        description_width='100px')})
        
        self._widgets.update({'quality' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['quality'],
                                        min_value=80,
                                        max_value=100,
                                        step=1,
                                        dict_id='quality',
                                        description='Quality (%):',
                                        description_width='100px')})
        
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
                                               'y': np.ones(self.analyser.fftsize),
                                               'line':{
                                                   'color' : 'palevioletred',
                                                   'width' : 2
                                               },
                                               'fill' : 'tozeroy',
                                               'fillcolor' : 'rgba(128, 128, 128, 0.5)'
                                               }])
        
        self._accordions.update({'system' :
                                 ipw.Accordion(children=[ipw.HBox([ipw.VBox([ipw.Label(value='Spectrum Analyzer: '),
                                                                        ipw.Label(value='Spectrogram: ')]),
                                                              ipw.VBox([self._widgets['spectrum_enable'].get_widget(),
                                                                        self._widgets['waterfall_enable'].get_widget()])],
                                                              layout=ipw.Layout(justify_content='space-around'))])})
        self._accordions['system'].set_title(0, 'System')
        
        self._accordions.update({'properties' :
                                 ipw.Accordion(children=[ipw.VBox([self._widgets['centre_frequency'].get_widget(),
                                                                   self._widgets['decimation_factor'].get_widget(),
                                                                   self._widgets['calibration_mode'].get_widget()]),
                                                        ipw.VBox([self._widgets['fftsize'].get_widget(),
                                                                  self._widgets['post_process'].get_widget(),
                                                                  self._widgets['spectrum_type'].get_widget(),
                                                                  self._widgets['spectrum_units'].get_widget()]),
                                                        ipw.VBox([self._widgets['zmin'].get_widget(),
                                                                  self._widgets['zmax'].get_widget()]),
                                                        ipw.VBox([self._window_plot,
                                                                  self._widgets['window'].get_widget()]),
                                                        ipw.VBox([self._widgets['nyquist_stopband'].get_widget(),
                                                                  self._widgets['height'].get_widget(),
                                                                  self._widgets['width'].get_widget(),
                                                                  self._widgets['update_frequency'].get_widget()])                                                        
                                                        ])})
        self._accordions['properties'].set_title(0, 'Receiver')
        self._accordions['properties'].set_title(1, 'Spectrum Analyzer')
        self._accordions['properties'].set_title(2, 'Spectrogram')
        self._accordions['properties'].set_title(3, 'Window Settings')
        self._accordions['properties'].set_title(4, 'Plot Settings')
        
        self._update_config(self._config)
        
        
    def _update_config(self, config_dict):
        for key in config_dict.keys():
            if key not in self._config:
                raise KeyError(''.join(['Key ', str(key), ' not in dictionary.']))
        self._config.update(config_dict)
        self._update_que.append(config_dict.keys())
        if not self._running_update:
            self._running_update = True
            self._update_frontend()
        
        
    def _update_frontend(self):
        if self._update_que:
            plot_running = self._config['spectrum_enable']
            self.analyser.spectrum_enable = False
            while self.analyser.dma_status != 32:
                time.sleep(0.1)
            while self._running_update:
                keys = self._update_que.pop(0)
                for key in keys:
                    if key in self._config:
                        if key in ['centre_frequency', 'decimation_factor', 'quality']:
                            self._widgets['waterfall_enable'].value = False
                            self.analyser.waterfall_enable = False
                        setattr(self.analyser, key, self._config[key])
                        self._widgets[key].value = self._config[key]
                        if key in ['plotly_theme', 'line_colour', 'decimation_factor',
                                'spectrum_enable', 'waterfall_enable']:
                            self._update_widgets(key)
                        if key in ['fftsize', 'window']:
                            self._update_figurewidgets(key)
                self._update_textwidgets()
                time.sleep(0.2)
                if not self._update_que:
                    self.analyser.spectrum_enable = plot_running
                    self._running_update = False
        self._running_update = False
        
        
    def _update_textwidgets(self):
        self._widgets['sample_frequency_label'].value = str(self.analyser.sample_frequency*1e-6)
        self._widgets['resolution_bandwidth_label'].value = str((self.analyser.sample_frequency/self.analyser.fftsize)*1e-3)


    def _update_figurewidgets(self, key):
        if key in ['fftsize']:
            self._window_plot.data[0].x = np.arange(self.analyser.fftsize)
            self._window_plot.data[0].y = self.analyser.spectrum_window
        elif key in ['window']:
            self._window_plot.data[0].y = self.analyser.spectrum_window
        
        
    def _update_widgets(self, key):
        if key in ['line_colour']:
            self._window_plot.data[0].line.color = self._config['line_colour']
            self._widgets['dma_enable'].button_colour = self._config['line_colour']
            self._widgets['spectrum_enable'].button_colour = self._config['line_colour']
            self._widgets['waterfall_enable'].button_colour = self._config['line_colour']
        elif key in ['plotly_theme']:
            self._window_plot.layout.template = self._config['plotly_theme']
        elif key in ['decimation_factor']:
            step_list = [10, 1, 1, 1, 0.1, 0.1, 0.1, 0.01, 0.01, 0.01, 0.001]
            self._widgets['centre_frequency'].step = step_list[int(np.log2(self._config['decimation_factor']) - 1)]
        elif key in ['spectrum_enable']:
            if self._config['spectrum_enable']:
                self._widgets['dma_enable'].configure_state(True)
            else:
                if not self._config['waterfall_enable']:
                    self._widgets['dma_enable'].configure_state(False)
        elif key in ['waterfall_enable']:
            if self._config['waterfall_enable']:
                self._widgets['dma_enable'].configure_state(True)
            else:
                if not self._config['spectrum_enable']:
                    self._widgets['dma_enable'].configure_state(False)
            
    
    def spectrum_analyser(self, config=None):
        if config is not None:
            self.config = config
        return ipw.VBox([ipw.HBox([ipw.VBox([self.analyser.spectrum(),
                                             self.analyser.waterfall(),
                                             ipw.HBox([self._widgets['sample_frequency_label'].get_widget(),
                                                       ipw.Label(value=' | '),
                                                       self._widgets['resolution_bandwidth_label'].get_widget()],
                                                      layout=ipw.Layout(justify_content='flex-end'))
                                            ]),
                                   ipw.VBox([self._accordions['system'],
                                             self._accordions['properties']
                                            ])
                                  ])
                        ])