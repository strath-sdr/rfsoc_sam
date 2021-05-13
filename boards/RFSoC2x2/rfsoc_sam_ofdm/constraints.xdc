## RFSoC2x2 Constraints

# Reset Control
set_property PACKAGE_PIN AT9 [get_ports "lmk_reset[0]"]
set_property IOSTANDARD LVCMOS18 [get_ports "lmk_reset[0]"]

# An off-chip clock to handle clock conversion
set_property PACKAGE_PIN G13 [get_ports "sys_clk_clk_p"]
set_property IOSTANDARD DIFF_HSTL_I_12 [get_ports "sys_clk_clk_p"]