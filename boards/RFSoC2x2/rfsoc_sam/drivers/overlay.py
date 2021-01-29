__author1__ = 'David Northcote'
__author2__ = 'Lewis McLaughlin'
__organisation__ = 'The University of Strathclyde'
__date__ = '29th January 2021'
__version_name__ = '<a href="https://www.google.com/search?q=beinn+tarsuinn" target="_blank" rel="noopener noreferrer">Beinn Tarsuinn</a>'
__version_number__ = '0.2'
__channels__ = 'Dual-channel'
__board__ = 'RFSoC2x2'
__release__ = 'release'
__info__ = 'PYNQ on RFSoC: Spectrum Analyser.'
__support__ = '<a href="https://github.com/strath-sdr/rfsoc_sam" target="_blank" rel="noopener noreferrer">https://github.com/strath-sdr/rfsoc_sam</a>'

about = ''.join(['<br><b>', __info__, '</b><br>', __channels__, ' ', __board__,
                 ' ', __release__, '<br>', 'Version ', __version_number__,
                 ': ', __version_name__, '<br>Date: ', __date__, '<br><br>',
                 '<b>Authors</b>: <br>', __author1__, '<br>', __author2__,
                 '<br><br>', '<b>Organisation:</b> <br>', __organisation__,
                 '<br><br>', '<b>Support</b>:<br>', __support__])

from pynq import Overlay, allocate
import xrfclk
import xrfdc
import os
from .hierarchies import *
from .quick_widgets import Image


class Overlay(Overlay):
    
    def __init__(self, bitfile_name=None, init_rf_clks=True, **kwargs):
        
        if bitfile_name is None:
            this_dir = os.path.dirname(__file__)
            bitfile_name = os.path.join(this_dir, 'bitstream', 'rfsoc_sam.bit')
        
        super().__init__(bitfile_name, **kwargs)
        
        self.init_i2c()

        if init_rf_clks:
            self.init_rf_clks()
            

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
                
                
    def init_rf_clks(self, lmk_freq=122.88, lmx_freq=409.6):
        """Initialise the LMX and LMK clocks for RF-DC operation.
        """
        xrfclk.set_ref_clks(lmk_freq=lmk_freq, lmx_freq=lmx_freq)
        
        
    def _sam_generator(self, config=None):
        
        def tab_handler(widget):
            tab_idx = widget['new']
            for i in range(0, len(self.radio.receiver.channels)):
                if i is not tab_idx:
                    self.radio.receiver.channels[i].frontend.stop()
            self.radio.receiver.channels[tab_idx].frontend.start()
            #tab.observe(tab_handler, names='selected_index')
            
        sam = self.radio.receiver._get_spectrum_analyser(config)
        tab_name = [''.join(['Spectrum Analyser ', str(j)]) for j in range(0, len(sam))]
        children = [sam[i] for i in range(0, len(sam))]
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        for i in range(0, len(children)):
            tab.set_title(i, tab_name[i])
        tab.observe(tab_handler, 'selected_index')
        return tab
    
        
    def _ctl_generator(self, config=None):            
        ctl = self.radio.transmitter._get_transmitter_control(config)
        tab_name = [''.join(['Transmitter Control ', str(j)]) for j in range(0, len(ctl))]
        children = [ctl[i] for i in range(0, len(ctl))]
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        for i in range(0, len(children)):
            tab.set_title(i, tab_name[i])
        return tab
    
    
    def spectrum_analyser(self, config=None):
        sam_tab = self._sam_generator([config, config])
        ctl_tab = self._ctl_generator(config=[{'transmit_enable' : True},
                                              {'transmit_enable' : True}])
        
        this_dir = os.path.dirname(__file__)
        img = os.path.join(this_dir, 'assets', 'pynq_logo_light.png')
        if config is not None:
            if 'plotly_theme' in config:
                if config['plotly_theme'] == 'plotly_dark':
                    img = os.path.join(this_dir, 'assets', 'pynq_logo_dark.png')
        about_html = ipw.HTML(value=about)
        pynq_image = Image(image_file=img,
                           width=300,
                           height=200)
        sidebar = ipw.VBox([pynq_image.get_widget(), about_html, ])
        app = ipw.HBox([sidebar, sam_tab, ipw.VBox([ipw.HBox([ctl_tab])])])
        return app