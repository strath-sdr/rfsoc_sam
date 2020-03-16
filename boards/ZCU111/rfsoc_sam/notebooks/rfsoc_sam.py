from pynq import Overlay
from pynq import Xlnk
from pynq import MMIO
from spec_plot import SpecPlot
from dma_timer import DmaTimer
from timer import Timer
import xrfclk
import xrfdc
import os
import numpy as np
import ipywidgets as ipw

import spectrum_widgets as sipw
import transmitter, bandwidth_selector, spectrum_fft, spectrum_window, data_inspector

class TimerRegistry():
    """Helper class to track active timer threads.
    This can be used to help safely stop any orphaned DMA timers.
    Orphans appear when a cell is re-run while its DMA timer is active.
    """
    def __init__(self):
        self.registry = dict()

    def register_timers(self, key, timers):
        """Register a list of timers with the registry.
        This will safely stop any timers that were previously registered with
        the same key.
        key: String name for this timer group
        timers: List of DmaTimer objects
        """
        if key in self.registry:
            [timer.stop() for timer in self.registry[key]]
        self.registry[key] = timers

class SpectrumAnalyser(Overlay):
    """Overlay subclass for rfsoc-spectrum_analyser.
    Performs initialisation (including RF components) and exposes them with
    more friendly names in a flatter hierarchy. Less typing for everyone.
    """
    
    def __init__(self, bitfile_name=None, init_rf_clks=True, voila=False, **kwargs):
        """Construct a new SpectrumAnalyser
        bitfile_name: Optional. If left None, the 'rfsoc_sam.bit' bundled with this
                      rfsoc-sam package will be used.
        init_rf_clks: If true (default), the reference clocks are configured
                      for all tiles. If the clocks are already configured, set
                      to false for faster execution.
        """
        
        # Generate default bitfile name
        if bitfile_name is None:
            this_dir = os.path.dirname(__file__)
            bitfile_name = os.path.join(this_dir, 'bitstream', 'rfsoc_sam.bit')
            
        if voila:
            dark_theme = true
        else: 
            dark_theme = false
            
        if dark_theme:
            from IPython.display import display, HTML
            import plotly.io as pio

            # Apply plotly theming
            dark_template = pio.templates['plotly_dark']
            dark_template.layout.paper_bgcolor = 'rgb(0,0,0,0)'
            dark_template.layout.plot_bgcolor  = 'rgb(0,0,0,0)'
            dark_template.layout.legend.bgcolor = 'rgb(0,0,0,0)'
            pio.templates['dark_plot'] = dark_template
            pio.templates.default = 'dark_plot'            
            
        # Set FPD and LPD interface widths
        from pynq import MMIO
        fpd_cfg = MMIO(0xfd615000, 4)
        fpd_cfg.write(0, 0x00000A00)
        lpd_cfg = MMIO(0xff419000, 4)
        lpd_cfg.write(0, 0x00000000)

        # Create Overlay
        super().__init__(bitfile_name, **kwargs)

        # Extact in-use dataconverter objects with friendly names
        self.rf = self.usp_rf_data_converter_0
        self.dac_tile = self.rf.dac_tiles[1]
        self.dac_block = self.dac_tile.blocks[2]

        # Start up LMX clock
        if init_rf_clks:
            xrfclk.set_all_ref_clks(409.6)

        # Set sane DAC defaults
        self.dac_tile.DynamicPLLConfig(1, 409.6, 2048)
        self.dac_block.NyquistZone = 1
        self.dac_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_IMMEDIATE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           64,
            'MixerMode':      xrfdc.MIXER_MODE_C2R,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        self.dac_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.dac_tile.SetupFIFO(True)

        # Set sane ADC defaults
        # ADC2
        self.adc_tile = self.rf.adc_tiles[1]
        self.adc_block = self.adc_tile.blocks[0]
        
        self.adc_tile.DynamicPLLConfig(1, 409.6, 2048)
        self.adc_block.NyquistZone = 1
        self.adc_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_TILE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           64,
            'MixerMode':      xrfdc.MIXER_MODE_R2C,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.adc_tile.SetupFIFO(True)
        
        # ADC1
        self.adc_tile = self.rf.adc_tiles[0]
        self.adc_block = self.adc_tile.blocks[1]
        
        self.adc_tile.DynamicPLLConfig(1, 409.6, 2048)
        self.adc_block.NyquistZone = 1
        self.adc_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_TILE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           64,
            'MixerMode':      xrfdc.MIXER_MODE_R2C,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.adc_tile.SetupFIFO(True)
        
        # ADC0
        self.adc_tile = self.rf.adc_tiles[0]
        self.adc_block = self.adc_tile.blocks[0]
        
        self.adc_tile.DynamicPLLConfig(1, 409.6, 2048)
        self.adc_block.NyquistZone = 1
        self.adc_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_TILE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           64,
            'MixerMode':      xrfdc.MIXER_MODE_R2C,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.adc_tile.SetupFIFO(True)
        
        self.timers = TimerRegistry()
        
        # Demo initialisation
        self.TransmitterTop = self.Transmitter
        self.BandwidthSelector = self.SpectrumAnalyser.BandwidthSelector
        self.SpectrumWindow = self.SpectrumAnalyser.SpectrumWindow
        self.SpectrumFFT = self.SpectrumAnalyser.SpectrumFFT
        self.DataInspector = self.SpectrumAnalyser.DataInspector
        
        self._fs = 128e6
        self._axi_fs = 256e6
        self._fc = 64   
        
        self.voila = voila
        self.dark_theme = dark_theme
        self.peak_flag = False
    
    def update_voila(self, frame):
        
        self.SpecPlot.add_frame(frame)
        
        if self.peak_flag:
            self.peak_x.value = self.SpecPlot._plot_spectrum.data[1].x[0]
            self.peak_y.value = self.SpecPlot._plot_spectrum.data[1].y[0]
    

    def TransmitterSetup(self):

        def on_modulation_change(change):
            self.TransmitterTop.set_modulation(change['new'])

        def on_slider_change(change):
            self.dac_block.MixerSettings['Freq'] = change['new']
            self.dac_block.UpdateEvent(xrfdc.EVENT_MIXER)
            
