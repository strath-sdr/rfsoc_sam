from pynq import DefaultIP
from pynq import DefaultHierarchy

import numpy as np
import xrfdc
import ipywidgets as ipw
from IPython.display import Image
import quick_widgets as qw
import spectrum_analyser
import bandwidth_selector
import transmitter

class Radio(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
        
        self.dac_tile = self.rfdc.dac_tiles[1]
        self.dac_block = self.dac_tile.blocks[0]
        self.adc_tile = self.rfdc.adc_tiles[2]
        self.adc_block = self.adc_tile.blocks[0]
              
        self.dac_tile.DynamicPLLConfig(1, 409.6, 4096)
        self.dac_block.NyquistZone = 1
        self.dac_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_IMMEDIATE,
            'FineMixerScale': xrfdc.MIXER_SCALE_0P7,
            'Freq':           513,
            'MixerMode':      xrfdc.MIXER_MODE_C2R,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        self.dac_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.dac_tile.SetupFIFO(True)
        
        self.adc_tile.DynamicPLLConfig(1, 409.6, 4096)
        self.adc_block.NyquistZone = 1
        self.adc_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_TILE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           -1024,
            'MixerMode':      xrfdc.MIXER_MODE_R2C,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.adc_tile.SetupFIFO(True)
        
        self.receiver.spectrum_analyser.centre_frequency = abs(self.adc_block.MixerSettings['Freq']*1e6)
        self.transmitter.transmitter.enable = 1
        
        """Create a widget for centre frequency selection (RX)."""
        def callback_ft_rxfcsel(value):
            self.centre_frequency = value
            
        self.ft_rxfcsel = qw.FloatText(value=abs(self.adc_block.MixerSettings['Freq']),
                                   min_value=0,
                                   max_value=self.adc_block.BlockStatus['SamplingFreq']*1e3,
                                   step=1,
                                   description='Centre Frequency (MHz):',
                                   callback=callback_ft_rxfcsel)
        
        """Create decimation dropdown widget."""        
        def callback_dd_decimationfactor(value):
            self.set_decimation_factor(value)
            callback_info_label()
        
        self.dd_decimationfactor = qw.DropDown(callback=callback_dd_decimationfactor,
                                      options=[('2', 2),
                                               ('4', 4),
                                               ('8', 8),
                                               ('16', 16),
                                               ('32', 32),
                                               ('64', 64),
                                               ('128', 128),
                                               ('256', 256),
                                               ('512', 512)],
                                      value = 2,
                                      description = 'Decimation Factor:')
        
        """Create text widget to display the frequency resolution and sample frequency."""
        def callback_info_label():
            self.tx_rbw.value = ''.join(['RBW: ', 
                                               str((((self.adc_block.BlockStatus['SamplingFreq']*1e3)\
                                            /self.get_decimation_factor())\
                                           /self.receiver.spectrum_analyser.fft_size)*1e3),
                                               ' kHz'])
            
            self.tx_fs.value = ''.join(['     Sample Frequency: ', \
                                              str(self.adc_block.BlockStatus['SamplingFreq']*1e3\
                                                  /self.get_decimation_factor()),\
                                              ' MHz'])
            
        self.tx_rbw = ipw.Label(value=''.join(['     RBW: ', 
                                               str((((self.adc_block.BlockStatus['SamplingFreq']*1e3)\
                                            /self.get_decimation_factor())\
                                           /self.receiver.spectrum_analyser.fft_size)*1e3),
                                               ' kHz']))
        
        self.tx_fs = ipw.Label(value=''.join(['     Sample Frequency: ', \
                                              str(self.adc_block.BlockStatus['SamplingFreq']*1e3\
                                                  /self.get_decimation_factor()),\
                                              ' MHz']))
        
        """Create a dropdown for adc calibration mode."""
        def callback_dd_calibrationmode(value):
            running = False
            if not self.receiver.spectrum_analyser.dma_enable:
                self.receiver.spectrum_analyser.dma_enable = 0
                running = True
            self.adc_block.CalibrationMode = value
            self.adc_tile.ShutDown()
            self.adc_tile.StartUp()
            if running:
                self.receiver.spectrum_analyser.dma_enable = 1
                
        self.dd_calibrationmode = qw.DropDown(callback=callback_dd_calibrationmode,
                                              options=[('1 (Fs/2(Nyquist) ≤ ±30%)', 1),
                                                       ('2 (Fs/2(Nyquist) > ±30%)', 2)],
                                              value = 2,
                                              description = 'Calibration Mode:')
        
        """Create a widget for centre frequency selection (TX)."""
        def callback_ft_txfcsel(value):
            nyquist_zone = int(np.ceil(value/(self.dac_block.BlockStatus['SamplingFreq']*1e3/2)))
            if nyquist_zone != self.dac_block.NyquistZone:
                self.dac_block.NyquistZone = nyquist_zone
                self.dac_tile.ShutDown()
                self.dac_tile.StartUp()
            if (nyquist_zone % 2) == 0:
                self.dac_block.MixerSettings['Freq'] = -value
            else:
                self.dac_block.MixerSettings['Freq'] = value
            self.dac_block.UpdateEvent(1)
            
        self.ft_txfcsel = qw.FloatText(value=np.ceil(abs(self.dac_block.MixerSettings['Freq'])),
                                   min_value=0,
                                   max_value=self.dac_block.BlockStatus['SamplingFreq']*1e3,
                                   step=1,
                                   description='Centre Frequency (MHz)',
                                   callback=callback_ft_txfcsel)
        
        """Create a dropdown for inverse sinc filter."""
        def callback_dd_invsinc(value):
            self.dac_block.InvSincFIR = value
            
        self.dd_invsinc = qw.DropDown(callback=callback_dd_invsinc,
                                      options=[('Disabled', 0),
                                               ('Enabled (First Nyquist Zone)', 1)],
                                      value=0,
                                      description='Inverse Sinc Filter')
        
        """Spectrum Analyser Integrate."""
        """Create a widget for selecting the FFT size."""        
        def callback_dd_fftsize(value):
            self.receiver.spectrum_analyser.fft_size = value
            callback_info_label()
        
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
            self.receiver.spectrum_analyser.spectrum_type = value
            
        self.dd_spectrumtype = qw.DropDown(callback=callback_dd_spectrumtype,
                                           options=[('Power Spectrum'),
                                                    ('Power Spectral Density')],
                                           value='Power Spectrum',
                                           description='Spectrum Type:')
        
        """Create a widget for selecting the Spectrum Units."""
        def callback_dd_spectrumunits(value):
            self.receiver.spectrum_analyser.spectrum_units = value
            
        self.dd_spectrumunits = qw.DropDown(callback=callback_dd_spectrumunits,
                                           options=[('dBW'),
                                                    ('dBm')],
                                           value='dBW',
                                           description='Spectrum Units:')
        
        """Create a widget for selecting the update frequency of the plot."""
        def callback_ft_updatefreq(value):
            self.receiver.spectrum_analyser.update_frequency = value
        
        self.ft_updatefreq = qw.FloatText(value=self.receiver.spectrum_analyser.update_frequency,
                                   min_value=1,
                                   max_value=10,
                                   step=1,
                                   description='Update Frequency:',
                                   callback=callback_ft_updatefreq)
        
        """Create splash images."""
        self.pynq_image = qw.Image(image_file="assets/pynq_logo.png",
                                   width=300,
                                   height=220)
        self.strath_image = qw.Image(image_file="assets/strath_logo.png",
                                     width=350,
                                     height=250)
        
        """Create accordion for holding control widgets."""
        self.ac_control = qw.Accordion(title='Spectrum Analyser',
                                       widgets=[self.dd_fftsize.get_widget(),
                                                self.dd_spectrumtype.get_widget(),
                                                self.dd_spectrumunits.get_widget(),
                                                self.ft_updatefreq.get_widget()],
                                       selected_index=0)
        
        """Create accordion for the receiver."""
        self.ac_receiver = qw.Accordion(title='Receiver',
                                        widgets=[self.ft_rxfcsel.get_widget(),
                                                 self.dd_decimationfactor.get_widget(),
                                                 self.dd_calibrationmode.get_widget(),
                                                 self.tx_rbw,
                                                 self.tx_fs],
                                        selected_index=0)
        
        """Create accordion for the transmitter."""
        self.ac_transmitter = qw.Accordion(title='Transmitter',
                                           widgets=[self.ft_txfcsel.get_widget(),
                                                    self.dd_invsinc.get_widget()],
                                           selected_index=0)
        
        """Create accordion for the system."""
        self.ac_system = qw.Accordion(title='System',
                                      widgets=[ipw.HBox([ipw.VBox([ipw.Label(value='DMA Transfer:'),
                                                                   ipw.Label(value='Spectrum Analyser:'),
                                                                   ipw.Label(value='Spectrogram:')]),
                                                         ipw.VBox([self.receiver.spectrum_analyser.bt_dma.get_widget(),
                                                                   self.receiver.spectrum_analyser.bt_plotting.get_widget(),
                                                                   self.receiver.spectrum_analyser.bt_spectrogram.get_widget()])
                                                        ],
                                                        layout=ipw.Layout(justify_content='space-around'),
                                                       )],
                                      selected_index=0)
        
        """Create RFSoC Spectrum Analyser."""
        self.spectrum_analyser = ipw.HBox([ipw.VBox([ipw.HBox([self.pynq_image.get_widget()]),
                                                     ipw.HBox([ipw.VBox([self.receiver.spectrum_analyser.plot.get_plot(),
                                                                         self.receiver.spectrum_analyser.spectrogram.get_plot()]),
                                                               ipw.VBox([self.ac_system.get_widget(),
                                                                         self.ac_receiver.get_widget(),
                                                                         self.ac_control.get_widget(),
                                                                         self.ac_transmitter.get_widget()]),
                                                               ipw.VBox([self.receiver.spectrum_analyser.ac_plot.get_widget(),
                                                                         self.receiver.spectrum_analyser.ac_window.get_widget()])
                                                              ]),
                                                    ])
                                          ],
                                           layout=ipw.Layout(width='auto', height='auto'))
        
    @property
    def centre_frequency(self):
        return abs(self.adc_block.MixerSettings['Freq'])
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        nyquist_zone = int(np.ceil(centre_frequency/(self.adc_block.BlockStatus['SamplingFreq']*1e3/2)))
        if nyquist_zone != self.adc_block.NyquistZone:
            self.adc_block.NyquistZone = nyquist_zone
        if (nyquist_zone % 2) == 0:
            self.adc_block.MixerSettings['Freq'] = centre_frequency
        else:
            self.adc_block.MixerSettings['Freq'] = -centre_frequency
        self.adc_block.UpdateEvent(1)
        self.receiver.spectrum_analyser.centre_frequency = centre_frequency*1e6
        
    def get_spectrum_analyser(self):
        return self.spectrum_analyser
        
    def get_decimation_factor(self):
        if self.receiver.decimator.decimation_factor > 0:
            return self.adc_block.DecimationFactor * self.receiver.decimator.decimation_factor
        else:
            return self.adc_block.DecimationFactor
    
    def set_decimation_factor(self, factor):
        running = False
        if self.receiver.spectrum_analyser.dma_enable:
            self.receiver.spectrum_analyser.dma_enable = 0
            running = True
        if factor in [2, 4, 8]:
            self.adc_tile.ShutDown()
            self.adc_block.DecimationFactor = factor
            self.adc_tile.FabClkOutDiv = int(np.log2(factor)+1)
            self.adc_tile.StartUp()
            self.receiver.spectrum_analyser.ssr_mode = 3
            self.receiver.decimator.decimation_factor = 0
            self.receiver.spectrum_analyser.sample_frequency = (self.adc_block.BlockStatus['SamplingFreq'] \
                                    /factor)*1e9
        elif factor in [16, 32, 64, 128, 256, 512]:
            self.adc_tile.ShutDown()
            self.adc_block.DecimationFactor = 8
            self.adc_tile.FabClkOutDiv = 4
            self.adc_tile.StartUp()
            if factor == 16:
                self.receiver.spectrum_analyser.ssr_mode = 2
            elif factor == 32:
                self.receiver.spectrum_analyser.ssr_mode = 1
            elif factor >= 64:
                self.receiver.spectrum_analyser.ssr_mode = 0
            self.receiver.decimator.decimation_factor = (factor/8)
            self.receiver.spectrum_analyser.sample_frequency = (self.adc_block.BlockStatus['SamplingFreq'] \
                                    /factor)*1e9
        else:
            pass
        if running:
            self.receiver.spectrum_analyser.dma_enable = 1
        
    @staticmethod
    def checkhierarchy(description):
        if 'rfdc' in description['ip']:
            return True
        return False

class Receiver(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
        
        self.decimator.decimation_factor = 1
        self.spectrum_analyser.nyquist_stopband = 0.8
        
    @staticmethod
    def checkhierarchy(description):
        if 'decimator' in description['ip'] \
        and 'spectrum_analyser' in description['ip']:
            return True
        return False
    
class Transmitter(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
        
        self.transmitter.value = 0x7FFF7FFF
        
    @staticmethod
    def checkhierarchy(description):
        if 'transmitter' in description['ip']:
            return True
        return False