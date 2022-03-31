__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

import ipywidgets as ipw
from pynq import DefaultHierarchy
import xrfdc
from time import sleep
from .constants import *
from .channels import *


class Radio(DefaultHierarchy):

    @staticmethod
    def checkhierarchy(description):
        transmitter_hierarchy = None
        receiver_hierarchy = None
        rfdc_core = None
        
        for hier, details in description['hierarchies'].items():
            if details['driver'] == Transmitter:
                transmitter_hierarchy = hier
            elif details['driver'] == Receiver:
                receiver_hierarchy = hier
                
        for ip, details in description['ip'].items():
            if details['driver'] == xrfdc.RFdc:
                rfdc_core = ip
                
        return (transmitter_hierarchy is not None and
                receiver_hierarchy is not None and
                rfdc_core is not None)
    
    
    def __init__(self, description):
        super().__init__(description)
        transmitter_hierarchy = None
        receiver_hierarchy = None
        rfdc_core = None
        adc_tiles = []
        dac_tiles = []
        adc_blocks = []
        dac_blocks = []
        adc_descriptions = []
        
        for hier, details in description['hierarchies'].items():
            if details['driver'] == Transmitter:
                transmitter_hierarchy = hier
            elif details['driver'] == Receiver:
                receiver_hierarchy = hier
                
        for ip, details in description['ip'].items():
            if details['driver'] == xrfdc.RFdc:
                rfdc_core = ip
                rfdc_ip_name = details['fullpath'].split('/')[-1]
                
        for i in range(0, NUM_ADC_TILES):
            for j in range(0, NUM_ADC_BLOCKS):
                if description['ip'][rfdc_ip_name]['parameters'] \
                [''.join(['C_ADC_Slice', str(i), str(j*2), '_Enable'])] == 'true':
                    if description['ip'][rfdc_ip_name]['parameters'] \
                    [''.join(['C_ADC', str(i), '_Enable'])] == '1':
                        adc_tiles.append(getattr(self, rfdc_core).adc_tiles[i])
                        adc_blocks.append(getattr(self, rfdc_core).adc_tiles[i].blocks[j])
                        adc_descriptions.append([i, j])
                
        for i in range(0, NUM_DAC_TILES):
            for j in range(0, NUM_DAC_BLOCKS):
                if description['ip'][rfdc_ip_name]['parameters'] \
                [''.join(['C_DAC_Slice', str(i), str(j), '_Enable'])] == 'true':
                    if description['ip'][rfdc_ip_name]['parameters'] \
                    [''.join(['C_DAC', str(i), '_Enable'])] == '1':
                        dac_tiles.append(getattr(self, rfdc_core).dac_tiles[i])
                        dac_blocks.append(getattr(self, rfdc_core).dac_tiles[i].blocks[j])
                
        getattr(self, transmitter_hierarchy)._tiles = dac_tiles
        getattr(self, receiver_hierarchy)._tiles = adc_tiles
        getattr(self, transmitter_hierarchy)._blocks = dac_blocks
        getattr(self, receiver_hierarchy)._blocks = adc_blocks
        getattr(self, receiver_hierarchy)._adc_descriptions = adc_descriptions
        
        getattr(self, transmitter_hierarchy)._initialise_transmitter()
        getattr(self, receiver_hierarchy)._initialise_receiver()
        
    
