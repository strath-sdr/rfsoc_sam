from pynq import DefaultHierarchy
from .spectrum_analyser import SpectrumAnalyser
from .bandwidth_selector import BandwidthSelector
from .transmitter import Controller
from .radio_frontend import RadioFrontEnd

class AdcChannel(DefaultHierarchy):

    @staticmethod
    def checkhierarchy(description):
        spectrum_analyser = None
        decimator = None
                
        for ip, details in description['ip'].items():
            if details['driver'] == SpectrumAnalyser:
                spectrum_analyser = ip
            elif details['driver'] == BandwidthSelector:
                decimator = ip
                
        return (spectrum_analyser is not None and
                decimator is not None)
    
    
    def __init__(self, description, tile=None, block=None):
        super().__init__(description)
        self._tile = tile
        self._block = block
        self.radio_analyser = None

    
    def _initialise_channel(self):
        self.frontend = RadioFrontEnd(adc_tile=self._tile,
                                      adc_block=self._block,
                                      spectrum_analyser=self.spectrum_analyser,
                                      decimator=self.decimator)

        
class DacChannel(DefaultHierarchy):
    
    @staticmethod
    def checkhierarchy(description):
        controller = None
                
        for ip, details in description['ip'].items():
            if details['driver'] == Controller:
                controller = ip
                
        return (controller is not None)
    
    
    def __init__(self, description, tile=None, block=None):
        super().__init__(description)
        self._tile = tile
        self._block = block
        
    
    def _initialise_channel(self):
        self.control.value = 0x7FFF7FFF
        self.control.enable = 1