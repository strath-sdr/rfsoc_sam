__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

import numpy as np
import plotly.io as pio
from pynq import DefaultIP, allocate
import struct
import time
import threading
from .sdr_plots import Spectrum, Spectrogram
pio.renderers.default = "browser"


class SpectrumAnalyser(DefaultIP):
    """Driver for the Spectrum Analyser core.
    
    The Spectrum Analyser contains an SSR converter,
    reprogrammable window upto 8192 samples, several
    FFT cores (N=64 to N=8192), a spectrum processor
    for converting to power spectrum, PSD and dB, and
    finally an automatic DMA that transfers the
    spectrum to memory when ready.
    
    Attributes:
    ----------
    description : A dict
        IP dict entry for the IP core

    plot : An sdr_plots.Spectrum object
        The Spectrum object displays the frequency
        spectrum data to the user with Plotly go.

    spectrogram : An sdr_plot.Spectrogram object
        The Spectrogram object displays the frequency
        spectrum over time using a waterfall
        plotting technique.

    timer : A FunctionTimer object
        A threaded timer for updating the spectrum
        analyser plots with new data from the DMA.

    width : An int
        The width of the spectrum and spectrogram plots.

    height : An int
        The height of the spectrum and spectrogram plots.

    plotly_theme : A string
        The plot theme for the spectrum and spectrogram plots. Select
        from 'seaborn', 'simple_white', 'plotly', 'plotly_white', 'plotly_dark'.

    centre_frequency : A float
        The centre frequency of the spectrum and spectrogram plots
        in Hz.

    spectrum_units : A string
        The units used to measure the y-axis of the spectrum plot. Select
        from 'dBW', 'dBm'.

    spectrum_type : A string
        The type of spectrum to display the spectrum plot. Select from
        'Power Spectrum', 'Power Spectral Density'.

    update_frequency : An int
        The update frequency of the function timer object, responsible
        for updating the spectrum and spectrogram plots with new data.

    fft_size : An int
        The size of the FFT core in the spectrum analyser IP core in hardware.
        Select from 8192, 4096, 2048, 1024, 512, 256, 128, 64.

    window : A string
        The window used by the spectrum analyser IP core in hardware.
        Select from 'rectangular', 'bartlett', 'blackman', 'hamming',
        'hanning'.

    spectrum_window : A numpy array
        Read only property, returning a numpy array of the window used
        by the spectrum analyser IP core in hardware.

    dma_enable : A bool
        The DMA enable, if true, automatically writes FFT spectrum data
        into memory, else, it does nothing.

    sample_frequency : A float
        The sample frequency of the time domain signal in Hz. This property
        does not correlate with the RF-DC sample frequency. It is simply
        used to inform the spectrum and spectrogram plots of the overall
        system sample frequency.

    nyquist_stopband : A float
        The Nyquist Stopband of the spectrum. This property ensures
        that the stopband of the decimation filters are considered when
        displaying the spectrum to the user.

    line_colour : A string
        The colour of the trace on the spectrum plot. Any CSS colour can
        be specified.

    line_fill : A string
        The colour of the area below the spectrum plot trace. Any CSS colour
        can be specified.

    zmin : A float
        The minimum intensity of the spectrogram plot that should
        be set to zero pixel intensity.

    zmax : A float
        The maximum intensity of the spectrogram plot that should
        be set to 255 pixel intensity.

    quality : A float
        The quality of the spectrogram plot out of 100%.

    ssr_packetsize : An int
        The SSR packetsize of the AXI-Stream SSR subset converter. The
        user should note that the ssr_packetsize is multiplied by 8 in
        hardware. For example, if the user wants a packetsize of 512, then
        an ssr_packetsize of 64 should be specified.

    ssr_mode : An int
        The ssr_mode determines whether the SSR is 8, 4, 2, or 1 samples per
        AXI-Stream clock cycle. By setting the ssr_mode to 3, 2, 1, or 0,
        will result in an SSR of 8, 4, 2, or 1 respectively.

    window_ready : A bool
        Read only property that informs the user if the window Block RAM
        can be written to. Used for window update purposes.

    dma_bufferpointer : An int
        Read only property. The automatic DMA uses a triple buffer to transfer 
        spectrum data. The bufferpointer informs the user of the last accessed
        memory buffer.

    dma_status : An int
        Read only property. For debugging purposes.
        
    """
    
    def __init__(self,
                 description,
                 sample_frequency = 4096e6,
                 update_frequency = 6,
                 centre_frequency = 0,
                 decimation_factor = 2,
                 nyquist_stopband = 1,
                 plot_width = 800,
                 plot_height = 400):
        """Construct an instance of the driver for the spectrum
        analyser IP core. This driver will bind to a spectrum
        analyser IP core automatically using PYNQ. The user should
        not have to initialise the class manually.
        """
        super().__init__(description=description)
        
        """SSR Subset Converter Registers. These need to be accessible
        by other classes as they control the SSR words.
        """
        self.ssr_mode = 3
        self.ssr_packetsize = 512
        
        """Window Registers and type
        """
        self._window_packetsize = 4096
        self._window_address = 0
        self._window_transfer = 0
        
        self._window_squaresum = 4096
        self._window_sum = 4096
        self._window_type = 'rectangular'
        
        """Spectrum Registers
        """
        self._spectrum_units = 0
        self._spectrum_type = 1
        self._spectrum_vrms = 0
        self._spectrum_typescale = int(struct.unpack('!i',struct.pack('!f',float(sample_frequency/4096)))[0])
        self._spectrum_powerscale = int(struct.unpack('!i',struct.pack('!f',float(1/(sample_frequency*4096))))[0])
        self._spectrum_fftselector = 6
        
        """Auto DMA Registers and buffer initialisation
        """
        self._dma_length = 4096
        self._buffer = [allocate(shape=(self._dma_length,), dtype=np.single) for x in range(0, 3) ]
        self._dma_bufferaddress_0 = self._buffer[0].device_address
        self._dma_bufferaddress_1 = self._buffer[0].device_address
        self._dma_bufferaddress_2 = self._buffer[0].device_address
        self.dma_enable = 0
        self.__dma_enable = 0
        self._dma_count = 100000000 # No touch
        
        """Initialise
        """
        self._sample_frequency = int(sample_frequency)
        self._decimation_factor = decimation_factor
        self._update_frequency = update_frequency
        self._last_buffer = np.zeros(self._dma_length, dtype=np.single) - 300
        self._number_samples = int(2**(self._spectrum_fftselector+6))
        self._centre_frequency = centre_frequency
        self._nyquist_stopband = nyquist_stopband
        self._width = plot_width
        self._height = plot_height
        
        """Set the plotly theme
        """
        self.plot_theme = 'plotly'
        
        """Create Spectrum Plot object for presenting the frequency spectrum.
        """
        self.plot = Spectrum(plot_data=np.zeros((self._number_samples,), dtype=np.single),
                             sample_frequency=self._sample_frequency,
                             decimation_factor=2,
                             number_samples=self._number_samples,
                             centre_frequency=self._centre_frequency,
                             nyquist_stopband=self._nyquist_stopband,
                             xlabel='Frequency (Hz)',
                             ylabel='Power Spectrum (dBFS)',
                             plot_width=self._width,
                             plot_height=self._height,
                             display_mode=0,
                             spectrum_mode=True)
        
        """Create Spectrogram Plot object for presenting the waterfall spectrum.
        """
        self.spectrogram = Spectrogram(sample_frequency=self._sample_frequency,
                                       centre_frequency=self._centre_frequency,
                                       nyquist_stopband=self._nyquist_stopband,
                                       width=self._width,
                                       height=self._height,
                                       plot_time=10)
        
        """Create a Function Timer object to enable plot data updates through threading.
        """
        self.timer = FunctionTimer(plot=[self.plot, self.spectrogram],
                                    dma=self,
                                    update_frequency=self._update_frequency)

    @property
    def width(self):
        """The plot width of the spectrum and spectrogram plots.
        """
        return self._width
    
    @width.setter
    def width(self, width):
        self._width = width
        self.plot.width = width
        self.spectrogram.width = width
        
    @property
    def height(self):
        """The plot height of the spectrum and spectrogram plots.
        """
        return self._height
    
    @height.setter
    def height(self, height):
        self._height = height
        self.plot.height = height
        self.spectrogram.height = height
        
    @property
    def plotly_theme(self):
        """The plot theme for the spectrum and spectrogram plots.
        """
        return pio.templates.default
    
    @plotly_theme.setter
    def plotly_theme(self, theme):
        if theme in ['seaborn', 'simple_white', 'plotly', 
                     'plotly_white', 'plotly_dark']:
            #pio.templates.default = theme
            self.plot.template = theme
            self.spectrogram.template = theme
        
    @property
    def centre_frequency(self):
        """The centre frequency of the spectrum and spectrogram plots.
        """
        return self._centre_frequency
    
    @centre_frequency.setter
    def centre_frequency(self, centre_frequency):
        self._centre_frequency = centre_frequency
        self.plot.centre_frequency = centre_frequency
        self.spectrogram.centre_frequency = centre_frequency
        
    @property
    def spectrum_units(self):
        """The units used to measure the y-axis of the spectrum plot.
        """
        if self._spectrum_units:
            return 'dBm'
        else:
            return 'dBFS'
        
    @spectrum_units.setter
    def spectrum_units(self, spectrum_units):
        if spectrum_units == 'dBm':
            self._spectrum_units = 1
        elif spectrum_units == 'dBFS':
            self._spectrum_units = 0
        self.spectrum_type = self.spectrum_type
        
    @property
    def spectrum_type(self):
        """The type of spectrum to display the spectrum plot.
        """
        if self._spectrum_type:
            return 'Power Spectrum'
        else:
            return 'Power Spectral Density'
    
    @spectrum_type.setter
    def spectrum_type(self, spectrum_type):
        if spectrum_type == 'Power Spectrum':
            self.plot._clear_plot()
            self._spectrum_type = 1
            self.plot.ylabel = ''.join([spectrum_type, ' (', self.spectrum_units, ')'])
            
        elif spectrum_type == 'Power Spectral Density':
            self.plot._clear_plot()
            self._spectrum_type = 0
            self.plot.ylabel = ''.join([spectrum_type, ' (', self.spectrum_units, ')'])   
        
    @property
    def update_frequency(self):
        """The update frequency of the function timer object.
        """
        return self.timer.update_frequency
    
    @update_frequency.setter
    def update_frequency(self, update_frequency):
        if update_frequency > 16:
            self.timer.update_frequency = 16
        elif update_frequency < 1:
            self.timer.update_frequency = 1
        else:
            self.timer.update_frequency = update_frequency
            
    @property
    def fft_size(self):
        """The size of the FFT core in the spectrum analyser IP
        Core in hardware.
        """
        return int(2**(self._spectrum_fftselector+6))
    
    @fft_size.setter
    def fft_size(self, fft_size):
        if fft_size in [8192, 4096, 2048, 1024, 512, 256, 128, 64]:
            running = False
            if self.dma_enable:
                self.dma_enable = 0
                running = True
            self.ssr_packetsize = 0
            time.sleep(0.2)
            self._dma_length = fft_size
            [self._buffer[x].freebuffer() for x in range(0, 3)]
            self._buffer = [allocate(shape=(self._dma_length,), dtype=np.single) for x in range(0, 3) ]
            self._dma_bufferaddress_0 = self._buffer[0].device_address
            self._dma_bufferaddress_1 = self._buffer[0].device_address
            self._dma_bufferaddress_2 = self._buffer[0].device_address
            self._spectrum_fftselector = int(np.log2(fft_size)-6)
            self._window_packetsize = fft_size
            self.window = self._window_type
            self.ssr_packetsize = int(fft_size/8)
            self.plot.number_samples = fft_size
            self._number_samples = int(2**(self._spectrum_fftselector+6))
            self._spectrum_typescale = \
                int(struct.unpack('!i',struct.pack('!f',float((self._sample_frequency/self._decimation_factor)/(self._number_samples))))[0])
            self._spectrum_powerscale = \
                int(struct.unpack('!i',struct.pack('!f',float(1/((self._sample_frequency/self._decimation_factor)*self._window_squaresum))))[0])
            if running:
                self.dma_enable = 1
      
    @property
    def window(self):
        """The window used by the spectrum analyser IP Core in hardware.
        """
        return self._window_type
    
    @window.setter
    def window(self, window):
        window_size = self._window_packetsize
        buffer = allocate(shape=(window_size,), dtype=np.int32)
        self._window_address = buffer.device_address
        if window == 'rectangular':
            buffer[:] = np.int32(np.ones(window_size)[:]*2**14)
        elif window == 'bartlett':
            buffer[:] = np.int32(np.bartlett(window_size)[:]*2**14)
        elif window == 'blackman':
            buffer[:] = np.int32(np.blackman(window_size)[:]*2**14)
        elif window == 'hamming':
            buffer[:] = np.int32(np.hamming(window_size)[:]*2**14)
        elif window == 'hanning':
            buffer[:] = np.int32(np.hanning(window_size)[:]*2**14)
        else:
            buffer[:] = np.int32(np.ones(window_size)[:]*2**14)
            window = 'rectangular'
        self._window_transfer = 1
        while not self.window_ready:
            pass
        self._window_transfer = 0
        self._window_type = window
        self._window_squaresum = np.sum((np.array(buffer, dtype=np.single)*2**-14)**2)
        self._window_sum = np.sum((np.array(buffer, dtype=np.single)))
        buffer.freebuffer()
        self._spectrum_typescale = \
            int(struct.unpack('!i',struct.pack('!f',float((self._sample_frequency/self._decimation_factor)/(self._number_samples))))[0])
        self._spectrum_powerscale = \
            int(struct.unpack('!i',struct.pack('!f',float(1/((self._sample_frequency/self._decimation_factor)*self._window_squaresum))))[0])
        
    @property
    def spectrum_window(self):
        """A numpy array of the window used by the spectrum analyser IP Core
        in hardware.
        """
        window_type = self._window_type
        window_size = self._window_packetsize
        if window_type == 'rectangular':
            buffer = np.array(np.ones(window_size)[:], dtype=np.single)
        elif window_type == 'bartlett':
            buffer = np.array(np.bartlett(window_size)[:], dtype=np.single)
        elif window_type == 'blackman':
            buffer = np.array(np.blackman(window_size)[:], dtype=np.single)
        elif window_type == 'hamming':
            buffer = np.array(np.hamming(window_size)[:], dtype=np.single)
        elif window_type == 'hanning':
            buffer = np.array(np.hanning(window_size)[:], dtype=np.single)
        else:
            buffer = np.array(np.ones(window_size)[:], dtype=np.single)
        return buffer
        
    @property
    def dma_enable(self):
        """The DMA enable. If true the automatic data mover writes the
        FFT spectrum into memory, else it does nothing.
        """
        return self.__dma_enable
    
    @dma_enable.setter
    def dma_enable(self, dma_enable):
        self._dma_enable = dma_enable
        self.__dma_enable = dma_enable
        
    @property
    def sample_frequency(self):
        """The sample frequency of the time domain signal.
        """
        return self._sample_frequency
    
    @sample_frequency.setter
    def sample_frequency(self, sample_frequency):
        self._sample_frequency = sample_frequency
        self.plot.sample_frequency = sample_frequency
        self.spectrogram.sample_frequency = sample_frequency
        
    @property
    def decimation_factor(self):
        """The decimation factor of the RF DC frontend and bwselector.
        """
        return self._decimation_factor
    
    @decimation_factor.setter
    def decimation_factor(self, decimation_factor):
        self._decimation_factor = decimation_factor
        self.plot.decimation_factor = decimation_factor
        self.spectrogram.decimation_factor = decimation_factor
        
    @property
    def nyquist_stopband(self):
        """The Nyquist Stopband of the spectrum. This property ensures
        that the stopband of the decimation filters are considered when
        displaying the spectrum to the user.
        """
        return self._nyquist_stopband
    
    @nyquist_stopband.setter
    def nyquist_stopband(self, nyquist_stopband):
        self._nyquist_stopband = nyquist_stopband
        self.plot.nyquist_stopband = nyquist_stopband
        self.spectrogram.nyquist_stopband = nyquist_stopband
        
    @property
    def line_colour(self):
        """The colour of the trace on the spectrum plot. Its nice to
        have a selection of colours.
        """
        return self.plot.line_colour
    
    @line_colour.setter
    def line_colour(self, line_colour):
        self.plot.line_colour = line_colour
        
    @property
    def line_fill(self):
        """The colour of the area below the spectrum plot trace. Its
        nice to colour things in."""
        return self.plot.line_fill
    
    @line_fill.setter
    def line_fill(self, line_fill):
        self.plot.line_fill = line_fill
        
    @property
    def zmin(self):
        """The minimum intensity of the spectrogram plot that should
        be set to zero pixel intensity."""
        return self.spectrogram.zmin
    
    @zmin.setter
    def zmin(self, zmin):
        self.spectrogram.zmin = zmin
        
    @property
    def zmax(self):
        """The maximum intensity of the spectrogram plot that should
        be set to 255 pixel intensity."""
        return self.spectrogram.zmax
    
    @zmax.setter
    def zmax(self, zmax):
        self.spectrogram.zmax = zmax
        
    @property
    def quality(self):
        """The quality of the spectrogram plot out of 100%.
        """
        return self.spectrogram.quality
    
    @quality.setter
    def quality(self, quality):
        self.spectrogram.quality = quality
        
    def get_frame(self):
        """Return a numpy array single precision
        
        Retrieves a frame of data from memory using the last known
        pointer in hardware.
        """
        while not self.dma_enable:
            pass
        return np.array(self._buffer[0], dtype=np.single)
        
    bindto = ['xilinx.com:ip:SpectrumAnalyser:1.1']
    
