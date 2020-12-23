import time
import threading
import plotly.io as pio
import numpy as np
import ipywidgets as ipw

from spectrum_plot import SpectrumPlot

class SpectrumAnalyser():
    """The Spectrum Analyser object."""
    def __init__(self,
                 hw_adc_block,
                 hw_adc_tile,
                 hw_auto_dma,
                 hw_ssr_converter,
                 hw_spectrum_analyser,
                 number_samples = 4096,
                 update_frequency = 5,
                 plot_width = 800,
                 plot_height = 600,
                 dark_mode = False):
        
        """Initialise"""
        self._adc_block = hw_adc_block
        self._adc_tile = hw_adc_tile
        self._dma = hw_auto_dma
        self._ssr_converter = hw_ssr_converter
        self._analyser = hw_spectrum_analyser
        self._number_samples = number_samples
        self._update_frequency = update_frequency
        self._sample_frequency = (self._adc_block.BlockStatus['SamplingFreq'] \
                                    /self._adc_block.DecimationFactor)*1e9
        self._nyquist_zone = 1
        
        """Set plotly dark mode as default"""
        if dark_mode:
            pio.templates.default = 'plotly_dark'
        else:
            pio.templates.default = 'plotly'
        
        """Create Spectrum Plot object for presenting the frequency spectrum."""
        self._plot = SpectrumPlot(plot_data=np.zeros((self._number_samples,), dtype=np.single),
                                  sample_frequency=self._sample_frequency,
                                  number_samples=number_samples,
                                  centre_frequency=abs(self._adc_block.MixerSettings['Freq']*1e6),
                                  nyquist_stopband=0.8,
                                  xlabel='Frequency (Hz)',
                                  ylabel='Amplitude (dBW)',
                                  plot_width=plot_width,
                                  plot_height=plot_height,
                                  display_mode=0,
                                  spectrum_mode=True,
                                  animation_duration=0)
        
        """Create a Function Timer object to enable plot data updates through threading."""
        self._timer = FunctionTimer(plot=self._plot,
                                    dma=self._dma,
                                    update_frequency=self._update_frequency)
        
        """Create a widget for centre frequency selection."""
        def callback_ft_fcsel(value):
            self.centre_frequency = value
            
        self._ft_fcsel = FloatText(value=abs(self._adc_block.MixerSettings['Freq']),
                                   min_value=0,
                                   max_value=self._sample_frequency,
                                   step=1,
                                   description='Centre Frequency',
                                   callback=callback_ft_fcsel)
        
        """Create a widget for enabling/disabling data movement and plotting."""
        def callback_bt_dma(value, button_id):
            if value:
                self._dma.enable = 1
                self._timer.start()
            else:
                self._dma.enable = 0
                self._timer.stop()
                
        self._bt_dma = Button(callback=callback_bt_dma,
                              description_on = 'On',
                              description_off = 'Off',
                              state=False,
                              button_id=0)
        
        """Create accordion for holding control widgets."""
        self._ac_control = Accordion(title='Receive',
                                     widgets=[self._ft_fcsel.get_widget(), self._bt_dma.get_widget()])
        
        """Create spectrum analyser."""
        self._analyser = ipw.HBox([self._ac_control.get_widget(), self._plot.get_plot()], layout=ipw.Layout(width='auto',
                                                                                                            height='auto'))
    
    @property
    def update_frequency(self):
        return self._timer.update_frequency
    
    @update_frequency.setter
    def update_frequency(self, update_frequency):
        if update_frequency > 10:
            self._timer.update_frequency = 10
        elif update_frequency < 1:
            self._timer.update_frequency = 1
        else:
            self._timer.update_frequency = update_frequency
    
    @property
    def centre_frequency(self):
        return abs(self._adc_block.MixerSettings['Freq'])
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        nyquist_zone = np.ceil(centre_frequency/(self._adc_block.BlockStatus['SamplingFreq']*1e3/2))
        if nyquist_zone != self._adc_block.NyquistZone:
            self._adc_block.NyquistZone = nyquist_zone
        if (nyquist_zone % 2) == 0:
            self._adc_block.MixerSettings['Freq'] = centre_frequency
        else:
            self._adc_block.MixerSettings['Freq'] = -centre_frequency
        self._adc_block.UpdateEvent(1)
        self._plot.centre_frequency = centre_frequency*1e6
        
    @property
    def decimation_factor(self):
        """TODO
        - Add support for bandwidthselector here. The decimation
        factor should combine to form an overall decimation factor."""
        return self._adc_block.DecimationFactor
    
    @decimation_factor.setter
    def decimation_factor(self, factor):
        """TODO
        - Add support for bandwidthselector here. The decimation
        factor should combine to form an overall decimation factor.
        - Insert tscale and pwscale updates for spectrum analyser calibration."""
        running = False
        if not self._timer.stopping:
            self._dma.enable = 0
            self._timer.stop()
            running = True
        if factor <= 8:
            self._adc_tile.ShutDown()
            self._adc_block.DecimationFactor = factor
            self._adc_tile.FabClkOutDiv = int(np.log2(factor)+1)
            self._adc_tile.StartUp()
        else:
            pass
        self._plot.sample_frequency = (self._adc_block.BlockStatus['SamplingFreq'] \
                                    /self._adc_block.DecimationFactor)*1e9
        if running:
            self._dma.enable = 1
            self._timer.start()
            
    @property
    def nyquist_stopband(self):
        return self._plot.nyquist_stopband
    
    @nyquist_stopband.setter
    def nyquist_stopband(self, stopband):
        self._plot.nyquist_stopband = stopband
        
    def get_analyser(self):
        return self._analyser
        
