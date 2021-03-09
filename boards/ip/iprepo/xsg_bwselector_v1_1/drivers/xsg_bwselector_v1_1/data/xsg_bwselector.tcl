proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "xsg_bwselector" "NUM_INSTANCES" "DEVICE_ID" "C_XSG_BWSELECTOR_S_AXI_BASEADDR" "C_XSG_BWSELECTOR_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "xsg_bwselector_g.c" "xsg_bwselector" "DEVICE_ID" "C_XSG_BWSELECTOR_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "xsg_bwselector" "DEVICE_ID" "C_XSG_BWSELECTOR_S_AXI_BASEADDR" "C_XSG_BWSELECTOR_S_AXI_HIGHADDR" 

}