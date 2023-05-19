__author1__ = 'David Northcote'
__author2__ = 'Lewis McLaughlin'
__organisation__ = 'The University of Strathclyde'
__date__ = '19th May 2023'
__version_name__ = '<a href="https://www.google.com/search?q=the+cobbler" target="_blank" rel="noopener noreferrer">The Cobbler</a>'
__version_number__ = '0.4.3'
__channels__ = 'Quad-channel'
__board__ = 'ZCU208'
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
from .constants import *
from ipywidgets import IntProgress
from IPython.display import display
from IPython.display import clear_output
import time
import threading

load_progress = 0
max_count = 100
load_bar = IntProgress(min=load_progress, max=max_count) # instantiate the bar
tab_list = ['10MHz - 1GHz', '1GHz - 4GHz', '4GHz - 5GHz', '5GHz - 6GHz']

def generate_about():
    global about
    about = ''.join(['<br><b>', __info__, '</b><br>', __channels__, ' ', __board__,
                    ' ', __release__, '<br>', 'Version ', __version_number__,
                    ': ', __version_name__, '<br>Date: ', __date__, '<br><br>',
                    '<b>Organisation:</b> <br>', __organisation__,
                    '<br><br>', '<b>Support</b>:<br>', __support__])


class Overlay(Overlay):
    
    def __init__(self, overlay_system='sam', init_rf_clks=True, **kwargs):

        global __channels__

        if not isinstance(overlay_system, str):
            raise TypeError("Argument overlay_system must be of type string.")
        
        if overlay_system == 'sam':
            this_dir = os.path.dirname(__file__)
            bitfile_name = os.path.join(this_dir, 'bitstream', 'rfsoc_sam.bit')
        else:
            raise ValueError(''.join(["Unknown overlay design ", overlay_system]))        
        
        super().__init__(bitfile_name, **kwargs)

        if init_rf_clks:
            self.init_rf_clks(lmx_freq=PLL_FREQUENCY)
            

    def init_rf_clks(self, lmk_freq=245.76, lmx_freq=491.52):
        """Initialise the LMX and LMK clocks for RF-DC operation.
        """
        xrfclk.set_ref_clks(lmk_freq=lmk_freq, lmx_freq=lmx_freq)
        
        
    def _sam_generator(self, config=None):
        def tab_handler(widget):
            tab_idx = 3-widget['new']
            for i in range(0, len(self.radio.receiver.channels)):
                if i is not tab_idx:
                    self.radio.receiver.channels[i].frontend.stop()
            self.radio.receiver.channels[tab_idx].frontend.start()
            
        sam = self.radio.receiver._get_spectrum_analyser(config)
        tab_name = [''.join(['Rx ', j]) for j in tab_list]
        children = [sam[i] for i in range(0, len(sam))]
        children.reverse()
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        for i in range(0, len(children)):
            tab.set_title(i, tab_name[i])
        tab.observe(tab_handler, 'selected_index')
        return tab
    
        
    def _ctl_generator(self, config=None):            
        ctl = self.radio.transmitter._get_transmitter_control(config)
        tab_name = [''.join(['Tx ', j]) for j in tab_list]
        children = [ctl[i] for i in range(0, len(ctl))]
        children.reverse()
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        for i in range(0, len(children)):
            tab.set_title(i, tab_name[i])
        return tab


    def _app_generator(self, config_analyser=None, config_transmitter=None):
        def tab_handler(widget):
            tab_idx = 3-widget['new']
            for i in range(0, len(self.radio.receiver.channels)):
                if i is not tab_idx:
                    self.radio.receiver.channels[i].frontend.stop()
            if tab_idx < len(self.radio.receiver.channels):
                self.radio.receiver.channels[tab_idx].frontend.start()   
        sam = self.radio.receiver._get_spectrum_analyser(config_analyser)
        ctl = self.radio.transmitter._get_transmitter_control(config_transmitter)
        sam_tab_name = [''.join(['Rx ', j]) for j in tab_list]
        ctl_tab_name = [''.join(['Tx ', j]) for j in tab_list] 
        tab_name = sam_tab_name + ctl_tab_name
        sam_children = [sam[i] for i in range(0, len(sam))]
        sam_children.reverse()
        ctl_children = [ctl[i] for i in range(0, len(ctl))]
        ctl_children.reverse()
        children = sam_children + ctl_children
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        for i in range(0, len(children)):
            tab.set_title(i, tab_name[i])
        tab.observe(tab_handler, 'selected_index')
        return tab
    
    
    def spectrum_analyzer(self, config=None):
        display(load_bar) # display the bar
        thread = threading.Thread(target=self._update_progress)
        thread.start()
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
        load_bar.value = 100
        clear_output(wait=True)
        return app

    
    def spectrum_analyzer_application(self, config=None):
        display(load_bar) # display the bar
        thread = threading.Thread(target=self._update_progress)
        thread.start()
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
        load_bar.value = 100
        clear_output(wait=True)
        return app
    
    
    def _update_progress(self):
        while load_bar.value != 100:
            if load_bar.value < 100:
                load_bar.value = load_bar.value + 1
                time.sleep(1)
            else:
                pass
