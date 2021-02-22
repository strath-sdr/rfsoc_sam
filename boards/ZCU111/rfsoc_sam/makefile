overlay_name := rfsoc_sam
design_name := block_design

all: project block_design bitstream_file
	@echo
	@tput setaf 2 ; "Built $(overlay_name) successfully!"; tput sgr0;
	@echo

project:
	vivado -mode batch -source make_project.tcl -notrace

block_design:
	vivado -mode batch -source make_block_design.tcl -notrace

bitstream_file:
	vivado -mode batch -source make_bitstream.tcl -notrace