#         def setNyquist(zone):
#             zone = int(zone['new'])
#             self.adc_block.NyquistZone = zone

        options= ['BPSK', 'QPSK', '8-PSK', '16-QAM']
        modsel = sipw.drop_menu_widget('Modulation:', options[1],options)
        freqsel = sipw.float_txt_widget('Tx Frequency (MHz):', 64, 1, 1020, 1)
#         nyquist = sipw.drop_menu_widget('Nyquist Zone:', 1, [1,2]) 

        accordion = sipw.accordion_widget('Transmit', [modsel, freqsel])
        
        modsel.observe(on_modulation_change, names='value')
        freqsel.observe(on_slider_change, names='value')
        
        return accordion
    

    def ReceiverSetup(self):
        def changeADC(adc):
            adc_new = adc['new']
            
            adc_new_bin = np.binary_repr(adc_new, width=2)
            tile = int(adc_new_bin[0])
            block = int(adc_new_bin[1])
            
            self.adc_tile = self.rf.adc_tiles[tile]
            self.adc_block = self.adc_tile.blocks[block]
            
            im = MMIO(0x00_8000_5000, 4096)
            re = MMIO(0x00_8000_3000, 4096)
            re.write(0x40,adc_new)
            re.write(0x0,0x2)
            im.write(0x40,adc_new)
            im.write(0x0,0x2)
            
            update_widgets_and_graph()
            
            
        def update_widgets_and_graph():
#             self.nyquist.value = self.adc_block.NyquistZone
            self.rx_nco_txt.value = np.ceil(self.adc_block.MixerSettings['Freq'])
            update_nco_and_graph(self.adc_block, self.rx_nco_txt.value)
            

        def update_nco_and_graph(rf_block, nco_freq):
            lim = self._fs/2 #+ (nco_freq * 1e6)
            div = (self._fs)/2048
            self._fc = nco_freq
            self.SpecPlot._x_data = np.arange(-lim, lim, div) + (nco_freq * 1e6)
            self.SpecPlot._x_data_spectrogram = np.take(self.SpecPlot._x_data, self.SpecPlot.indices_2)
            self.SpecPlot._range = [min(self.SpecPlot._x_data), max(self.SpecPlot._x_data)]
            self.SpecPlot._updaterange = True
            
            rf_block.MixerSettings['Freq'] = nco_freq
            rf_block.UpdateEvent(xrfdc.EVENT_MIXER)
            
        def update_downsampler_and_nco_slider(freq_res):
            
            freq_res = float(freq_res['new'])
            
            """Firstly, update the virtual sampling frequency"""
            self._fs = np.round(freq_res*2048)
            
            """Get the downsampling factor for the given frequency resolution"""
            L = int(np.floor(self._axi_fs/self._fs))
            
            """If the downsampling factor is equal to 1, then disable the Low-Pass filters.
               Else, the lowpass filter should be generated and the coefficients written to the FIRs."""
            if L == 1:
                self.BandwidthSelector.BWSelector.enable = 0
            else:
                w, h, coeffs = self.BandwidthSelector.generate_lowpass(self._axi_fs,
                                                                       self._axi_fs/(2*L)-self._axi_fs*0.025,
                                                                       self._axi_fs*0.025, 256)
                """Only need one half as filter is symmetric"""
                self._coeffs = coeffs[0:128:1]
                self.BandwidthSelector.reload(self._coeffs)
                self.BandwidthSelector.config(0)
                self.BandwidthSelector.BWSelector.enable = 1
                
            """Set the downsample factor after updating the FIR coefficients"""    
            self.BandwidthSelector.set_downsample(L)
            
            """Finally update the range of the SpecPlot so that it accurately represents the bandwidth"""
            lim = self._fs/2
            div = (self._fs)/2048
            self.SpecPlot._x_data = np.arange(-lim, lim, div) + self._fc * 1e6
            self.SpecPlot._x_data_spectrogram = np.take(self.SpecPlot._x_data, self.SpecPlot.indices_2)
            self.SpecPlot._range = [min(self.SpecPlot._x_data), max(self.SpecPlot._x_data)]
            self.SpecPlot._updaterange = True
        
        def unwrap_slider_val(callback):
            return lambda slider_val : callback(slider_val['new'])
        
