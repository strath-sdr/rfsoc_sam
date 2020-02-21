<img src="https://www.strath.ac.uk/media/1newwebsite/webteam/logos/xUoS_Logo_Horizontal.png.pagespeed.ic.M6gv_BmDx1.png" width="350">

# Spectrum Analyser on PYNQ & ZCU111

Two notebooks are included in this repository. An explanatory notebook provides information on the hardware design and Python overlay and how these interact. The second notebook is used to launch the Voila dashboard.

<p align="center">
  <img src="../../blob/master/img/spectrum_analyser.gif" width="800" height="366" />
<p/>

## Quick Start

This repository is compatible with [PYNQ image v2.5](https://github.com/Xilinx/PYNQ/releases) for [ZCU111](https://www.xilinx.com/products/boards-and-kits/zcu111.html).

Open a terminal in Jupyter Lab and run:
```sh
pip3 install git+https://github.com/strath-sdr/rfsoc_sam.git
```

## First Time Setup (~40 mins)

### Required Hardware
- [x] Laptop/Computer
- [x] ZCU111 + breakout card 
- [x] power cable
- [x] micro usb to usb cable
- [x] micro SD card
- [x] ethernet cable
- [x] one/two antennae (if using)
- [x] loopback cable
- [x] ethernet usb adapter (if required)
- [x] usb wifi dongle (if not doing shared internet over ethernet)

### Required Software (host)
- [x] Web browser (chrome) 

### Hardware Setup 
One DAC and three ADCs are made available in this design. The table below details how the notebooks will refer to these ADCs and which tile/channel they correspond to.

|Converter| Tile | Channel | Colour |
|:----:   |:----:|:-------:|:------:|
| DAC     |  1   |    2    |  Red   |
| ADC0    |  0   |    0    |  Green |
| ADC1    |  0   |    1    | Pink   |
| ADC2    |  1   |    0    | Orange |
 
If using the loopback cable, ensure it is connected between the DAC ane one of the ADCs. the image below shows it connected to ADC0. 
	
<p align="center">
<img src="../../blob/master/img/rfsoc_setup.png" width="800">
<p/>


### Setup PYNQ image

Obtain a [PYNQ 2.5 image](https://github.com/Xilinx/PYNQ/releases)
Install [Voila](https://github.com/voila-dashboards/voila) and the **gridstack** template on the ZCU111, then upgrade Jupyter.

Open a terminal in Jupyter Lab and run the following:
```sh
pip3 install voila
pip3 install voila-gridstack
pip3 install --upgrade jupyter 
```

Clone this repository to the board using pip:
```sh 
pip3 install git+https://github.com/strath-sdr/rfsoc_sam.git
```

The bitstream was created using Vivado 2019.1 so this throws up some errors on the current 2.5 image.
To fix this edit the file "/usr/local/lib/python3.6/dist-packages/xrfdc/config.py" on the board.
Comment out lines 46,47,60,90,91, which are: 
       _DAC_DDP | FifoEnable, AdderEnable
       _ADC_DDP | FifoEnable
       Config |   MasterADCTile, MasterDACTile

## Running the Spectrum Analyser Dashboard 
	
	1. To generate the voila dashboard from the notebook:
		(in JupyterLab terminal)
		$ voila --template=gridstack jupyter_notebooks/spectrum_analyser/RFSoC\ Spectrum\ Analyser-Voila.ipynb --theme=dark
	
	2. To load the dashboard go to the address provided in a browser, usually "http://localhost:8866/", where localhost is the IP of the board 

	3. It will take a bit of time to load as it has to run all the cells including loading the bitstream. 
		The scaling of the dashboard will depend on the screen resolution/aspect ratio. 
		It should scale on the horizontal but you may need to tinker with the vertical by adjusting the zoom on the browser and refreshing the page so the plotly plots re-adjust

	4. If you need to restart the dashboard, close the terminal in which the voila command was run and open a new terminal. Repeat from step 1. 

## License 
[BSD 3-Clause](https://github.com/strath-sdr/rfsoc_qpsk/blob/master/LICENSE)
