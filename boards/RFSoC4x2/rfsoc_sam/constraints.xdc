## RFSoC4x2 Constraints

# An off-chip clock to handle clock conversion
set_property PACKAGE_PIN G13 [get_ports sys_clk_clk_p]
set_property PACKAGE_PIN G12 [get_ports sys_clk_clk_n]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_clk_n]