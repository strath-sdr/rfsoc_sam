from pynq import DefaultIP
from pynq import DefaultHierarchy

import numpy as np
import xrfdc

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
            'Freq':           961,
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
        
        self.receiver.spectrum_analyser.plot.centre_frequency = abs(self.adc_block.MixerSettings['Freq']*1e6)
        self.transmitter.transmitter.enable = 1
        
    @property
    def centre_frequency(self):
        return abs(self.adc_block.MixerSettings['Freq'])
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        nyquist_zone = np.ceil(centre_frequency/(self.adc_block.BlockStatus['SamplingFreq']*1e3/2))
        if nyquist_zone != self.adc_block.NyquistZone:
            self.adc_block.NyquistZone = nyquist_zone
        if (nyquist_zone % 2) == 0:
            self.adc_block.MixerSettings['Freq'] = centre_frequency
        else:
            self.adc_block.MixerSettings['Freq'] = -centre_frequency
        self.adc_block.UpdateEvent(1)
        self.receiver.spectrum_analyser.plot.centre_frequency = centre_frequency*1e6
        
    def get_decimation_factor(self):
         return self.adc_block.DecimationFactor * self.receiver.decimator.decimation_factor
    
    def set_decimation_factor(self, factor):
        running = False
        if not self.receiver.spectrum_analyser.timer.stopping:
            self.receiver.spectrum_analyser.dma_enable = 0
            self.receiver.spectrum_analyser.timer.stop()
            while not self.receiver.spectrum_analyser.timer.stopped:
                pass # Got to wait here until stopped... dont want to spawn another timer.
            running = True
        if factor in [2, 4, 8]:
            self.adc_tile.ShutDown()
            self.adc_block.DecimationFactor = factor
            self.adc_tile.FabClkOutDiv = int(np.log2(factor)+1)
            self.adc_tile.StartUp()
            self.receiver.spectrum_analyser.ssr_mode = 3
            self.receiver.decimator.decimation_factor = 0
            self.receiver.spectrum_analyser.plot.sample_frequency = (self.adc_block.BlockStatus['SamplingFreq'] \
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
            self.receiver.spectrum_analyser.plot.sample_frequency = (self.adc_block.BlockStatus['SamplingFreq'] \
                                    /factor)*1e9
        else:
            pass
        if running:
            self.receiver.spectrum_analyser.dma_enable = 1
            self.receiver.spectrum_analyser.timer.start()
        
    @staticmethod
    def checkhierarchy(description):
        if 'rfdc' in description['ip']:
            return True
        return False

class Receiver(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
        
        self.decimator.decimation_factor = 1
        self.spectrum_analyser.plot.nyquist_stopband = 0.8
        
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