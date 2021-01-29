overlay_name := rfstrath
design_name := block_design

all: project block_design bitstream
	@echo
	@tput setaf 2 ; "Built $(overlay_name) successfully!"; tput sgr0;
	@echo

project:
	vivado -mode batch -source make_project.tcl -notrace

block_design:
	vivado -mode batch -source make_block_design.tcl -notrace

bitstream:
	vivado -mode batch -source make_bitstream.tcl -notrace