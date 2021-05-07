__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

from pynq import DefaultIP
from pynq import allocate
import numpy as np
from time import sleep


class OfdmTransmitter(DefaultIP):
    
    def __init__(self, description):
        super().__init__(description)
        
        self.modulation_schemes = {
            0 : "BPSK",
            1 : "QPSK",
            2 : "8-PSK",
            3 : "16-QAM",
            4 : "32-QAM",
            5 : "64-QAM",
            6 : "128-QAM",
            7 : "256-QAM",
            8 : "512-QAM",
            9 : "1024-QAM"
        }
        
    bindto = ['xilinx.com:ip:ofdm_tx:0.3']
    
    @property
    def modulation(self):
        int_modulation = self.read(0x100)
        return self.modulation_schemes[int_modulation]
    
    @modulation.setter
    def modulation(self, modulation):
        if not isinstance(modulation, str):
            raise TypeError("Modulation should be a string.")
        if modulation in self.modulation_schemes.values():
            for index in self.modulation_schemes:
                if self.modulation_schemes[index] == modulation:
                    self.write(0x100, index)
        else:
            raise ValueError(''.join([modulation, " is not a valid modulation scheme."]))
            
    @property
    def value(self):
        return self.read(0x108)*2**-31
    
    @value.setter
    def value(self, value):
        self.write(0x108, int(value*2**31))
            
    @property
    def enable(self):
        if self.read(0x104) == 1:
            return True
        else:
            return False
    
    @enable.setter
    def enable(self, enable):
        if enable:
            modulation = self.read(0x100)
            value = self.read(0x108)
            self.write(0x0, 0x1)
            sleep(0.25)
            self.write(0x100, modulation)
            self.write(0x108, value)
            sleep(0.25)
            self.write(0x104, 0x1)
        else:
            self.write(0x104, 0x0)
            
    def reset_transmission(self):
        enabled = self.enable
        modulation = self.read(0x100)
        value = self.read(0x108)
        self.write(0x0, 0x1)
        sleep(0.25)
        self.write(0x100, modulation)
        self.write(0x108, value)
        sleep(0.25)
        if enabled:
            self.enable = True

class OfdmReceiver(DefaultIP):
    
    def __init__(self, description):
        super().__init__(description)
        
    bindto = ['xilinx.com:ip:ofdm_rx:0.3']
    
    @property
    def threshold(self):
        return self.read(0x100) * 2**-31
    
    @threshold.setter
    def threshold(self, threshold):
        self.write(0x100, threshold*2**31)
        
    @property
    def enable_threshold(self):
        if self.read(0x104) == 1:
            return True
        else:
            return False
        
    @enable_threshold.setter
    def enable_threshold(self, enable):
        if enable:
            self.write(0x104, 0x1)
        else:
            self.write(0x104, 0x0)
            
    def reset_synchronisation(self):
        self.write(0x0, 0x1)
        sleep(0.5)
            