<img src="strathsdr_banner.png" width="100%">

# Spectrum Analyser on PYNQ
This repository hosts an RFSoC Spectrum Analyser tool compatible with [PYNQ image v2.7](https://github.com/Xilinx/PYNQ/releases) for the ZCU111, RFSoC2x2, and RFSoC4x2 development board.

<p align="center">
  <img src="./demonstration.gif" width="75%" height="75%" />
</p>

## Quick Start
Follow the instructions below to install the Spectrum Analyser now. **You will need to give your board access to the internet**.
* Power on your RFSoC development board with an SD Card containing a fresh PYNQ v2.7 image.
* Navigate to Jupyter Labs by opening a browser (preferably Chrome) and connecting to `http://<board_ip_address>:9090/lab`.
* We need to open a terminal in Jupyter Lab. Firstly, open a launcher window as shown in the figure below:

<p align="center">
  <img src="./open_jupyter_launcher.jpg" width="50%" height="50%" />
</p>

* Now open a terminal in Jupyter as illustrated below:

<p align="center">
  <img src="./open_terminal_window.jpg" width="50%" height="50%" />
</p>

Run the code below in the jupyter terminal to install the Spectrum Analyser.

```sh
pip3 install git+https://github.com/strath-sdr/rfsoc_sam
```

Once installation has complete you will find the Spectrum Analyser notebooks in the Jupyter workspace directory. The folder will be named 'spectrum-analyzer'.

## Using the Project Files
The following software is required to use the project files in this repository.
- Vivado Design Suite 2020.2
- System Generator for DSP
- MATLAB R2020a

### Vivado
This project can be built with Vivado from the command line. Open Vivado 2020.2 and execute the following into the tcl console:
```sh
cd /<repository-location>/boards/<board-name>/rfsoc_sam/
```
Now that we have moved into the correct directory, make the Vivado project by running the make commands below sequentially.
```sh
make block_design
make bitstream
```

Alternatively, you can run the entire project build by executing the following into the tcl console:
```sh
make all
```

## License 
[BSD 3-Clause](../../blob/master/LICENSE)
