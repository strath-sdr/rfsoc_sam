__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

import numpy as np
import ipywidgets as ipw
from .controller import Controller
from .quick_widgets import FloatText, Button, Accordion


class RadioTransmitterControl():
    """Software wrapper for the transmit controller.
    
    The transmit controller may be coupled with other blocks
    in the future. This is a simple software wrapper class that
    selectively exposes important properties of the controller.
    
    Attributes:
    ----------
    centre_frequency : A float
        The DAC Block centre frequency in MHz.
    
    amplitude : A float
        The value in volts of the signal amplitude.
    
    transmit_enable : A bool
        If true, enables the passthrough of
        the amplitude register to the DAC Block input.
    
    """
    
    def __init__(self,
                 dac_tile,
                 dac_block,
                 controller):
        """Construct an instance of the software wrapper for
        the transmit controller.
        """
        self._tile = dac_tile
        self._block = dac_block
        self._controller = controller
        
    @property
    def centre_frequency(self):
        """The DAC Block centre frequency in MHz.
        """
        return abs(self._block.MixerSettings['Freq'])
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        nyquist_zone = int(np.ceil(centre_frequency/(self._block.BlockStatus['SamplingFreq']*1e3/2)))
        if nyquist_zone != self._block.NyquistZone:
            self._block.NyquistZone = nyquist_zone
        if (nyquist_zone % 2) == 0:
            self._block.MixerSettings['Freq'] = -centre_frequency
        else:
            self._block.MixerSettings['Freq'] = centre_frequency
        self._block.UpdateEvent(1)
        
    @property
    def amplitude(self):
        """The value in volts of the signal amplitude.
        """
        return float((self._controller.value & 0xFFFF)/0x7FFF)
    
    @amplitude.setter
    def amplitude(self, amplitude):
        int_temp = int(amplitude*0x7FFF)
        self._controller.value = (int_temp << 16) + int_temp
        
    @property
    def transmit_enable(self):
        """If true, enables the passthrough of
        the amplitude register to the DAC Block input.
        """
        if self._controller.enable:
            return True
        else:
            return False
        
    @transmit_enable.setter
    def transmit_enable(self, enable):
        if enable:
            self._controller.enable = 1;
        else:
            self._controller.enable = 0;
        

class TransmitterFrontEnd():
    """Software wrapper for the transmitter frontend.
    
    The transmit controller software wrapper may be coupled
    with other software wrappers in the future. This is a simple
    software wrapper class that exposes all properties of the
    transmit controller through directly using the module or
    writing to the configuration dict. The configuration dict
    controls the display of several ipywidgets that are user
    accessible.
    
    Attributes:
    ----------
    controller : A RadioTransmitterControl object
        The Transmit Controller software wrapper.
    
    config : A dict
        The configuration dictionary. Use this to update
        properties of the transmit controller as it will also
        update the associated widget.
        
        centre_frequency : A float
            The DAC Block centre frequency in MHz.
    
        amplitude : A float
            The value in volts of the signal amplitude.
    
        transmit_enable : A bool
            If true, enables the passthrough of
            the amplitude register to the DAC Block input.
    
    """
    
    def __init__(self,
                 dac_tile,
                 dac_block,
                 controller):
        """Construct an instance of the software wrapper for
        the transmit controller.
        """
        self._widgets = {}
        self._accordions = {}
        self.controller = RadioTransmitterControl(dac_tile=dac_tile,
                                                  dac_block=dac_block,
                                                  controller=controller)
        self._config = {'centre_frequency' : np.round(self.controller.centre_frequency),
                        'amplitude' : self.controller.amplitude,
                        'transmit_enable' : self.controller.transmit_enable}
        self._initialise_frontend()
        
    @property
    def config(self):
        """The configuration dictionary. Use this to update
        properties of the transmit controller as it will also
        update the associated widget.
        """
        return self._config
    
    @config.setter
    def config(self, config_dict):
        self._update_config(config_dict)
        
    def _initialise_frontend(self):
        """A hidden method for initialising the transmitter frontend.
        
        This method creates the frontend user interface by creating
        selected widgets. These widgets have a dict_id that links
        them to the configuration dictionary. When the widget is interacted
        with, the dict_id is used to update the configuration dictionary
        appropriately.
        """
        
        """The centre frequency float text widget."""
        self._widgets.update({'centre_frequency' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['centre_frequency'],
                                        min_value=0,
                                        max_value=self.controller._block.BlockStatus['SamplingFreq']*1e3,
                                        step=1,
                                        dict_id='centre_frequency',
                                        description='Transmitter Frequency (MHz):',
                                        description_width='200px')})
        
        """The amplitude float text widget."""
        self._widgets.update({'amplitude' : 
                              FloatText(callback=self._update_config,
                                        value=self._config['amplitude'],
                                        min_value=0,
                                        max_value=1.0,
                                        step=0.1,
                                        dict_id='amplitude',
                                        description='Amplitude (V):',
                                        description_width='200px')})
        
        """The transmit enable button widget."""
        self._widgets.update({'transmit_enable' :
                              Button(callback=self._update_config,
                                     description_on = 'On',
                                     description_off = 'Off',
                                     state=False,
                                     dict_id='transmit_enable')})
        
        """An accordion to host the transmitter control widgets."""
        self._accordions.update({'transmitter_control' : 
                                 Accordion(title='Transmitter Control',
                                           widgets=[self._widgets['centre_frequency'].get_widget(),
                                                    self._widgets['amplitude'].get_widget()])})
        
    def _update_config(self, config_dict):
        """A hidden method for updating the configuration dict.
        
        This method has one argument 'config_dict' for updating
        the configuration of the frontend. This will update associated
        properties of selected software wrappers and widgets.
        """
        for key in config_dict.keys():
            if key not in self._config:
                raise KeyError(''.join(['Key ', str(key), ' not in dictionary.']))
        self._config.update(config_dict)
        self._update_frontend(config_dict.keys())
        
    def _update_frontend(self, keys=None):
        """A hidden method for updating the frontend widgets
        with the given keys.
        
        They keys argument allows the system to know which keys
        to update in the configuration dict. Savig a bit of processing
        time.
        """
        if keys is None:
            keys = self._config.keys()
        for key in keys:
            if key in self._config:
                setattr(self.controller, key, self._config[key])
                self._widgets[key].value = self._config[key]
                
    def transmitter_control(self, config=None):
        """Returns an instance of the transmitter frontend
        interface.
        
        The configuration dict can optionally be set to initialise
        the properties of the interface before constructing the frontend.
        """
        if config is not None:
            self.config = config
        return ipw.VBox([self._accordions['transmitter_control'].get_widget()])