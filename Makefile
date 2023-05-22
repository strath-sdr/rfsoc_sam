all: rfsoc2x2 rfsoc4x2 zcu111 zcu208

rfsoc2x2:
	$(MAKE) -C boards/RFSoC2x2/rfsoc_sam/

rfsoc4x2:
	$(MAKE) -C boards/RFSoC4x2/rfsoc_sam/

zcu111:
	$(MAKE) -C boards/ZCU111/rfsoc_sam/

zcu208:
	$(MAKE) -C boards/ZCU208/rfsoc_sam/
