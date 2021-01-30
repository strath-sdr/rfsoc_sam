__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

from pynq import DefaultHierarchy
from .spectrum_analyser import SpectrumAnalyser
from .bandwidth_selector import BandwidthSelector
from .controller import Controller
from .transmitter_frontend import TransmitterFrontEnd
from .receiver_frontend import ReceiverFrontEnd


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

    
    def _initialise_channel(self):
        self.frontend = ReceiverFrontEnd(adc_tile=self._tile,
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
        self.frontend = TransmitterFrontEnd(dac_tile=self._tile,
                                            dac_block=self._block,
                                            controller=self.control)