_spectrumAnalyser_props = [("ssr_packetsize",       0x104),
                           ("ssr_mode",             0x108),
                           ("_spectrum_units",      0x10C),
                           ("_spectrum_type",       0x110),
                           ("_spectrum_vrms",       0x114),
                           ("_spectrum_typescale",   0x118),
                           ("_spectrum_powerscale",  0x11C),
                           ("_spectrum_fftselector", 0x120),
                           ("_window_packetsize",    0x124),
                           ("_window_address",       0x128),
                           ("_window_transfer",      0x12C),
                           ("_dma_length",           0x130),
                           ("_dma_bufferaddress_0",  0x134),
                           ("_dma_bufferaddress_1",  0x138),
                           ("_dma_bufferaddress_2",  0x13C),
                           ("_dma_enable",          0x140),
                           ("_dma_count",           0x144),
                           ("window_ready",         0x148),
                           ("dma_bufferpointer",    0x14C),
                           ("dma_status",           0x150)]

def _create_mmio_property(addr):
    """Returns a python property.
    
    Create mmio getter and setters for hardware registers.
    """
    def _get(self):
        return self.read(addr)
    
    def _set(self, value):
        self.write(addr, value)
        
    return property(_get, _set)

"""Create the Spectrum Analyser hardware register properties."""
for (name, addr) in _spectrumAnalyser_props:
    setattr(SpectrumAnalyser, name, _create_mmio_property(addr))
    
                                  
