from pynq import Overlay
from pynq import allocate
import xrfclk
import xrfdc
import os
import numpy as np
import ipywidgets as ipw

import mw_spectrumanalyser, mw_ssrconverter, mw_autodma, mw_transmitter, mw_window

class SpectrumAnalyserOverlay(Overlay):
    
    def __init__(self, bitfile_name=None, init_rf_clks=True, **kwargs):
        
        if bitfile_name is None:
            this_dir = os.path.dirname(__file__)
            bitfile_name = os.path.join(this_dir, 'bitstream', 'rfsoc_sam.bit')
        
        super().__init__(bitfile_name, **kwargs)
        
        self.init_i2c()
        
        self.rf = self.usp_rf_data_converter
        self.dac_tile = self.rf.dac_tiles[1]
        self.dac_block = self.dac_tile.blocks[0]
        self.adc_tile = self.rf.adc_tiles[2]
        self.adc_block = self.adc_tile.blocks[0]
        
        # Start up LMX clock
        if init_rf_clks:
            xrfclk.set_all_ref_clks(409.6)
        
        # DAC6        
        self.dac_tile.DynamicPLLConfig(1, 409.6, 4096)
        self.dac_block.NyquistZone = 1
        self.dac_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_IMMEDIATE,
            'FineMixerScale': xrfdc.MIXER_SCALE_0P7,
            'Freq':           1000,
            'MixerMode':      xrfdc.MIXER_MODE_C2R,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        self.dac_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.dac_tile.SetupFIFO(True)
        
        # ADC0
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

    def init_i2c(self):
        """Initialize the I2C control drivers on RFSoC2x2.
        This should happen after a bitstream is loaded since I2C reset
        is connected to PL pins. The I2C-related drivers are made loadable
        modules so they can be removed or inserted.
        """
        module_list = ['i2c_dev', 'i2c_mux_pca954x', 'i2c_mux']
        for module in module_list:
            cmd = "if lsmod | grep {0}; then rmmod {0}; fi".format(module)
            ret = os.system(cmd)
            if ret:
                raise RuntimeError(
                    'Removing kernel module {} failed.'.format(module))

        module_list.reverse()
        for module in module_list:
            cmd = "modprobe {}".format(module)
            ret = os.system(cmd)
            if ret:
                raise RuntimeError(
                    'Inserting kernel module {} failed.'.format(module))