#         def setNyquist(zone):
#             zone = int(zone['new'])
#             self.adc_block.NyquistZone = zone
    
        # Receive Controls
        options = [0, 1, 2]
        rx_adc_drop = sipw.drop_menu_widget('ADC',options[0],options)
        self.rx_nco_txt = sipw.float_txt_widget('Center Frequency (MHz):', 64, 1, 1024, 1)
        optgen = [16e6, 32e6, 64e6, 128e6, 256e6]
        options = [i / 2048 for i in optgen]
        rx_res_drop = sipw.drop_menu_widget('Resolution (Hz):', options[3], options)  
#         self.nyquist = sipw.drop_menu_widget('Nyquist Zone:', 2, [1,2]) 
        accordion = sipw.accordion_widget('Receive', [rx_adc_drop, self.rx_nco_txt, rx_res_drop])
        
        rx_adc_drop.observe(changeADC, names='value')
        self.rx_nco_txt.observe(unwrap_slider_val(lambda v: update_nco_and_graph(self.adc_block, v)),names='value')
        rx_res_drop.observe(update_downsampler_and_nco_slider, names='value')
#         self.nyquist.observe(setNyquist, names='value')
        
        return accordion
    
    
    def WindowSetup(self):
        window = self.SpectrumWindow.Setup()
        if self.dark_theme:
            self.SpectrumWindow.fig.data[0].marker.color='white'
            
        return window
        
    def OutputSetup(self):
        
        def outputType(value):
            switcher = {
            'Magnitude' : 0,
            'PSD' : 1,
            }
            num = switcher.get(value['new'], 0)
            self.SpectrumFFT.PSD.output_selection = num
            self.SpecPlot._updaterange = True
            if num:
                self.SpecPlot._plot_spectrum.layout.yaxis['title'] = 'Power Spectral Density (dB/Hz)'
            else:
                self.SpecPlot._plot_spectrum.layout.yaxis['title'] = 'Magnitude'
            
        # Output Controls
        options = ['Magnitude', 'PSD']
        output_drop = sipw.drop_menu_widget('Analysis:', options[1], options)
        accordion = sipw.accordion_widget('Output', [output_drop])
        
        output_drop.observe(outputType, names='value')
        
        return accordion
    
    def SpectrumViewer(self, 
                  hardware_db = 1, 
                  magnitude = 0,
                  animation_period = 100,
                  animation_period_range = 100,
                  dma_period = 1/8,
                  continuous_update = True,
                  h=900,
                  colourscale='jet'):
        
        self.ison = False
        
        def start():
            self.ison = True
            if self.voila:
                self.spectrum_timer_slider.disabled = True
                self.spectrogram_timer_slider.disabled = True
            if self.en_wfall_box.value:
                self.TimerSpectrogram.start()
            self.TimerSpectrum.start()
        
        def stop():
            self.ison = False
            if self.voila:
                self.spectrum_timer_slider.disabled = False
                self.spectrogram_timer_slider.disabled = False
            self.TimerSpectrogram.stop()
            self.TimerSpectrum.stop()
        
        def en_wfall(en):
            if en['new'] == True and self.ison:
                self.TimerSpectrogram.start()
            else:
                self.TimerSpectrogram.stop()
            
        
        def start_stop_en():
            """Get ipywidget controls to stop and start the generator thread."""
            button_layout = ipw.Layout(margin='auto')
            start_button = ipw.Button(description=u'\u25B6', layout=button_layout)
            start_button.on_click(lambda _: start())
            stop_button = ipw.Button(description=u'\u25A0', layout=button_layout)
            stop_button.on_click(lambda _: stop())
            style = {'description_width': 'initial'}
            self.en_wfall_box = ipw.Checkbox(
                value=False,
                description='Enable Waterfall',
                disabled=False,
                indent=False,
                layout=ipw.Layout(width='auto'),
                style=style
            )
            self.en_wfall_box.observe(en_wfall, names='value')
            return ipw.HBox([start_button, self.en_wfall_box, stop_button])   
            
        self.SpectrumFFT.PSD.output_selection = int(hardware_db and (not magnitude))
        self.DataInspector.type = int(hardware_db or magnitude)
        self.SpecPlot = SpecPlot(self.DataInspector.get_buffer_frame(), 
                                     Fs = self._fs, 
                                     animation_period = animation_period,
                                     animation_period_range = animation_period_range,
                                     h=h, dark_theme=self.dark_theme)
        self.TimerSpectrogram = Timer(self.SpecPlot.add_frame_spectrogram, dma_period)
        self.TimerSpectrum = DmaTimer(self.update_voila, self.DataInspector.get_buffer_frame, dma_period)
        
        FDP_vbox = ipw.VBox([self.SpecPlot.get_widget(), start_stop_en()], layout=ipw.Layout(width='auto'))
        return FDP_vbox
    
    
    def ControlColumn(self):
        # Banner
        image = sipw.image_widget("assets/pynq_logo.png")

        # Return required controls as one column
        return ipw.VBox([image, self.TransmitterSetup(), self.ReceiverSetup(), self.WindowSetup(), self.OutputSetup()],layout=ipw.Layout(width='auto'))
    
       

    def AnalysisColumn(self):
        def peak_detect(change):
            self.SpecPlot._peakdetect = change['new']
            self.SpecPlot._plot_spectrum.data[1].visible = change['new']
            self.peak_flag = change['new']
            
        def update_spectrum_timer(value):
            self.TimerSpectrum = DmaTimer(self.update_voila, self.DataInspector.get_buffer_frame, value['new'])
            if value['new'] < 1/10:
                self.spectrogram_timer_slider.min = 1/10
            else: 
                self.spectrogram_timer_slider.min = value['new']
            
        def update_spectrogram_timer(value):
            self.TimerSpectrogram = Timer(self.SpecPlot.add_frame_spectrogram, value['new'])
            
        def update_buffer(value):
            self.SpecPlot._buf = value['new']
            
        def update_range(value):
            self.SpecPlot._plot_spectrum.layout.yaxis.range = value['new']
            self.SpecPlot._plot_spectrogram.data[0].zmin = value['new'][0]
            self.SpecPlot._plot_spectrogram.data[0].zmax = value['new'][1]

        def updateAvg(value):
            self.SpecPlot._avg_window = np.full((value['new'],2048),self.SpecPlot._data)
            
        image = sipw.image_widget("assets/strathclyde_logo.png")
             
        peak_toggle = sipw.check_box_widget('Peak Detection', False)    
        
        style = {'description_width': 'initial'}
        self.peak_x = ipw.FloatText(
            value=0.0,
            description='x:',
            disabled=True,
            layout=ipw.Layout(width='auto'),
            style=style
        )
        self.peak_y = ipw.FloatText(
            value=0.0,
            description='y:',
            disabled=True,
            layout=ipw.Layout(width='auto'),
            style=style
        )
        
        self.spectrum_timer_slider = sipw.float_slide_widget('Spectrum Timer:', 1/10, 1/20, 1, 1/20)
        self.spectrogram_timer_slider = sipw.float_slide_widget('Spectrogram Timer:', 1/10, 1/20, 1, 1/20)
        spectrogram_buffer_slider = sipw.int_slide_widget('Spectrogram Buffer:', 2, 1, 20, 1)
        plot_magnitude_range = sipw.int_range_widget('Range:', [-60, 20], -100, 50, 1)
        frame_avg = sipw.int_slide_widget('Frame Average: ', 1, 1, 32, 1)
        
        peak_toggle.observe(peak_detect, names='value')
        self.spectrum_timer_slider.observe(update_spectrum_timer, names='value')
        self.spectrogram_timer_slider.observe(update_spectrogram_timer, names='value')
        spectrogram_buffer_slider.observe(update_buffer, names='value')
        plot_magnitude_range.observe(update_range, names='value')
        frame_avg.observe(updateAvg, names='value')
        
        peak = sipw.accordion_widget('Peak Detection', [peak_toggle, self.peak_x, self.peak_y])
        plot_update = sipw.accordion_widget('Plot Settings', [self.spectrum_timer_slider, self.spectrogram_timer_slider, spectrogram_buffer_slider, plot_magnitude_range,frame_avg])
        
        return ipw.VBox([image, plot_update, peak], layout=ipw.Layout(width='auto'))
        
Overlay = SpectrumAnalyser