class Receiver(DefaultHierarchy):
    
    @staticmethod
    def checkhierarchy(description):
        return (any('channel_' in s for s in description['hierarchies']) and
                description['fullpath'].split('/')[-1] == 'receiver')
                   
    
    def __init__(self, description, tiles=None, blocks=None, adc_descriptions=None):
        super().__init__(description)
        self.channels = []
        self._tiles = tiles
        self._blocks = blocks
        self._adc_descriptions = adc_descriptions
        channels = []
        
        for hier, details in description['hierarchies'].items():
            if details['driver'] == AdcChannel:
                channels.append(hier)
        channels = sorted(channels)
                
        for i in range(0, len(channels)):
            self.channels.append(getattr(self, channels[i]))
                
    
    def _initialise_receiver(self):
        self._configure_all_adcs()
        for channel in self.channels:
            channel._initialise_channel()
        
        
    def _configure_all_adcs(self):
        for tile in self._tiles:
            try:
                self._initialise_adc_tile(tile)
            except:
                raise Exception(''.join(['ADC tile ', str(tile), ' did not initialise.']))
                
        for block in self._blocks:
            try:
                self._initialise_adc_block(block)
            except:
                raise Exception(''.join(['ADC block ', str(block), ' did not initialise']))
                
        for tile in self._tiles:
            try:
                self._start_adc_tile(tile)
            except:
                raise Exception(''.join(['ADC tile ', str(tile), ' did not start.']))
                
        for i in range(0, len(self.channels)):
            self.channels[i]._tile = self._tiles[i]
            self.channels[i]._block = self._blocks[i]
            self.channels[i]._adc_description = self._adc_descriptions[i]
                
    
    def _initialise_adc_tile(self, tile):
        tile.DynamicPLLConfig(1, PLL_FREQUENCY, MAX_SAMPLE_FREQUENCY)
        tile.ShutDown()
        sleep(1)
        tile.StartUp()
        
    
    def _start_adc_tile(self, tile):
        tile.SetupFIFO(True)
        
    
    def _initialise_adc_block(self, block):
        block.NyquistZone = 1
        block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_TILE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           -MAX_SAMPLE_FREQUENCY/4,
            'MixerMode':      xrfdc.MIXER_MODE_R2C,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        block.UpdateEvent(xrfdc.EVENT_MIXER)
        
    
    def _get_spectrum_analyser(self, config=None):
        if config is None:
            config = [None for x in range(0, len(self.channels))]
        sam = []
        for i in range(0, len(self.channels)):
            sam.append(self.channels[i].frontend.spectrum_analyser(config[i]))
        return sam
        
    
class Transmitter(DefaultHierarchy):
    
    @staticmethod
    def checkhierarchy(description):
        return (any('channel_' in s for s in description['hierarchies']) and
                description['fullpath'].split('/')[-1] == 'transmitter')
                   
    
    def __init__(self, description, tiles=None, blocks=None):
        super().__init__(description)
        self.channels = []
        self._tiles = tiles
        self._blocks = blocks
        channels = []
        
        for hier, details in description['hierarchies'].items():
            if details['driver'] == DacChannel:
                channels.append(hier)
        channels = sorted(channels)
                
        for i in range(0, len(channels)):
            self.channels.append(getattr(self, channels[i]))
            
                    
    def _initialise_transmitter(self):
        self._configure_all_dacs()
        for channel in self.channels:
            channel._initialise_channel()
            
            
    def _configure_all_dacs(self):
        for tile in self._tiles:
            try:
                self._initialise_dac_tile(tile)
            except:
                raise Exception(''.join(['DAC tile ', str(tile), ' did not initialise.']))
                
        for block in self._blocks:
            try:
                self._initialise_dac_block(block)
            except:
                raise Exception(''.join(['DAC block ', str(block), ' did not initialise']))
                
        for tile in self._tiles:
            try:
                self._start_dac_tile(tile)
            except:
                raise Exception(''.join(['DAC tile ', str(tile), ' did not start.']))
                
        for i in range(0, len(self.channels)):
            self.channels[i]._tile = self._tiles[i]
            self.channels[i]._block = self._blocks[i]
                
    
    def _initialise_dac_tile(self, tile):
        tile.DynamicPLLConfig(1, PLL_FREQUENCY, MAX_SAMPLE_FREQUENCY)
        tile.ShutDown()
        sleep(1)
        tile.StartUp()
        
    
    def _start_dac_tile(self, tile):
        tile.SetupFIFO(True)
        
    
    def _initialise_dac_block(self, block):
        block.NyquistZone = 1
        block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_IMMEDIATE,
            'FineMixerScale': xrfdc.MIXER_SCALE_0P7,
            'Freq':           MAX_SAMPLE_FREQUENCY/8+1,
            'MixerMode':      xrfdc.MIXER_MODE_C2R,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        block.UpdateEvent(xrfdc.EVENT_MIXER)
        
    
    def _get_transmitter_control(self, config=None):
        if config is None:
            config = [None for x in range(0, len(self.channels))]
        ctl = []
        for i in range(0, len(self.channels)):
            ctl.append(self.channels[i].frontend.transmitter_control(config[i]))
        return ctl