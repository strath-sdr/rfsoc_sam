# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator. 
#


namespace eval ::xilinx::dsp::planaheaddriver {
	set Compilation {IP Catalog}
	set CompilationFlow {IP}
	set CreateInterfaceDocument {off}
	set DSPDevice {xczu28dr}
	set DSPFamily {zynquplus}
	set DSPPackage {ffvg1517}
	set DSPSpeed {-2-e}
	set FPGAClockPeriod 3.90625
	set GenerateTestBench 0
	set HDLLanguage {vhdl}
	set IPOOCCacheRootPath {C:/Users/david/AppData/Local/Xilinx/Sysgen/SysgenVivado/win64.o/ip}
	set IP_Auto_Infer {1}
	set IP_Categories_Text {System Generator for DSP}
	set IP_Common_Repos {1}
	set IP_Description {}
	set IP_Dir {../../iprepo}
	set IP_Library_Text {RFSoC}
	set IP_LifeCycle_Menu {1}
	set IP_Logo {sysgen_icon_100.png}
	set IP_Name {xsg_bwselector}
	set IP_Revision {240613775}
	set IP_Socket_IP {0}
	set IP_Socket_IP_Proj_Path {}
	set IP_Vendor_Text {User Company}
	set IP_Version_Text {1.0}
	set ImplStrategyName {Vivado Implementation Defaults}
	set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
	set Project {xsg_bwselector}
	set ProjectFiles {
		{{conv_pkg.vhd} -lib {xil_defaultlib}}
		{{synth_reg.vhd} -lib {xil_defaultlib}}
		{{synth_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{srl17e.vhd} -lib {xil_defaultlib}}
		{{srl33e.vhd} -lib {xil_defaultlib}}
		{{synth_reg_reg.vhd} -lib {xil_defaultlib}}
		{{single_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{xlclockdriver_rd.vhd} -lib {xil_defaultlib}}
		{{vivado_ip.tcl}}
		{{xsg_bwselector_axi_lite_interface_verilog.v}}
		{{conv_pkg.v}}
		{{synth_reg.v}}
		{{synth_reg_w_init.v}}
		{{convert_type.v}}
		{{xsg_bwselector.mdd}}
		{{xsg_bwselector_hw.h}}
		{{xsg_bwselector.h}}
		{{xsg_bwselector_sinit.c}}
		{{xsg_bwselector.c}}
		{{xsg_bwselector_linux.c}}
		{{xsg_bwselector.mtcl}}
		{{Makefile.mak}}
		{{index.html}}
		{{xsg_bwselector_entity_declarations.vhd} -lib {xil_defaultlib}}
		{{xsg_bwselector.vhd} -lib {xil_defaultlib}}
		{{xsg_bwselector_clock.xdc}}
		{{xsg_bwselector.xdc}}
	}
	set SimPeriod 3.90625e-09
	set SimTime 1.6e-05
	set SimulationTime {16203.90625000 ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {C:/GitHub/strath_sdr/rfsoc_sam_private/boards/ip/sysgen/netlist}
	set TopLevelModule {xsg_bwselector}
	set TopLevelSimulinkHandle 39774
	set VHDLLib {xil_defaultlib}
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface s_axis_re_tvalid Name {s_axis_re_tvalid}
	dict set TopLevelPortInterface s_axis_re_tvalid Type Bool
	dict set TopLevelPortInterface s_axis_re_tvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface s_axis_re_tvalid BinaryPoint 0
	dict set TopLevelPortInterface s_axis_re_tvalid Width 1
	dict set TopLevelPortInterface s_axis_re_tvalid DatFile {xsg_bwselector_bandwidth_selector_axi_stream_slave_interface_s_axis_re_tvalid.dat}
	dict set TopLevelPortInterface s_axis_re_tvalid IconText {s_axis_re_tvalid}
	dict set TopLevelPortInterface s_axis_re_tvalid Direction in
	dict set TopLevelPortInterface s_axis_re_tvalid Period 1
	dict set TopLevelPortInterface s_axis_re_tvalid Interface 0
	dict set TopLevelPortInterface s_axis_re_tvalid InterfaceName {}
	dict set TopLevelPortInterface s_axis_re_tvalid InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_re_tvalid ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface s_axis_re_tvalid Locs {}
	dict set TopLevelPortInterface s_axis_re_tvalid IOStandard {}
	dict set TopLevelPortInterface s_axis_re_tdata Name {s_axis_re_tdata}
	dict set TopLevelPortInterface s_axis_re_tdata Type Fix_128_0
	dict set TopLevelPortInterface s_axis_re_tdata ArithmeticType xlSigned
	dict set TopLevelPortInterface s_axis_re_tdata BinaryPoint 0
	dict set TopLevelPortInterface s_axis_re_tdata Width 128
	dict set TopLevelPortInterface s_axis_re_tdata DatFile {xsg_bwselector_bandwidth_selector_axi_stream_slave_interface_s_axis_re_tdata.dat}
	dict set TopLevelPortInterface s_axis_re_tdata IconText {s_axis_re_tdata}
	dict set TopLevelPortInterface s_axis_re_tdata Direction in
	dict set TopLevelPortInterface s_axis_re_tdata Period 1
	dict set TopLevelPortInterface s_axis_re_tdata Interface 0
	dict set TopLevelPortInterface s_axis_re_tdata InterfaceName {}
	dict set TopLevelPortInterface s_axis_re_tdata InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_re_tdata ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface s_axis_re_tdata Locs {}
	dict set TopLevelPortInterface s_axis_re_tdata IOStandard {}
	dict set TopLevelPortInterface s_axis_im_tvalid Name {s_axis_im_tvalid}
	dict set TopLevelPortInterface s_axis_im_tvalid Type Bool
	dict set TopLevelPortInterface s_axis_im_tvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface s_axis_im_tvalid BinaryPoint 0
	dict set TopLevelPortInterface s_axis_im_tvalid Width 1
	dict set TopLevelPortInterface s_axis_im_tvalid DatFile {xsg_bwselector_bandwidth_selector_axi_stream_slave_interface_s_axis_im_tvalid.dat}
	dict set TopLevelPortInterface s_axis_im_tvalid IconText {s_axis_im_tvalid}
	dict set TopLevelPortInterface s_axis_im_tvalid Direction in
	dict set TopLevelPortInterface s_axis_im_tvalid Period 1
	dict set TopLevelPortInterface s_axis_im_tvalid Interface 0
	dict set TopLevelPortInterface s_axis_im_tvalid InterfaceName {}
	dict set TopLevelPortInterface s_axis_im_tvalid InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_im_tvalid ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface s_axis_im_tvalid Locs {}
	dict set TopLevelPortInterface s_axis_im_tvalid IOStandard {}
	dict set TopLevelPortInterface s_axis_im_tdata Name {s_axis_im_tdata}
	dict set TopLevelPortInterface s_axis_im_tdata Type Fix_128_0
	dict set TopLevelPortInterface s_axis_im_tdata ArithmeticType xlSigned
	dict set TopLevelPortInterface s_axis_im_tdata BinaryPoint 0
	dict set TopLevelPortInterface s_axis_im_tdata Width 128
	dict set TopLevelPortInterface s_axis_im_tdata DatFile {xsg_bwselector_bandwidth_selector_axi_stream_slave_interface_s_axis_im_tdata.dat}
	dict set TopLevelPortInterface s_axis_im_tdata IconText {s_axis_im_tdata}
	dict set TopLevelPortInterface s_axis_im_tdata Direction in
	dict set TopLevelPortInterface s_axis_im_tdata Period 1
	dict set TopLevelPortInterface s_axis_im_tdata Interface 0
	dict set TopLevelPortInterface s_axis_im_tdata InterfaceName {}
	dict set TopLevelPortInterface s_axis_im_tdata InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_im_tdata ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface s_axis_im_tdata Locs {}
	dict set TopLevelPortInterface s_axis_im_tdata IOStandard {}
	dict set TopLevelPortInterface m_axis_im_tdata Name {m_axis_im_tdata}
	dict set TopLevelPortInterface m_axis_im_tdata Type UFix_128_0
	dict set TopLevelPortInterface m_axis_im_tdata ArithmeticType xlUnsigned
	dict set TopLevelPortInterface m_axis_im_tdata BinaryPoint 0
	dict set TopLevelPortInterface m_axis_im_tdata Width 128
	dict set TopLevelPortInterface m_axis_im_tdata DatFile {xsg_bwselector_bandwidth_selector_axi_stream_master_interface_m_axis_im_tdata.dat}
	dict set TopLevelPortInterface m_axis_im_tdata IconText {m_axis_im_tdata}
	dict set TopLevelPortInterface m_axis_im_tdata Direction out
	dict set TopLevelPortInterface m_axis_im_tdata Period 1
	dict set TopLevelPortInterface m_axis_im_tdata Interface 0
	dict set TopLevelPortInterface m_axis_im_tdata InterfaceName {}
	dict set TopLevelPortInterface m_axis_im_tdata InterfaceString {DATA}
	dict set TopLevelPortInterface m_axis_im_tdata ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface m_axis_im_tdata Locs {}
	dict set TopLevelPortInterface m_axis_im_tdata IOStandard {}
	dict set TopLevelPortInterface m_axis_im_tvalid Name {m_axis_im_tvalid}
	dict set TopLevelPortInterface m_axis_im_tvalid Type Bool
	dict set TopLevelPortInterface m_axis_im_tvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface m_axis_im_tvalid BinaryPoint 0
	dict set TopLevelPortInterface m_axis_im_tvalid Width 1
	dict set TopLevelPortInterface m_axis_im_tvalid DatFile {xsg_bwselector_bandwidth_selector_axi_stream_master_interface_m_axis_im_tvalid.dat}
	dict set TopLevelPortInterface m_axis_im_tvalid IconText {m_axis_im_tvalid}
	dict set TopLevelPortInterface m_axis_im_tvalid Direction out
	dict set TopLevelPortInterface m_axis_im_tvalid Period 1
	dict set TopLevelPortInterface m_axis_im_tvalid Interface 0
	dict set TopLevelPortInterface m_axis_im_tvalid InterfaceName {}
	dict set TopLevelPortInterface m_axis_im_tvalid InterfaceString {DATA}
	dict set TopLevelPortInterface m_axis_im_tvalid ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface m_axis_im_tvalid Locs {}
	dict set TopLevelPortInterface m_axis_im_tvalid IOStandard {}
	dict set TopLevelPortInterface m_axis_re_tdata Name {m_axis_re_tdata}
	dict set TopLevelPortInterface m_axis_re_tdata Type UFix_128_0
	dict set TopLevelPortInterface m_axis_re_tdata ArithmeticType xlUnsigned
	dict set TopLevelPortInterface m_axis_re_tdata BinaryPoint 0
	dict set TopLevelPortInterface m_axis_re_tdata Width 128
	dict set TopLevelPortInterface m_axis_re_tdata DatFile {xsg_bwselector_bandwidth_selector_axi_stream_master_interface_m_axis_re_tdata.dat}
	dict set TopLevelPortInterface m_axis_re_tdata IconText {m_axis_re_tdata}
	dict set TopLevelPortInterface m_axis_re_tdata Direction out
	dict set TopLevelPortInterface m_axis_re_tdata Period 1
	dict set TopLevelPortInterface m_axis_re_tdata Interface 0
	dict set TopLevelPortInterface m_axis_re_tdata InterfaceName {}
	dict set TopLevelPortInterface m_axis_re_tdata InterfaceString {DATA}
	dict set TopLevelPortInterface m_axis_re_tdata ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface m_axis_re_tdata Locs {}
	dict set TopLevelPortInterface m_axis_re_tdata IOStandard {}
	dict set TopLevelPortInterface m_axis_re_tvalid Name {m_axis_re_tvalid}
	dict set TopLevelPortInterface m_axis_re_tvalid Type Bool
	dict set TopLevelPortInterface m_axis_re_tvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface m_axis_re_tvalid BinaryPoint 0
	dict set TopLevelPortInterface m_axis_re_tvalid Width 1
	dict set TopLevelPortInterface m_axis_re_tvalid DatFile {xsg_bwselector_bandwidth_selector_axi_stream_master_interface_m_axis_re_tvalid.dat}
	dict set TopLevelPortInterface m_axis_re_tvalid IconText {m_axis_re_tvalid}
	dict set TopLevelPortInterface m_axis_re_tvalid Direction out
	dict set TopLevelPortInterface m_axis_re_tvalid Period 1
	dict set TopLevelPortInterface m_axis_re_tvalid Interface 0
	dict set TopLevelPortInterface m_axis_re_tvalid InterfaceName {}
	dict set TopLevelPortInterface m_axis_re_tvalid InterfaceString {DATA}
	dict set TopLevelPortInterface m_axis_re_tvalid ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface m_axis_re_tvalid Locs {}
	dict set TopLevelPortInterface m_axis_re_tvalid IOStandard {}
	dict set TopLevelPortInterface s_axis_im_tready Name {s_axis_im_tready}
	dict set TopLevelPortInterface s_axis_im_tready Type Bool
	dict set TopLevelPortInterface s_axis_im_tready ArithmeticType xlUnsigned
	dict set TopLevelPortInterface s_axis_im_tready BinaryPoint 0
	dict set TopLevelPortInterface s_axis_im_tready Width 1
	dict set TopLevelPortInterface s_axis_im_tready DatFile {xsg_bwselector_bandwidth_selector_axi_stream_slave_interface_s_axis_im_tready.dat}
	dict set TopLevelPortInterface s_axis_im_tready IconText {s_axis_im_tready}
	dict set TopLevelPortInterface s_axis_im_tready Direction out
	dict set TopLevelPortInterface s_axis_im_tready Period 1
	dict set TopLevelPortInterface s_axis_im_tready Interface 0
	dict set TopLevelPortInterface s_axis_im_tready InterfaceName {}
	dict set TopLevelPortInterface s_axis_im_tready InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_im_tready ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface s_axis_im_tready Locs {}
	dict set TopLevelPortInterface s_axis_im_tready IOStandard {}
	dict set TopLevelPortInterface s_axis_re_tready Name {s_axis_re_tready}
	dict set TopLevelPortInterface s_axis_re_tready Type Bool
	dict set TopLevelPortInterface s_axis_re_tready ArithmeticType xlUnsigned
	dict set TopLevelPortInterface s_axis_re_tready BinaryPoint 0
	dict set TopLevelPortInterface s_axis_re_tready Width 1
	dict set TopLevelPortInterface s_axis_re_tready DatFile {xsg_bwselector_bandwidth_selector_axi_stream_slave_interface_s_axis_re_tready.dat}
	dict set TopLevelPortInterface s_axis_re_tready IconText {s_axis_re_tready}
	dict set TopLevelPortInterface s_axis_re_tready Direction out
	dict set TopLevelPortInterface s_axis_re_tready Period 1
	dict set TopLevelPortInterface s_axis_re_tready Interface 0
	dict set TopLevelPortInterface s_axis_re_tready InterfaceName {}
	dict set TopLevelPortInterface s_axis_re_tready InterfaceString {DATA}
	dict set TopLevelPortInterface s_axis_re_tready ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface s_axis_re_tready Locs {}
	dict set TopLevelPortInterface s_axis_re_tready IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_aresetn Name {xsg_bwselector_aresetn}
	dict set TopLevelPortInterface xsg_bwselector_aresetn Type -
	dict set TopLevelPortInterface xsg_bwselector_aresetn ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_aresetn BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_aresetn Width 1
	dict set TopLevelPortInterface xsg_bwselector_aresetn DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_aresetn IconText {xsg_bwselector_aresetn}
	dict set TopLevelPortInterface xsg_bwselector_aresetn Direction in
	dict set TopLevelPortInterface xsg_bwselector_aresetn Period 1
	dict set TopLevelPortInterface xsg_bwselector_aresetn Interface 8
	dict set TopLevelPortInterface xsg_bwselector_aresetn InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_aresetn InterfaceString {ARESETN}
	dict set TopLevelPortInterface xsg_bwselector_aresetn ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_aresetn Locs {}
	dict set TopLevelPortInterface xsg_bwselector_aresetn IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr Name {xsg_bwselector_s_axi_awaddr}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr IconText {xsg_bwselector_s_axi_awaddr}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr Direction in
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awaddr IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid Name {xsg_bwselector_s_axi_awvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid IconText {xsg_bwselector_s_axi_awvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid Direction in
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awvalid IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready Name {xsg_bwselector_s_axi_awready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready IconText {xsg_bwselector_s_axi_awready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready Direction out
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_awready IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata Name {xsg_bwselector_s_axi_wdata}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata Width 32
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata IconText {xsg_bwselector_s_axi_wdata}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata Direction in
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wdata IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb Name {xsg_bwselector_s_axi_wstrb}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb Width 4
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb IconText {xsg_bwselector_s_axi_wstrb}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb Direction in
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wstrb IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid Name {xsg_bwselector_s_axi_wvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid IconText {xsg_bwselector_s_axi_wvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid Direction in
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wvalid IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready Name {xsg_bwselector_s_axi_wready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready IconText {xsg_bwselector_s_axi_wready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready Direction out
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_wready IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp Name {xsg_bwselector_s_axi_bresp}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp Width 2
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp IconText {xsg_bwselector_s_axi_bresp}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp Direction out
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bresp IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid Name {xsg_bwselector_s_axi_bvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid IconText {xsg_bwselector_s_axi_bvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid Direction out
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bvalid IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready Name {xsg_bwselector_s_axi_bready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready IconText {xsg_bwselector_s_axi_bready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready Direction in
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_bready IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr Name {xsg_bwselector_s_axi_araddr}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr IconText {xsg_bwselector_s_axi_araddr}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr Direction in
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_araddr IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid Name {xsg_bwselector_s_axi_arvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid IconText {xsg_bwselector_s_axi_arvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid Direction in
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arvalid IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready Name {xsg_bwselector_s_axi_arready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready IconText {xsg_bwselector_s_axi_arready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready Direction out
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_arready IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata Name {xsg_bwselector_s_axi_rdata}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata Width 32
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata IconText {xsg_bwselector_s_axi_rdata}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata Direction out
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rdata IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp Name {xsg_bwselector_s_axi_rresp}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp Width 2
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp IconText {xsg_bwselector_s_axi_rresp}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp Direction out
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rresp IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid Name {xsg_bwselector_s_axi_rvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid IconText {xsg_bwselector_s_axi_rvalid}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid Direction out
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rvalid IOStandard {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready Name {xsg_bwselector_s_axi_rready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready Type -
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready ArithmeticType xlUnsigned
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready BinaryPoint 0
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready Width 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready DatFile {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready IconText {xsg_bwselector_s_axi_rready}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready Direction in
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready Period 1
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready Interface 5
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready InterfaceName {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready InterfaceString {WIRE_AXI_LITE}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready ClockDomain {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready Locs {}
	dict set TopLevelPortInterface xsg_bwselector_s_axi_rready IOStandard {}
	dict set TopLevelPortInterface clk Name {clk}
	dict set TopLevelPortInterface clk Type -
	dict set TopLevelPortInterface clk ArithmeticType xlUnsigned
	dict set TopLevelPortInterface clk BinaryPoint 0
	dict set TopLevelPortInterface clk Width 1
	dict set TopLevelPortInterface clk DatFile {}
	dict set TopLevelPortInterface clk Direction in
	dict set TopLevelPortInterface clk Period 1
	dict set TopLevelPortInterface clk Interface 6
	dict set TopLevelPortInterface clk InterfaceName {}
	dict set TopLevelPortInterface clk InterfaceString {CLOCK}
	dict set TopLevelPortInterface clk ClockDomain {xsg_bwselector}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {xsg_bwselector_s_axi }
	dict set TopLevelPortInterface clk AssociatedResets {xsg_bwselector_aresetn }
	set MemoryMappedPort {}
	dict set MemoryMappedPort s_axi_decimation Name {s_axi_decimation}
	dict set MemoryMappedPort s_axi_decimation Type UFix_32_0
	dict set MemoryMappedPort s_axi_decimation ArithmeticType xlUnsigned
	dict set MemoryMappedPort s_axi_decimation BinaryPoint 0
	dict set MemoryMappedPort s_axi_decimation Width 32
	dict set MemoryMappedPort s_axi_decimation DatFile {xsg_bwselector_bandwidth_selector_s_axi_decimation.dat}
	dict set MemoryMappedPort s_axi_decimation AddressOffset 0
	dict set MemoryMappedPort s_axi_decimation IconText {s_axi_decimation}
	dict set MemoryMappedPort s_axi_decimation Direction in
	dict set MemoryMappedPort s_axi_decimation Period 1
	dict set MemoryMappedPort s_axi_decimation Interface 2
	dict set MemoryMappedPort s_axi_decimation InterfaceName {}
	dict set MemoryMappedPort s_axi_decimation InterfaceString {CONTROL}
	dict set MemoryMappedPort s_axi_decimation ClockDomain {xsg_bwselector}
	dict set MemoryMappedPort s_axi_decimation Locs {}
	dict set MemoryMappedPort s_axi_decimation IOStandard {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project