class FloatText():
    """Helper class for float text widgets."""
    def __init__(self,
                 value,
                 min_value,
                 max_value,
                 step,
                 description,
                 callback
                 ):
        
        def on_value_change(change):
            callback(change['new'])
        
        self._text_box = ipw.BoundedFloatText(
            value=value,
            min=min_value,
            max=max_value,
            step=step,
            description=description,
            continuous_update=False,
            style={'description_width': 'initial'},
            disabled=False
        )
        
        self._text_box.observe(on_value_change, names='value')
        
    def get_widget(self):
        return self._text_box
    
class Button():
    """Helper class for button widgets."""
    def __init__(self,
                 callback,
                 description_on = ' ',
                 description_off = ' ',
                 state = True,
                 button_id = 0):
        self._state = state
        self._button_id = button_id
        self._callback = callback
        self._description_on = description_on
        self._description_off = description_off
        self._button = ipw.Button(description=self._description_on if self._state else self._description_off,
                                  layout=ipw.Layout(margin='auto',
                                                    border='none'))
        self._button.on_click(lambda _: self.on_click())
        
        if self._state:
            self._button.style.button_color = 'royalblue'
        else:
            self._button.style.button_color = 'tomato'
        
    def on_click(self):
        self._state = not self._state
        self._callback(value = self._state, button_id = self._button_id)
        if self._state:
            self._button.style.button_color = 'royalblue'
            self._button.description = self._description_on
        else:
            self._button.style.button_color = 'tomato'
            self._button.description = self._description_off
            
    def get_widget(self):
        return self._button
    
class Accordion():
    """Helper class for accordion widgets."""
    def __init__(self,
                 title, 
                 widgets):
        self._title = title
        self._widgets = widgets
        self._vbox = ipw.VBox([])
        
        for i in range(len(self._widgets)):
            self._vbox.children+=(self._widgets[i],)
        self._accordion = ipw.Accordion(children=[self._vbox],layout=ipw.Layout(width='auto'))
        self._accordion.set_title(0, self._title)

    def get_widget(self):
        return self._accordion
                                  
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
                
    def start(self):
        if self.stopping:
            self.stopping = False
            thread = threading.Thread(target=self._do)
            thread.start()
            
    def stop(self):
        self.stopping = True