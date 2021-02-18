__author1__ = 'David Northcote'
__author2__ = 'Lewis McLaughlin'
__organisation__ = 'The University of Strathclyde'
__date__ = '17th January 2021'
__version_name__ = '<a href="https://www.google.com/search?q=beinn+tarsuinn" target="_blank" rel="noopener noreferrer">Beinn Tarsuinn</a>'
__version_number__ = '0.2'
__channels__ = 'Quad-channel'
__board__ = 'ZCU111'
__release__ = 'release'
__info__ = 'PYNQ on RFSoC: Spectrum Analyzer.'
__support__ = '<a href="https://github.com/strath-sdr/rfsoc_sam" target="_blank" rel="noopener noreferrer">https://github.com/strath-sdr/rfsoc_sam</a>'

about = ''.join(['<br><b>', __info__, '</b><br>', __channels__, ' ', __board__,
                 ' ', __release__, '<br>', 'Version ', __version_number__,
                 ': ', __version_name__, '<br>Date: ', __date__, '<br><br>',
                 '<b>Organisation:</b> <br>', __organisation__,
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

        if init_rf_clks:
            self.init_rf_clks()
                
                
    def init_rf_clks(self, lmx_freq=409.6):
        """Initialise the LMX and LMK clocks for RF-DC operation.
        """
        xrfclk.set_all_ref_clks(lmx_freq)
        
        
    def _sam_generator(self, config=None):
        
        def tab_handler(widget):
            tab_idx = widget['new']
            for i in range(0, len(self.radio.receiver.channels)):
                if i is not tab_idx:
                    self.radio.receiver.channels[i].frontend.stop()
            self.radio.receiver.channels[tab_idx].frontend.start()
            #tab.observe(tab_handler, names='selected_index')
            
        sam = self.radio.receiver._get_spectrum_analyser(config)
        tab_name = [''.join(['Spectrum Analyzer ', str(j)]) for j in range(0, len(sam))]
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


    def _app_generator(self, config_analyser=None, config_transmitter=None):
        def tab_handler(widget):
            tab_idx = widget['new']
            for i in range(0, len(self.radio.receiver.channels)):
                if i is not tab_idx:
                    self.radio.receiver.channels[i].frontend.stop()
            if tab_idx < len(self.radio.receiver.channels):
                self.radio.receiver.channels[tab_idx].frontend.start()
            
        sam = self.radio.receiver._get_spectrum_analyser(config_analyser)
        ctl = self.radio.transmitter._get_transmitter_control(config_transmitter)
        tab_name = [''.join(['Spectrum Analyzer ', str(j)]) for j in range(0, len(sam))]
        tab_name.extend([''.join(['Transmitter Control ', str(j)]) for j in range(0, len(ctl))])
        children = [sam[i] for i in range(0, len(sam))]
        children.extend([ctl[i] for i in range(0, len(ctl))])
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        for i in range(0, len(children)):
            tab.set_title(i, tab_name[i])
        tab.observe(tab_handler, 'selected_index')
        return tab
    
    
    def spectrum_analyzer(self, config=None):
        sam_tab = self._sam_generator([config, config, config, config])
        ctl_tab = self._ctl_generator(config=[{'transmit_enable' : True},
                                              {'transmit_enable' : True},
                                              {'transmit_enable' : True},
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


    def spectrum_analyzer_application(self, config=None):
        app_tab = self._app_generator(config_analyser=[config, config, config, config],
                                      config_transmitter=[{'transmit_enable' : True},
                                                          {'transmit_enable' : True},
                                                          {'transmit_enable' : True},
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
        app = ipw.HBox([sidebar, app_tab])
        return app