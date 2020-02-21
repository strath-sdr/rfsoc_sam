# Spectrum Analyser on PYNQ

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

SETUP : ~40 mins 

## Hardware Needed

	- Laptop/Computer
	- ZCU111 + breakout card 
	- micro SD card
	- one/two antennae (if using)
	- loopback cable
	- power cable
	- micro usb to usb
	- ethernet
	- wifi dongle (if not doing shared internet over ethernet)

## Software Needed (host)

	- Web browser (chrome) 


## Hardware Setup 
	1. Connect breakout card to ZCU111
	2. Connect ethernet and power
	3. There is a jpg to show where: the loopback connects (red circles - ADC, tile 0, channel 0 | DAC, tile 1, channel 2); antenna (pink circle - ADC, tile 0, channel 1).
	
<p align="center">
<img src="../../blob/master/img/rfsoc_setup.png" width="800">
<p/>


## Setup PYNQ image

	1. Obtain a PYNQ 2.5 image

	2. Connect the board to the internet 

	3. Install Voila and the gridstack template on the ZCU111, then upgrade jupyter:

		(in JupyterLab terminal)
		$ pip3 install voila
		$ pip3 install voila-gridstack
		$ pip3 install --upgrade jupyter 

	4. Copy this folder 'spectrum_analyser_demo' to 'jupyter_notebooks' on the board

	5. The bitstream was made in 2019.1 so this throws up some errors on the current 2.5 image.
	   To fix this edit the file "/usr/local/lib/python3.6/dist-packages/xrfdc/config.py" on the board.
	   Comment out lines 46,47,60,90,91, which are: 
	       _DAC_DDP: FifoEnable, AdderEnable
	       _ADC_DDP: FifoEnable
	       Config:   MasterADCTile, MasterDACTile

## Running the Spectrum Analyser Dashboard 
	
	1. To generate the voila dashboard from the notebook:
		(in JupyterLab terminal)
		$ voila --template=gridstack <path_to_notebook> --theme=dark
		(voila --template=gridstack jupyter_notebooks/spectrum_analyser/RFSoC\ Spectrum\ Analyser-Voila.ipynb --theme=dark)
	
	2. To load the dashboard go to the address provided in a browser, usually "http://localhost:8866/", where localhost is the IP of the board 

	3. It will take a bit of time to load as it has to run all the cells including loading the bitstream. 
		The scaling of the dashboard will depend on the screen resolution/aspect ratio. 
		It should scale on the horizontal but you may need to tinker with the vertical by adjusting the zoom on the browser and refreshing the page so the plotly plots re-adjust

	4. If you need to restart the dashboard, close the terminal in which the voila command was run and open a new terminal. Repeat from step 1. 

In Jupyter

	ADC 0 is loopback
	ADC 1 is antenna 