class FunctionTimer():
    """A thread timer class for updating the spectrum analyser
    plots.
    
    Attributes:
    ----------
    update_frequency : The frequency in Hz that the timer updates
        the spectrum analyser plots.
    
    stopping : If true, the timer is in the process of halting,
        else false.
        
    stopped : If true, the timer has completely stopped, else
        false.
        
    """
    
    def __init__(self,
                 plot,
                 dma,
                 update_frequency):
        """Construct an instance of the thread timer class for
        spectrum analyser plot updates.
        """
        self._plot = plot
        self._time = float(1/update_frequency)
        self._dma = dma
        self.stopping = True
        self.stopped = True
        
    @property
    def update_frequency(self):
        """The frequency in Hz that the timer updates
        the spectrum analyser plots.
        """
        return float(1/self._time)
    
    @update_frequency.setter
    def update_frequency(self, update_frequency):
        self._time = float(1/update_frequency)
        
    def _do(self):
        """Perform the threading operation until the
        user calls the stop() method."""
        while not self.stopping:
            next_timer = time.time() + self._time
            data = self._dma.get_frame()
            if data.any():
                for plot in self._plot:
                    plot.data = data
            sleep_time = next_timer - time.time()
            if sleep_time > 0:
                time.sleep(sleep_time)
        self.stopped = True
                
    def start(self):
        """Initiate the threading operation by setting
        stopping and stopped to False."""
        if self.stopping:
            self.stopping = False
            self.stopped = False
            thread = threading.Thread(target=self._do)
            thread.start()
            
    def stop(self):
        """Stop the threading operation, set stopping
        to true."""
        self.stopping = True