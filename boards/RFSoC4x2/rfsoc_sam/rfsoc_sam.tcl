
################################################################
# This is a generated script based on design: rfsoc_sam
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source rfsoc_sam_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu48dr-ffvg1517-2-e
   set_property BOARD_PART xilinx.com:rfsoc4x2:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name rfsoc_sam

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:axi_data_fifo:2.1\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:zynq_ultra_ps_e:3.3\
xilinx.com:ip:usp_rf_data_converter:2.4\
strath.ac.uk:RFSoC:xsg_bwselector:1.1\
xilinx.com:ip:SpectrumAnalyser:1.1\
xilinx.com:ip:axis_broadcaster:1.1\
xilinx.com:ip:axis_combiner:1.1\
xilinx.com:ip:mw_transmitter:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: channel_20
proc create_hier_cell_channel_20_1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_channel_20_1() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Lite

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AXI4_Stream_Master


  # Create pins
  create_bd_pin -dir I -type clk AXI4_Lite_ACLK
  create_bd_pin -dir I -type rst AXI4_Lite_ARESETN

  # Create instance: axis_broadcaster, and set properties
  set axis_broadcaster [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster ]

  # Create instance: axis_combiner, and set properties
  set axis_combiner [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_combiner:1.1 axis_combiner ]

  # Create instance: control, and set properties
  set control [ create_bd_cell -type ip -vlnv xilinx.com:ip:mw_transmitter:1.0 control ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins AXI4_Lite] [get_bd_intf_pins control/AXI4_Lite]
  connect_bd_intf_net -intf_net axis_broadcaster_M00_AXIS [get_bd_intf_pins axis_broadcaster/M00_AXIS] [get_bd_intf_pins axis_combiner/S00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_M01_AXIS [get_bd_intf_pins axis_broadcaster/M01_AXIS] [get_bd_intf_pins axis_combiner/S01_AXIS]
  connect_bd_intf_net -intf_net axis_combiner_M_AXIS [get_bd_intf_pins AXI4_Stream_Master] [get_bd_intf_pins axis_combiner/M_AXIS]
  connect_bd_intf_net -intf_net control_AXI4_Stream_Master [get_bd_intf_pins axis_broadcaster/S_AXIS] [get_bd_intf_pins control/AXI4_Stream_Master]

  # Create port connections
  connect_bd_net -net proc_sys_reset_clk_dac0_peripheral_aresetn [get_bd_pins AXI4_Lite_ARESETN] [get_bd_pins axis_broadcaster/aresetn] [get_bd_pins axis_combiner/aresetn] [get_bd_pins control/AXI4_Lite_ARESETN] [get_bd_pins control/IPCORE_RESETN]
  connect_bd_net -net usp_rf_data_converter_clk_dac0 [get_bd_pins AXI4_Lite_ACLK] [get_bd_pins axis_broadcaster/aclk] [get_bd_pins axis_combiner/aclk] [get_bd_pins control/AXI4_Lite_ACLK] [get_bd_pins control/IPCORE_CLK]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: channel_00
proc create_hier_cell_channel_00_1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_channel_00_1() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Lite

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AXI4_Stream_Master


  # Create pins
  create_bd_pin -dir I -type clk AXI4_Lite_ACLK
  create_bd_pin -dir I -type rst AXI4_Lite_ARESETN

  # Create instance: axis_broadcaster, and set properties
  set axis_broadcaster [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster ]

  # Create instance: axis_combiner, and set properties
  set axis_combiner [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_combiner:1.1 axis_combiner ]

  # Create instance: control, and set properties
  set control [ create_bd_cell -type ip -vlnv xilinx.com:ip:mw_transmitter:1.0 control ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins AXI4_Lite] [get_bd_intf_pins control/AXI4_Lite]
  connect_bd_intf_net -intf_net axis_broadcaster_M00_AXIS [get_bd_intf_pins axis_broadcaster/M00_AXIS] [get_bd_intf_pins axis_combiner/S00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_M01_AXIS [get_bd_intf_pins axis_broadcaster/M01_AXIS] [get_bd_intf_pins axis_combiner/S01_AXIS]
  connect_bd_intf_net -intf_net axis_combiner_M_AXIS [get_bd_intf_pins AXI4_Stream_Master] [get_bd_intf_pins axis_combiner/M_AXIS]
  connect_bd_intf_net -intf_net control_AXI4_Stream_Master [get_bd_intf_pins axis_broadcaster/S_AXIS] [get_bd_intf_pins control/AXI4_Stream_Master]

  # Create port connections
  connect_bd_net -net proc_sys_reset_clk_dac0_peripheral_aresetn [get_bd_pins AXI4_Lite_ARESETN] [get_bd_pins axis_broadcaster/aresetn] [get_bd_pins axis_combiner/aresetn] [get_bd_pins control/AXI4_Lite_ARESETN] [get_bd_pins control/IPCORE_RESETN]
  connect_bd_net -net usp_rf_data_converter_clk_dac0 [get_bd_pins AXI4_Lite_ACLK] [get_bd_pins axis_broadcaster/aclk] [get_bd_pins axis_combiner/aclk] [get_bd_pins control/AXI4_Lite_ACLK] [get_bd_pins control/IPCORE_CLK]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: channel_22
proc create_hier_cell_channel_22 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_channel_22() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Lite

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Master

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 xsg_bwselector_s_axi


  # Create pins
  create_bd_pin -dir I -type rst AXI4_Lite_ARESETN
  create_bd_pin -dir I -type clk clk

  # Create instance: decimator, and set properties
  set decimator [ create_bd_cell -type ip -vlnv strath.ac.uk:RFSoC:xsg_bwselector:1.1 decimator ]

  # Create instance: spectrum_analyser, and set properties
  set spectrum_analyser [ create_bd_cell -type ip -vlnv xilinx.com:ip:SpectrumAnalyser:1.1 spectrum_analyser ]

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins AXI4_Master] [get_bd_intf_pins spectrum_analyser/AXI4_Master]
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins xsg_bwselector_s_axi] [get_bd_intf_pins decimator/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_M01_AXI [get_bd_intf_pins AXI4_Lite] [get_bd_intf_pins spectrum_analyser/AXI4_Lite]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m00_axis [get_bd_intf_pins s_axis_re] [get_bd_intf_pins decimator/s_axis_re]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m01_axis [get_bd_intf_pins s_axis_im] [get_bd_intf_pins decimator/s_axis_im]
  connect_bd_intf_net -intf_net xsg_bwselector_0_m_axis_im [get_bd_intf_pins decimator/m_axis_im] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Imag_Slave]
  connect_bd_intf_net -intf_net xsg_bwselector_0_m_axis_re [get_bd_intf_pins decimator/m_axis_re] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Real_Slave]

  # Create port connections
  connect_bd_net -net proc_sys_reset_clk_adc0_peripheral_aresetn [get_bd_pins AXI4_Lite_ARESETN] [get_bd_pins decimator/xsg_bwselector_aresetn] [get_bd_pins spectrum_analyser/AXI4_Lite_ARESETN] [get_bd_pins spectrum_analyser/IPCORE_RESETN]
  connect_bd_net -net usp_rf_data_converter_clk_adc0 [get_bd_pins clk] [get_bd_pins decimator/clk] [get_bd_pins spectrum_analyser/AXI4_Lite_ACLK] [get_bd_pins spectrum_analyser/IPCORE_CLK]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: channel_20
proc create_hier_cell_channel_20 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_channel_20() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Lite

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Master

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 xsg_bwselector_s_axi


  # Create pins
  create_bd_pin -dir I -type rst AXI4_Lite_ARESETN
  create_bd_pin -dir I -type clk clk

  # Create instance: decimator, and set properties
  set decimator [ create_bd_cell -type ip -vlnv strath.ac.uk:RFSoC:xsg_bwselector:1.1 decimator ]

  # Create instance: spectrum_analyser, and set properties
  set spectrum_analyser [ create_bd_cell -type ip -vlnv xilinx.com:ip:SpectrumAnalyser:1.1 spectrum_analyser ]

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins AXI4_Master] [get_bd_intf_pins spectrum_analyser/AXI4_Master]
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins xsg_bwselector_s_axi] [get_bd_intf_pins decimator/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_M01_AXI [get_bd_intf_pins AXI4_Lite] [get_bd_intf_pins spectrum_analyser/AXI4_Lite]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m00_axis [get_bd_intf_pins s_axis_re] [get_bd_intf_pins decimator/s_axis_re]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m01_axis [get_bd_intf_pins s_axis_im] [get_bd_intf_pins decimator/s_axis_im]
  connect_bd_intf_net -intf_net xsg_bwselector_0_m_axis_im [get_bd_intf_pins decimator/m_axis_im] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Imag_Slave]
  connect_bd_intf_net -intf_net xsg_bwselector_0_m_axis_re [get_bd_intf_pins decimator/m_axis_re] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Real_Slave]

  # Create port connections
  connect_bd_net -net proc_sys_reset_clk_adc0_peripheral_aresetn [get_bd_pins AXI4_Lite_ARESETN] [get_bd_pins decimator/xsg_bwselector_aresetn] [get_bd_pins spectrum_analyser/AXI4_Lite_ARESETN] [get_bd_pins spectrum_analyser/IPCORE_RESETN]
  connect_bd_net -net usp_rf_data_converter_clk_adc0 [get_bd_pins clk] [get_bd_pins decimator/clk] [get_bd_pins spectrum_analyser/AXI4_Lite_ACLK] [get_bd_pins spectrum_analyser/IPCORE_CLK]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: channel_02
proc create_hier_cell_channel_02 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_channel_02() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Lite

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Master

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 xsg_bwselector_s_axi


  # Create pins
  create_bd_pin -dir I -type rst AXI4_Lite_ARESETN
  create_bd_pin -dir I -type clk clk

  # Create instance: decimator, and set properties
  set decimator [ create_bd_cell -type ip -vlnv strath.ac.uk:RFSoC:xsg_bwselector:1.1 decimator ]

  # Create instance: spectrum_analyser, and set properties
  set spectrum_analyser [ create_bd_cell -type ip -vlnv xilinx.com:ip:SpectrumAnalyser:1.1 spectrum_analyser ]

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins AXI4_Master] [get_bd_intf_pins spectrum_analyser/AXI4_Master]
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins xsg_bwselector_s_axi] [get_bd_intf_pins decimator/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_M01_AXI [get_bd_intf_pins AXI4_Lite] [get_bd_intf_pins spectrum_analyser/AXI4_Lite]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m00_axis [get_bd_intf_pins s_axis_re] [get_bd_intf_pins decimator/s_axis_re]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m01_axis [get_bd_intf_pins s_axis_im] [get_bd_intf_pins decimator/s_axis_im]
  connect_bd_intf_net -intf_net xsg_bwselector_0_m_axis_im [get_bd_intf_pins decimator/m_axis_im] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Imag_Slave]
  connect_bd_intf_net -intf_net xsg_bwselector_0_m_axis_re [get_bd_intf_pins decimator/m_axis_re] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Real_Slave]

  # Create port connections
  connect_bd_net -net proc_sys_reset_clk_adc0_peripheral_aresetn [get_bd_pins AXI4_Lite_ARESETN] [get_bd_pins decimator/xsg_bwselector_aresetn] [get_bd_pins spectrum_analyser/AXI4_Lite_ARESETN] [get_bd_pins spectrum_analyser/IPCORE_RESETN]
  connect_bd_net -net usp_rf_data_converter_clk_adc0 [get_bd_pins clk] [get_bd_pins decimator/clk] [get_bd_pins spectrum_analyser/AXI4_Lite_ACLK] [get_bd_pins spectrum_analyser/IPCORE_CLK]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: channel_00
proc create_hier_cell_channel_00 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_channel_00() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Lite

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_Master

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 xsg_bwselector_s_axi


  # Create pins
  create_bd_pin -dir I -type rst AXI4_Lite_ARESETN
  create_bd_pin -dir I -type clk clk

  # Create instance: decimator, and set properties
  set decimator [ create_bd_cell -type ip -vlnv strath.ac.uk:RFSoC:xsg_bwselector:1.1 decimator ]

  # Create instance: spectrum_analyser, and set properties
  set spectrum_analyser [ create_bd_cell -type ip -vlnv xilinx.com:ip:SpectrumAnalyser:1.1 spectrum_analyser ]

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins AXI4_Master] [get_bd_intf_pins spectrum_analyser/AXI4_Master]
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins xsg_bwselector_s_axi] [get_bd_intf_pins decimator/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_M01_AXI [get_bd_intf_pins AXI4_Lite] [get_bd_intf_pins spectrum_analyser/AXI4_Lite]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m00_axis [get_bd_intf_pins s_axis_re] [get_bd_intf_pins decimator/s_axis_re]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m01_axis [get_bd_intf_pins s_axis_im] [get_bd_intf_pins decimator/s_axis_im]
  connect_bd_intf_net -intf_net xsg_bwselector_0_m_axis_im [get_bd_intf_pins decimator/m_axis_im] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Imag_Slave]
  connect_bd_intf_net -intf_net xsg_bwselector_0_m_axis_re [get_bd_intf_pins decimator/m_axis_re] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Real_Slave]

  # Create port connections
  connect_bd_net -net proc_sys_reset_clk_adc0_peripheral_aresetn [get_bd_pins AXI4_Lite_ARESETN] [get_bd_pins decimator/xsg_bwselector_aresetn] [get_bd_pins spectrum_analyser/AXI4_Lite_ARESETN] [get_bd_pins spectrum_analyser/IPCORE_RESETN]
  connect_bd_net -net usp_rf_data_converter_clk_adc0 [get_bd_pins clk] [get_bd_pins decimator/clk] [get_bd_pins spectrum_analyser/AXI4_Lite_ACLK] [get_bd_pins spectrum_analyser/IPCORE_CLK]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: transmitter
proc create_hier_cell_transmitter { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_transmitter() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AXI4_Stream_Master

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AXI4_Stream_Master1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI


  # Create pins
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir I -type clk M00_ACLK
  create_bd_pin -dir I -type rst M00_ARESETN
  create_bd_pin -dir I -type clk M01_ACLK
  create_bd_pin -dir I -type rst M01_ARESETN
  create_bd_pin -dir I -type clk S00_ACLK
  create_bd_pin -dir I -type rst S00_ARESETN

  # Create instance: axi_interconnect, and set properties
  set axi_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect ]

  # Create instance: channel_00
  create_hier_cell_channel_00_1 $hier_obj channel_00

  # Create instance: channel_20
  create_hier_cell_channel_20_1 $hier_obj channel_20

  # Create interface connections
  connect_bd_intf_net -intf_net AXI4_Lite_1 [get_bd_intf_pins axi_interconnect/M01_AXI] [get_bd_intf_pins channel_20/AXI4_Lite]
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins axi_interconnect/M00_AXI] [get_bd_intf_pins channel_00/AXI4_Lite]
  connect_bd_intf_net -intf_net axi_interconnect_hpm0_M01_AXI [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net channel_20_AXI4_Stream_Master [get_bd_intf_pins AXI4_Stream_Master] [get_bd_intf_pins channel_20/AXI4_Stream_Master]
  connect_bd_intf_net -intf_net control_AXI4_Stream_Master [get_bd_intf_pins AXI4_Stream_Master1] [get_bd_intf_pins channel_00/AXI4_Stream_Master]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ARESETN] [get_bd_pins axi_interconnect/ARESETN]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins S00_ARESETN] [get_bd_pins axi_interconnect/S00_ARESETN]
  connect_bd_net -net clk_wiz_307_2M_clk_out1 [get_bd_pins S00_ACLK] [get_bd_pins axi_interconnect/ACLK] [get_bd_pins axi_interconnect/S00_ACLK]
  connect_bd_net -net proc_sys_reset_clk_dac0_peripheral_aresetn [get_bd_pins M00_ARESETN] [get_bd_pins axi_interconnect/M00_ARESETN] [get_bd_pins channel_00/AXI4_Lite_ARESETN]
  connect_bd_net -net proc_sys_reset_clk_dac2_peripheral_aresetn [get_bd_pins M01_ARESETN] [get_bd_pins axi_interconnect/M01_ARESETN] [get_bd_pins channel_20/AXI4_Lite_ARESETN]
  connect_bd_net -net usp_rf_data_converter_clk_dac0 [get_bd_pins M00_ACLK] [get_bd_pins axi_interconnect/M00_ACLK] [get_bd_pins channel_00/AXI4_Lite_ACLK]
  connect_bd_net -net usp_rf_data_converter_clk_dac2 [get_bd_pins M01_ACLK] [get_bd_pins axi_interconnect/M01_ACLK] [get_bd_pins channel_20/AXI4_Lite_ACLK]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: receiver
proc create_hier_cell_receiver { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_receiver() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im2

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im3

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re2

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re3


  # Create pins
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir I -type clk M00_ACLK
  create_bd_pin -dir I -type clk S00_ACLK
  create_bd_pin -dir I -type rst S00_ARESETN
  create_bd_pin -dir I -type rst S00_ARESETN1
  create_bd_pin -dir I -type clk S02_ACLK
  create_bd_pin -dir I -type rst S02_ARESETN

  # Create instance: axi_interconnect, and set properties
  set axi_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {8} \
 ] $axi_interconnect

  # Create instance: axi_interconnect_sam, and set properties
  set axi_interconnect_sam [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_sam ]
  set_property -dict [ list \
   CONFIG.M00_HAS_DATA_FIFO {2} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {4} \
   CONFIG.S00_HAS_DATA_FIFO {2} \
   CONFIG.S01_HAS_DATA_FIFO {2} \
   CONFIG.S02_HAS_DATA_FIFO {2} \
   CONFIG.S03_HAS_DATA_FIFO {2} \
   CONFIG.STRATEGY {2} \
 ] $axi_interconnect_sam

  # Create instance: channel_00
  create_hier_cell_channel_00 $hier_obj channel_00

  # Create instance: channel_02
  create_hier_cell_channel_02 $hier_obj channel_02

  # Create instance: channel_20
  create_hier_cell_channel_20 $hier_obj channel_20

  # Create instance: channel_22
  create_hier_cell_channel_22 $hier_obj channel_22

  # Create interface connections
  connect_bd_intf_net -intf_net AXI4_Lite_1 [get_bd_intf_pins axi_interconnect/M02_AXI] [get_bd_intf_pins channel_02/AXI4_Lite]
  connect_bd_intf_net -intf_net AXI4_Lite_2 [get_bd_intf_pins axi_interconnect/M04_AXI] [get_bd_intf_pins channel_20/AXI4_Lite]
  connect_bd_intf_net -intf_net AXI4_Lite_3 [get_bd_intf_pins axi_interconnect/M06_AXI] [get_bd_intf_pins channel_22/AXI4_Lite]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins axi_interconnect_sam/S00_AXI] [get_bd_intf_pins channel_00/AXI4_Master]
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins axi_interconnect/M00_AXI] [get_bd_intf_pins channel_00/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_M01_AXI [get_bd_intf_pins axi_interconnect/M01_AXI] [get_bd_intf_pins channel_00/AXI4_Lite]
  connect_bd_intf_net -intf_net axi_interconnect_hpm0_M03_AXI [get_bd_intf_pins axi_interconnect/M03_AXI] [get_bd_intf_pins channel_02/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_hpm0_M05_AXI [get_bd_intf_pins axi_interconnect/M05_AXI] [get_bd_intf_pins channel_20/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_hpm0_M07_AXI [get_bd_intf_pins axi_interconnect/M07_AXI] [get_bd_intf_pins channel_22/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_sam_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_interconnect_sam/M00_AXI]
  connect_bd_intf_net -intf_net channel_02_AXI4_Master [get_bd_intf_pins axi_interconnect_sam/S01_AXI] [get_bd_intf_pins channel_02/AXI4_Master]
  connect_bd_intf_net -intf_net channel_20_AXI4_Master [get_bd_intf_pins axi_interconnect_sam/S02_AXI] [get_bd_intf_pins channel_20/AXI4_Master]
  connect_bd_intf_net -intf_net channel_22_AXI4_Master [get_bd_intf_pins axi_interconnect_sam/S03_AXI] [get_bd_intf_pins channel_22/AXI4_Master]
  connect_bd_intf_net -intf_net s_axis_im_1 [get_bd_intf_pins s_axis_im] [get_bd_intf_pins channel_02/s_axis_im]
  connect_bd_intf_net -intf_net s_axis_im_2 [get_bd_intf_pins s_axis_im1] [get_bd_intf_pins channel_20/s_axis_im]
  connect_bd_intf_net -intf_net s_axis_im_3 [get_bd_intf_pins s_axis_im2] [get_bd_intf_pins channel_22/s_axis_im]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m00_axis [get_bd_intf_pins s_axis_re3] [get_bd_intf_pins channel_00/s_axis_re]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m01_axis [get_bd_intf_pins s_axis_im3] [get_bd_intf_pins channel_00/s_axis_im]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m02_axis [get_bd_intf_pins s_axis_re] [get_bd_intf_pins channel_02/s_axis_re]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m20_axis [get_bd_intf_pins s_axis_re1] [get_bd_intf_pins channel_20/s_axis_re]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m22_axis [get_bd_intf_pins s_axis_re2] [get_bd_intf_pins channel_22/s_axis_re]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_M_AXI_HPM0_FPD [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_interconnect/S00_AXI]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ARESETN] [get_bd_pins axi_interconnect/ARESETN] [get_bd_pins axi_interconnect_sam/ARESETN]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins S00_ARESETN1] [get_bd_pins axi_interconnect/S00_ARESETN] [get_bd_pins axi_interconnect_sam/M00_ARESETN]
  connect_bd_net -net clk_wiz_307_2M_clk_out1 [get_bd_pins M00_ACLK] [get_bd_pins axi_interconnect/ACLK] [get_bd_pins axi_interconnect/S00_ACLK] [get_bd_pins axi_interconnect_sam/ACLK] [get_bd_pins axi_interconnect_sam/M00_ACLK]
  connect_bd_net -net proc_sys_reset_clk_adc0_peripheral_aresetn [get_bd_pins S00_ARESETN] [get_bd_pins axi_interconnect/M00_ARESETN] [get_bd_pins axi_interconnect/M01_ARESETN] [get_bd_pins axi_interconnect/M02_ARESETN] [get_bd_pins axi_interconnect/M03_ARESETN] [get_bd_pins axi_interconnect_sam/S00_ARESETN] [get_bd_pins axi_interconnect_sam/S01_ARESETN] [get_bd_pins channel_00/AXI4_Lite_ARESETN] [get_bd_pins channel_02/AXI4_Lite_ARESETN]
  connect_bd_net -net proc_sys_reset_clk_adc2_peripheral_aresetn [get_bd_pins S02_ARESETN] [get_bd_pins axi_interconnect/M04_ARESETN] [get_bd_pins axi_interconnect/M05_ARESETN] [get_bd_pins axi_interconnect/M06_ARESETN] [get_bd_pins axi_interconnect/M07_ARESETN] [get_bd_pins axi_interconnect_sam/S02_ARESETN] [get_bd_pins axi_interconnect_sam/S03_ARESETN] [get_bd_pins channel_20/AXI4_Lite_ARESETN] [get_bd_pins channel_22/AXI4_Lite_ARESETN]
  connect_bd_net -net usp_rf_data_converter_clk_adc0 [get_bd_pins S00_ACLK] [get_bd_pins axi_interconnect/M00_ACLK] [get_bd_pins axi_interconnect/M01_ACLK] [get_bd_pins axi_interconnect/M02_ACLK] [get_bd_pins axi_interconnect/M03_ACLK] [get_bd_pins axi_interconnect_sam/S00_ACLK] [get_bd_pins axi_interconnect_sam/S01_ACLK] [get_bd_pins channel_00/clk] [get_bd_pins channel_02/clk]
  connect_bd_net -net usp_rf_data_converter_clk_adc2 [get_bd_pins S02_ACLK] [get_bd_pins axi_interconnect/M04_ACLK] [get_bd_pins axi_interconnect/M05_ACLK] [get_bd_pins axi_interconnect/M06_ACLK] [get_bd_pins axi_interconnect/M07_ACLK] [get_bd_pins axi_interconnect_sam/S02_ACLK] [get_bd_pins axi_interconnect_sam/S03_ACLK] [get_bd_pins channel_20/clk] [get_bd_pins channel_22/clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: radio
proc create_hier_cell_radio { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_radio() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc0_clk

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc2_clk

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac0_clk

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac2_clk

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:display_usp_rf_data_converter:diff_pins_rtl:1.0 sysref_in

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin0_01

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin0_23

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin2_01

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin2_23

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout00

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout20


  # Create pins
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir I -type clk M00_ACLK
  create_bd_pin -dir I -type rst S00_ARESETN1
  create_bd_pin -dir I -type rst ext_reset_in
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: axi_interconnect_hpm0, and set properties
  set axi_interconnect_hpm0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_hpm0 ]

  # Create instance: proc_sys_reset_clk_adc0, and set properties
  set proc_sys_reset_clk_adc0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_clk_adc0 ]

  # Create instance: proc_sys_reset_clk_adc2, and set properties
  set proc_sys_reset_clk_adc2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_clk_adc2 ]

  # Create instance: proc_sys_reset_clk_dac0, and set properties
  set proc_sys_reset_clk_dac0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_clk_dac0 ]

  # Create instance: proc_sys_reset_clk_dac2, and set properties
  set proc_sys_reset_clk_dac2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_clk_dac2 ]

  # Create instance: receiver
  create_hier_cell_receiver $hier_obj receiver

  # Create instance: rfdc, and set properties
  set rfdc [ create_bd_cell -type ip -vlnv xilinx.com:ip:usp_rf_data_converter:2.4 rfdc ]
  set_property -dict [ list \
   CONFIG.ADC0_Fabric_Freq {307.200} \
   CONFIG.ADC0_Outclk_Freq {307.200} \
   CONFIG.ADC0_PLL_Enable {true} \
   CONFIG.ADC0_Refclk_Freq {491.520} \
   CONFIG.ADC0_Sampling_Rate {4.9152} \
   CONFIG.ADC2_Enable {1} \
   CONFIG.ADC2_Fabric_Freq {307.200} \
   CONFIG.ADC2_Outclk_Freq {307.200} \
   CONFIG.ADC2_PLL_Enable {true} \
   CONFIG.ADC2_Refclk_Freq {491.520} \
   CONFIG.ADC2_Sampling_Rate {4.9152} \
   CONFIG.ADC_Coarse_Mixer_Freq00 {0} \
   CONFIG.ADC_Coarse_Mixer_Freq01 {0} \
   CONFIG.ADC_Coarse_Mixer_Freq02 {0} \
   CONFIG.ADC_Coarse_Mixer_Freq03 {0} \
   CONFIG.ADC_Coarse_Mixer_Freq20 {0} \
   CONFIG.ADC_Coarse_Mixer_Freq21 {0} \
   CONFIG.ADC_Coarse_Mixer_Freq22 {0} \
   CONFIG.ADC_Coarse_Mixer_Freq23 {0} \
   CONFIG.ADC_Data_Type00 {1} \
   CONFIG.ADC_Data_Type01 {1} \
   CONFIG.ADC_Data_Type02 {1} \
   CONFIG.ADC_Data_Type03 {1} \
   CONFIG.ADC_Data_Type20 {1} \
   CONFIG.ADC_Data_Type21 {1} \
   CONFIG.ADC_Data_Type22 {1} \
   CONFIG.ADC_Data_Type23 {1} \
   CONFIG.ADC_Data_Width00 {8} \
   CONFIG.ADC_Data_Width01 {8} \
   CONFIG.ADC_Data_Width02 {8} \
   CONFIG.ADC_Data_Width03 {8} \
   CONFIG.ADC_Data_Width20 {8} \
   CONFIG.ADC_Data_Width21 {8} \
   CONFIG.ADC_Data_Width22 {8} \
   CONFIG.ADC_Data_Width23 {8} \
   CONFIG.ADC_Decimation_Mode00 {2} \
   CONFIG.ADC_Decimation_Mode01 {2} \
   CONFIG.ADC_Decimation_Mode02 {2} \
   CONFIG.ADC_Decimation_Mode03 {2} \
   CONFIG.ADC_Decimation_Mode20 {2} \
   CONFIG.ADC_Decimation_Mode21 {2} \
   CONFIG.ADC_Decimation_Mode22 {2} \
   CONFIG.ADC_Decimation_Mode23 {2} \
   CONFIG.ADC_Mixer_Mode00 {0} \
   CONFIG.ADC_Mixer_Mode01 {0} \
   CONFIG.ADC_Mixer_Mode02 {0} \
   CONFIG.ADC_Mixer_Mode03 {0} \
   CONFIG.ADC_Mixer_Mode20 {0} \
   CONFIG.ADC_Mixer_Mode21 {0} \
   CONFIG.ADC_Mixer_Mode22 {0} \
   CONFIG.ADC_Mixer_Mode23 {0} \
   CONFIG.ADC_Mixer_Type00 {2} \
   CONFIG.ADC_Mixer_Type01 {2} \
   CONFIG.ADC_Mixer_Type02 {2} \
   CONFIG.ADC_Mixer_Type03 {2} \
   CONFIG.ADC_Mixer_Type20 {2} \
   CONFIG.ADC_Mixer_Type21 {2} \
   CONFIG.ADC_Mixer_Type22 {2} \
   CONFIG.ADC_Mixer_Type23 {2} \
   CONFIG.ADC_OBS22 {false} \
   CONFIG.ADC_RESERVED_1_00 {false} \
   CONFIG.ADC_RESERVED_1_02 {false} \
   CONFIG.ADC_RESERVED_1_20 {false} \
   CONFIG.ADC_RESERVED_1_22 {false} \
   CONFIG.ADC_Slice02_Enable {true} \
   CONFIG.ADC_Slice03_Enable {true} \
   CONFIG.ADC_Slice20_Enable {true} \
   CONFIG.ADC_Slice21_Enable {true} \
   CONFIG.ADC_Slice22_Enable {true} \
   CONFIG.ADC_Slice23_Enable {true} \
   CONFIG.DAC0_Enable {1} \
   CONFIG.DAC0_Fabric_Freq {307.200} \
   CONFIG.DAC0_Outclk_Freq {307.200} \
   CONFIG.DAC0_PLL_Enable {true} \
   CONFIG.DAC0_Refclk_Freq {491.520} \
   CONFIG.DAC0_Sampling_Rate {4.9152} \
   CONFIG.DAC2_Enable {1} \
   CONFIG.DAC2_Fabric_Freq {307.200} \
   CONFIG.DAC2_Outclk_Freq {307.200} \
   CONFIG.DAC2_PLL_Enable {true} \
   CONFIG.DAC2_Refclk_Freq {491.520} \
   CONFIG.DAC2_Sampling_Rate {4.9152} \
   CONFIG.DAC_Coarse_Mixer_Freq00 {3} \
   CONFIG.DAC_Coarse_Mixer_Freq20 {3} \
   CONFIG.DAC_Data_Type20 {0} \
   CONFIG.DAC_Data_Width20 {16} \
   CONFIG.DAC_Interpolation_Mode00 {2} \
   CONFIG.DAC_Interpolation_Mode20 {2} \
   CONFIG.DAC_Mixer_Mode00 {0} \
   CONFIG.DAC_Mixer_Mode20 {0} \
   CONFIG.DAC_Mixer_Type00 {2} \
   CONFIG.DAC_Mixer_Type20 {2} \
   CONFIG.DAC_RESERVED_1_00 {false} \
   CONFIG.DAC_RESERVED_1_01 {false} \
   CONFIG.DAC_RESERVED_1_02 {false} \
   CONFIG.DAC_RESERVED_1_03 {false} \
   CONFIG.DAC_RESERVED_1_20 {false} \
   CONFIG.DAC_RESERVED_1_21 {false} \
   CONFIG.DAC_RESERVED_1_22 {false} \
   CONFIG.DAC_RESERVED_1_23 {false} \
   CONFIG.DAC_Slice00_Enable {true} \
   CONFIG.DAC_Slice20_Enable {true} \
 ] $rfdc

  # Create instance: transmitter
  create_hier_cell_transmitter $hier_obj transmitter

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_interconnect_hpm0/S00_AXI]
  connect_bd_intf_net -intf_net adc0_clk_1 [get_bd_intf_pins adc0_clk] [get_bd_intf_pins rfdc/adc0_clk]
  connect_bd_intf_net -intf_net adc2_clk_1 [get_bd_intf_pins adc2_clk] [get_bd_intf_pins rfdc/adc2_clk]
  connect_bd_intf_net -intf_net axi_interconnect_hpm0_M00_AXI [get_bd_intf_pins axi_interconnect_hpm0/M00_AXI] [get_bd_intf_pins receiver/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_hpm0_M01_AXI [get_bd_intf_pins axi_interconnect_hpm0/M01_AXI] [get_bd_intf_pins transmitter/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_sam_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins receiver/M00_AXI]
  connect_bd_intf_net -intf_net channel_20_AXI4_Stream_Master [get_bd_intf_pins rfdc/s20_axis] [get_bd_intf_pins transmitter/AXI4_Stream_Master]
  connect_bd_intf_net -intf_net control_AXI4_Stream_Master [get_bd_intf_pins rfdc/s00_axis] [get_bd_intf_pins transmitter/AXI4_Stream_Master1]
  connect_bd_intf_net -intf_net dac0_clk_1 [get_bd_intf_pins dac0_clk] [get_bd_intf_pins rfdc/dac0_clk]
  connect_bd_intf_net -intf_net dac2_clk_1 [get_bd_intf_pins dac2_clk] [get_bd_intf_pins rfdc/dac2_clk]
  connect_bd_intf_net -intf_net ps8_axi_periph_M00_AXI [get_bd_intf_pins s_axi] [get_bd_intf_pins rfdc/s_axi]
  connect_bd_intf_net -intf_net s_axis_im_1 [get_bd_intf_pins receiver/s_axis_im] [get_bd_intf_pins rfdc/m03_axis]
  connect_bd_intf_net -intf_net s_axis_im_2 [get_bd_intf_pins receiver/s_axis_im1] [get_bd_intf_pins rfdc/m21_axis]
  connect_bd_intf_net -intf_net s_axis_im_3 [get_bd_intf_pins receiver/s_axis_im2] [get_bd_intf_pins rfdc/m23_axis]
  connect_bd_intf_net -intf_net sysref_in_1 [get_bd_intf_pins sysref_in] [get_bd_intf_pins rfdc/sysref_in]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m00_axis [get_bd_intf_pins receiver/s_axis_re3] [get_bd_intf_pins rfdc/m00_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m01_axis [get_bd_intf_pins receiver/s_axis_im3] [get_bd_intf_pins rfdc/m01_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m02_axis [get_bd_intf_pins receiver/s_axis_re] [get_bd_intf_pins rfdc/m02_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m20_axis [get_bd_intf_pins receiver/s_axis_re1] [get_bd_intf_pins rfdc/m20_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m22_axis [get_bd_intf_pins receiver/s_axis_re2] [get_bd_intf_pins rfdc/m22_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_vout00 [get_bd_intf_pins vout00] [get_bd_intf_pins rfdc/vout00]
  connect_bd_intf_net -intf_net usp_rf_data_converter_vout20 [get_bd_intf_pins vout20] [get_bd_intf_pins rfdc/vout20]
  connect_bd_intf_net -intf_net vin0_01_1 [get_bd_intf_pins vin0_01] [get_bd_intf_pins rfdc/vin0_01]
  connect_bd_intf_net -intf_net vin0_23_1 [get_bd_intf_pins vin0_23] [get_bd_intf_pins rfdc/vin0_23]
  connect_bd_intf_net -intf_net vin2_01_1 [get_bd_intf_pins vin2_01] [get_bd_intf_pins rfdc/vin2_01]
  connect_bd_intf_net -intf_net vin2_23_1 [get_bd_intf_pins vin2_23] [get_bd_intf_pins rfdc/vin2_23]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ARESETN] [get_bd_pins axi_interconnect_hpm0/ARESETN] [get_bd_pins receiver/ARESETN] [get_bd_pins transmitter/ARESETN]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins S00_ARESETN1] [get_bd_pins axi_interconnect_hpm0/M00_ARESETN] [get_bd_pins axi_interconnect_hpm0/M01_ARESETN] [get_bd_pins axi_interconnect_hpm0/S00_ARESETN] [get_bd_pins receiver/S00_ARESETN1] [get_bd_pins transmitter/S00_ARESETN]
  connect_bd_net -net clk_wiz_307_2M_clk_out1 [get_bd_pins M00_ACLK] [get_bd_pins axi_interconnect_hpm0/ACLK] [get_bd_pins axi_interconnect_hpm0/M00_ACLK] [get_bd_pins axi_interconnect_hpm0/M01_ACLK] [get_bd_pins axi_interconnect_hpm0/S00_ACLK] [get_bd_pins receiver/M00_ACLK] [get_bd_pins transmitter/S00_ACLK]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins rfdc/s_axi_aresetn]
  connect_bd_net -net proc_sys_reset_clk_adc0_peripheral_aresetn [get_bd_pins proc_sys_reset_clk_adc0/peripheral_aresetn] [get_bd_pins receiver/S00_ARESETN] [get_bd_pins rfdc/m0_axis_aresetn]
  connect_bd_net -net proc_sys_reset_clk_adc2_peripheral_aresetn [get_bd_pins proc_sys_reset_clk_adc2/peripheral_aresetn] [get_bd_pins receiver/S02_ARESETN] [get_bd_pins rfdc/m2_axis_aresetn]
  connect_bd_net -net proc_sys_reset_clk_dac0_peripheral_aresetn [get_bd_pins proc_sys_reset_clk_dac0/peripheral_aresetn] [get_bd_pins rfdc/s0_axis_aresetn] [get_bd_pins transmitter/M00_ARESETN]
  connect_bd_net -net proc_sys_reset_clk_dac2_peripheral_aresetn [get_bd_pins proc_sys_reset_clk_dac2/peripheral_aresetn] [get_bd_pins rfdc/s2_axis_aresetn] [get_bd_pins transmitter/M01_ARESETN]
  connect_bd_net -net usp_rf_data_converter_clk_adc0 [get_bd_pins proc_sys_reset_clk_adc0/slowest_sync_clk] [get_bd_pins receiver/S00_ACLK] [get_bd_pins rfdc/clk_adc0] [get_bd_pins rfdc/m0_axis_aclk]
  connect_bd_net -net usp_rf_data_converter_clk_adc2 [get_bd_pins proc_sys_reset_clk_adc2/slowest_sync_clk] [get_bd_pins receiver/S02_ACLK] [get_bd_pins rfdc/clk_adc2] [get_bd_pins rfdc/m2_axis_aclk]
  connect_bd_net -net usp_rf_data_converter_clk_dac0 [get_bd_pins proc_sys_reset_clk_dac0/slowest_sync_clk] [get_bd_pins rfdc/clk_dac0] [get_bd_pins rfdc/s0_axis_aclk] [get_bd_pins transmitter/M00_ACLK]
  connect_bd_net -net usp_rf_data_converter_clk_dac2 [get_bd_pins proc_sys_reset_clk_dac2/slowest_sync_clk] [get_bd_pins rfdc/clk_dac2] [get_bd_pins rfdc/s2_axis_aclk] [get_bd_pins transmitter/M01_ACLK]
  connect_bd_net -net zynq_ultra_ps_e_pl_clk0 [get_bd_pins s_axi_aclk] [get_bd_pins rfdc/s_axi_aclk]
  connect_bd_net -net zynq_ultra_ps_e_pl_resetn0 [get_bd_pins ext_reset_in] [get_bd_pins proc_sys_reset_clk_adc0/ext_reset_in] [get_bd_pins proc_sys_reset_clk_adc2/ext_reset_in] [get_bd_pins proc_sys_reset_clk_dac0/ext_reset_in] [get_bd_pins proc_sys_reset_clk_dac2/ext_reset_in]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set adc0_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc0_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {491520000.0} \
   ] $adc0_clk

  set adc2_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc2_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {491520000.0} \
   ] $adc2_clk

  set dac0_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac0_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {491520000.0} \
   ] $dac0_clk

  set dac2_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac2_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {491520000.0} \
   ] $dac2_clk

  set sys_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $sys_clk

  set sysref_in [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_usp_rf_data_converter:diff_pins_rtl:1.0 sysref_in ]

  set vin0_01 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin0_01 ]

  set vin0_23 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin0_23 ]

  set vin2_01 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin2_01 ]

  set vin2_23 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin2_23 ]

  set vout00 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout00 ]

  set vout20 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout20 ]


  # Create ports

  # Create instance: axi_data_fifo, and set properties
  set axi_data_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_data_fifo:2.1 axi_data_fifo ]
  set_property -dict [ list \
   CONFIG.READ_FIFO_DEPTH {0} \
   CONFIG.WRITE_FIFO_DEPTH {512} \
 ] $axi_data_fifo

  # Create instance: axi_data_fifo1, and set properties
  set axi_data_fifo1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_data_fifo:2.1 axi_data_fifo1 ]
  set_property -dict [ list \
   CONFIG.READ_FIFO_DEPTH {0} \
   CONFIG.WRITE_FIFO_DEPTH {512} \
 ] $axi_data_fifo1

  # Create instance: clk_wiz_307_2M, and set properties
  set clk_wiz_307_2M [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_307_2M ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {50.0} \
   CONFIG.CLKOUT1_JITTER {145.255} \
   CONFIG.CLKOUT1_PHASE_ERROR {196.976} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {307.2} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {24.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {5.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {3.125} \
   CONFIG.MMCM_DIVCLK_DIVIDE {5} \
   CONFIG.PRIM_IN_FREQ {200} \
   CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
   CONFIG.USE_RESET {false} \
 ] $clk_wiz_307_2M

  # Create instance: proc_sys_reset_100M, and set properties
  set proc_sys_reset_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_100M ]

  # Create instance: proc_sys_reset_307_2M, and set properties
  set proc_sys_reset_307_2M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_307_2M ]

  # Create instance: ps8_axi_periph, and set properties
  set ps8_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps8_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $ps8_axi_periph

  # Create instance: radio
  create_hier_cell_radio [current_bd_instance .] radio

  # Create instance: zynq_ultra_ps_e, and set properties
  set zynq_ultra_ps_e [ create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_ultra_ps_e ]
  set_property -dict [ list \
   CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS33} \
   CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_BANK_3_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_DDR_RAM_HIGHADDR {0x1FFFFFFFF} \
   CONFIG.PSU_DDR_RAM_HIGHADDR_OFFSET {0x800000000} \
   CONFIG.PSU_DDR_RAM_LOWADDR_OFFSET {0x80000000} \
   CONFIG.PSU_DYNAMIC_DDR_CONFIG_EN {0} \
   CONFIG.PSU_MIO_0_DIRECTION {inout} \
   CONFIG.PSU_MIO_0_POLARITY {Default} \
   CONFIG.PSU_MIO_10_DIRECTION {inout} \
   CONFIG.PSU_MIO_10_POLARITY {Default} \
   CONFIG.PSU_MIO_11_DIRECTION {inout} \
   CONFIG.PSU_MIO_11_POLARITY {Default} \
   CONFIG.PSU_MIO_12_DIRECTION {inout} \
   CONFIG.PSU_MIO_12_POLARITY {Default} \
   CONFIG.PSU_MIO_13_DIRECTION {inout} \
   CONFIG.PSU_MIO_13_POLARITY {Default} \
   CONFIG.PSU_MIO_14_DIRECTION {inout} \
   CONFIG.PSU_MIO_14_POLARITY {Default} \
   CONFIG.PSU_MIO_15_DIRECTION {inout} \
   CONFIG.PSU_MIO_15_POLARITY {Default} \
   CONFIG.PSU_MIO_16_DIRECTION {inout} \
   CONFIG.PSU_MIO_16_POLARITY {Default} \
   CONFIG.PSU_MIO_17_DIRECTION {inout} \
   CONFIG.PSU_MIO_17_POLARITY {Default} \
   CONFIG.PSU_MIO_18_DIRECTION {inout} \
   CONFIG.PSU_MIO_18_POLARITY {Default} \
   CONFIG.PSU_MIO_19_DIRECTION {inout} \
   CONFIG.PSU_MIO_19_POLARITY {Default} \
   CONFIG.PSU_MIO_1_DIRECTION {out} \
   CONFIG.PSU_MIO_1_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_1_POLARITY {Default} \
   CONFIG.PSU_MIO_20_DIRECTION {inout} \
   CONFIG.PSU_MIO_20_POLARITY {Default} \
   CONFIG.PSU_MIO_21_DIRECTION {inout} \
   CONFIG.PSU_MIO_21_POLARITY {Default} \
   CONFIG.PSU_MIO_22_DIRECTION {out} \
   CONFIG.PSU_MIO_22_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_22_POLARITY {Default} \
   CONFIG.PSU_MIO_23_DIRECTION {inout} \
   CONFIG.PSU_MIO_23_POLARITY {Default} \
   CONFIG.PSU_MIO_24_DIRECTION {in} \
   CONFIG.PSU_MIO_24_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_24_POLARITY {Default} \
   CONFIG.PSU_MIO_24_SLEW {fast} \
   CONFIG.PSU_MIO_25_DIRECTION {in} \
   CONFIG.PSU_MIO_25_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_25_POLARITY {Default} \
   CONFIG.PSU_MIO_25_SLEW {fast} \
   CONFIG.PSU_MIO_26_DIRECTION {inout} \
   CONFIG.PSU_MIO_26_POLARITY {Default} \
   CONFIG.PSU_MIO_27_DIRECTION {out} \
   CONFIG.PSU_MIO_27_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_27_POLARITY {Default} \
   CONFIG.PSU_MIO_28_DIRECTION {in} \
   CONFIG.PSU_MIO_28_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_28_POLARITY {Default} \
   CONFIG.PSU_MIO_28_SLEW {fast} \
   CONFIG.PSU_MIO_29_DIRECTION {out} \
   CONFIG.PSU_MIO_29_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_29_POLARITY {Default} \
   CONFIG.PSU_MIO_2_DIRECTION {out} \
   CONFIG.PSU_MIO_2_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_2_POLARITY {Default} \
   CONFIG.PSU_MIO_30_DIRECTION {in} \
   CONFIG.PSU_MIO_30_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_30_POLARITY {Default} \
   CONFIG.PSU_MIO_30_SLEW {fast} \
   CONFIG.PSU_MIO_31_DIRECTION {inout} \
   CONFIG.PSU_MIO_31_POLARITY {Default} \
   CONFIG.PSU_MIO_32_DIRECTION {out} \
   CONFIG.PSU_MIO_32_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_32_POLARITY {Default} \
   CONFIG.PSU_MIO_33_DIRECTION {in} \
   CONFIG.PSU_MIO_33_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_33_POLARITY {Default} \
   CONFIG.PSU_MIO_33_SLEW {fast} \
   CONFIG.PSU_MIO_34_DIRECTION {inout} \
   CONFIG.PSU_MIO_34_POLARITY {Default} \
   CONFIG.PSU_MIO_35_DIRECTION {inout} \
   CONFIG.PSU_MIO_35_POLARITY {Default} \
   CONFIG.PSU_MIO_36_DIRECTION {inout} \
   CONFIG.PSU_MIO_36_POLARITY {Default} \
   CONFIG.PSU_MIO_37_DIRECTION {inout} \
   CONFIG.PSU_MIO_37_POLARITY {Default} \
   CONFIG.PSU_MIO_38_DIRECTION {out} \
   CONFIG.PSU_MIO_38_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_38_POLARITY {Default} \
   CONFIG.PSU_MIO_39_DIRECTION {out} \
   CONFIG.PSU_MIO_39_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_39_POLARITY {Default} \
   CONFIG.PSU_MIO_3_DIRECTION {inout} \
   CONFIG.PSU_MIO_3_POLARITY {Default} \
   CONFIG.PSU_MIO_40_DIRECTION {out} \
   CONFIG.PSU_MIO_40_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_40_POLARITY {Default} \
   CONFIG.PSU_MIO_41_DIRECTION {out} \
   CONFIG.PSU_MIO_41_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_41_POLARITY {Default} \
   CONFIG.PSU_MIO_42_DIRECTION {out} \
   CONFIG.PSU_MIO_42_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_42_POLARITY {Default} \
   CONFIG.PSU_MIO_43_DIRECTION {out} \
   CONFIG.PSU_MIO_43_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_43_POLARITY {Default} \
   CONFIG.PSU_MIO_44_DIRECTION {in} \
   CONFIG.PSU_MIO_44_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_44_POLARITY {Default} \
   CONFIG.PSU_MIO_44_SLEW {fast} \
   CONFIG.PSU_MIO_45_DIRECTION {in} \
   CONFIG.PSU_MIO_45_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_45_POLARITY {Default} \
   CONFIG.PSU_MIO_45_SLEW {fast} \
   CONFIG.PSU_MIO_46_DIRECTION {in} \
   CONFIG.PSU_MIO_46_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_46_POLARITY {Default} \
   CONFIG.PSU_MIO_46_SLEW {fast} \
   CONFIG.PSU_MIO_47_DIRECTION {in} \
   CONFIG.PSU_MIO_47_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_47_POLARITY {Default} \
   CONFIG.PSU_MIO_47_SLEW {fast} \
   CONFIG.PSU_MIO_48_DIRECTION {in} \
   CONFIG.PSU_MIO_48_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_48_POLARITY {Default} \
   CONFIG.PSU_MIO_48_SLEW {fast} \
   CONFIG.PSU_MIO_49_DIRECTION {in} \
   CONFIG.PSU_MIO_49_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_49_POLARITY {Default} \
   CONFIG.PSU_MIO_49_SLEW {fast} \
   CONFIG.PSU_MIO_4_DIRECTION {inout} \
   CONFIG.PSU_MIO_4_POLARITY {Default} \
   CONFIG.PSU_MIO_50_DIRECTION {out} \
   CONFIG.PSU_MIO_50_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_50_POLARITY {Default} \
   CONFIG.PSU_MIO_51_DIRECTION {inout} \
   CONFIG.PSU_MIO_51_POLARITY {Default} \
   CONFIG.PSU_MIO_52_DIRECTION {in} \
   CONFIG.PSU_MIO_52_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_52_POLARITY {Default} \
   CONFIG.PSU_MIO_52_SLEW {fast} \
   CONFIG.PSU_MIO_53_DIRECTION {in} \
   CONFIG.PSU_MIO_53_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_53_POLARITY {Default} \
   CONFIG.PSU_MIO_53_SLEW {fast} \
   CONFIG.PSU_MIO_54_DIRECTION {inout} \
   CONFIG.PSU_MIO_54_POLARITY {Default} \
   CONFIG.PSU_MIO_55_DIRECTION {in} \
   CONFIG.PSU_MIO_55_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_55_POLARITY {Default} \
   CONFIG.PSU_MIO_55_SLEW {fast} \
   CONFIG.PSU_MIO_56_DIRECTION {inout} \
   CONFIG.PSU_MIO_56_POLARITY {Default} \
   CONFIG.PSU_MIO_57_DIRECTION {inout} \
   CONFIG.PSU_MIO_57_POLARITY {Default} \
   CONFIG.PSU_MIO_58_DIRECTION {out} \
   CONFIG.PSU_MIO_58_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_58_POLARITY {Default} \
   CONFIG.PSU_MIO_59_DIRECTION {inout} \
   CONFIG.PSU_MIO_59_POLARITY {Default} \
   CONFIG.PSU_MIO_5_DIRECTION {inout} \
   CONFIG.PSU_MIO_5_POLARITY {Default} \
   CONFIG.PSU_MIO_60_DIRECTION {inout} \
   CONFIG.PSU_MIO_60_POLARITY {Default} \
   CONFIG.PSU_MIO_61_DIRECTION {inout} \
   CONFIG.PSU_MIO_61_POLARITY {Default} \
   CONFIG.PSU_MIO_62_DIRECTION {inout} \
   CONFIG.PSU_MIO_62_POLARITY {Default} \
   CONFIG.PSU_MIO_63_DIRECTION {inout} \
   CONFIG.PSU_MIO_63_POLARITY {Default} \
   CONFIG.PSU_MIO_64_DIRECTION {in} \
   CONFIG.PSU_MIO_64_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_64_POLARITY {Default} \
   CONFIG.PSU_MIO_64_SLEW {fast} \
   CONFIG.PSU_MIO_65_DIRECTION {in} \
   CONFIG.PSU_MIO_65_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_65_POLARITY {Default} \
   CONFIG.PSU_MIO_65_SLEW {fast} \
   CONFIG.PSU_MIO_66_DIRECTION {inout} \
   CONFIG.PSU_MIO_66_POLARITY {Default} \
   CONFIG.PSU_MIO_67_DIRECTION {in} \
   CONFIG.PSU_MIO_67_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_67_POLARITY {Default} \
   CONFIG.PSU_MIO_67_SLEW {fast} \
   CONFIG.PSU_MIO_68_DIRECTION {inout} \
   CONFIG.PSU_MIO_68_POLARITY {Default} \
   CONFIG.PSU_MIO_69_DIRECTION {inout} \
   CONFIG.PSU_MIO_69_POLARITY {Default} \
   CONFIG.PSU_MIO_6_DIRECTION {inout} \
   CONFIG.PSU_MIO_6_POLARITY {Default} \
   CONFIG.PSU_MIO_70_DIRECTION {out} \
   CONFIG.PSU_MIO_70_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_70_POLARITY {Default} \
   CONFIG.PSU_MIO_71_DIRECTION {inout} \
   CONFIG.PSU_MIO_71_POLARITY {Default} \
   CONFIG.PSU_MIO_72_DIRECTION {inout} \
   CONFIG.PSU_MIO_72_POLARITY {Default} \
   CONFIG.PSU_MIO_73_DIRECTION {inout} \
   CONFIG.PSU_MIO_73_POLARITY {Default} \
   CONFIG.PSU_MIO_74_DIRECTION {inout} \
   CONFIG.PSU_MIO_74_POLARITY {Default} \
   CONFIG.PSU_MIO_75_DIRECTION {inout} \
   CONFIG.PSU_MIO_75_POLARITY {Default} \
   CONFIG.PSU_MIO_76_DIRECTION {inout} \
   CONFIG.PSU_MIO_76_POLARITY {Default} \
   CONFIG.PSU_MIO_77_DIRECTION {inout} \
   CONFIG.PSU_MIO_77_POLARITY {Default} \
   CONFIG.PSU_MIO_7_DIRECTION {inout} \
   CONFIG.PSU_MIO_7_POLARITY {Default} \
   CONFIG.PSU_MIO_8_DIRECTION {inout} \
   CONFIG.PSU_MIO_8_POLARITY {Default} \
   CONFIG.PSU_MIO_9_DIRECTION {inout} \
   CONFIG.PSU_MIO_9_POLARITY {Default} \
   CONFIG.PSU_MIO_TREE_PERIPHERALS {SPI 0#SPI 0#SPI 0#SPI 0#SPI 0#SPI 0#SPI 1#GPIO0 MIO#GPIO0 MIO#SPI 1#SPI 1#SPI 1#GPIO0 MIO#SD 0#SD 0#SD 0#SD 0#GPIO0 MIO#I2C 0#I2C 0#GPIO0 MIO#SD 0#SD 0#GPIO0 MIO#SD 0#SD 0#GPIO1 MIO#DPAUX#DPAUX#DPAUX#DPAUX#GPIO1 MIO#UART 1#UART 1#GPIO1 MIO#GPIO1 MIO#I2C 1#I2C 1#Gem 1#Gem 1#Gem 1#Gem 1#Gem 1#Gem 1#Gem 1#Gem 1#Gem 1#Gem 1#Gem 1#Gem 1#MDIO 1#MDIO 1#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#GPIO2 MIO#GPIO2 MIO} \
   CONFIG.PSU_MIO_TREE_SIGNALS {sclk_out#n_ss_out[2]#n_ss_out[1]#n_ss_out[0]#miso#mosi#sclk_out#gpio0[7]#gpio0[8]#n_ss_out[0]#miso#mosi#gpio0[12]#sdio0_data_out[0]#sdio0_data_out[1]#sdio0_data_out[2]#sdio0_data_out[3]#gpio0[17]#scl_out#sda_out#gpio0[20]#sdio0_cmd_out#sdio0_clk_out#gpio0[23]#sdio0_cd_n#sdio0_wp#gpio1[26]#dp_aux_data_out#dp_hot_plug_detect#dp_aux_data_oe#dp_aux_data_in#gpio1[31]#txd#rxd#gpio1[34]#gpio1[35]#scl_out#sda_out#rgmii_tx_clk#rgmii_txd[0]#rgmii_txd[1]#rgmii_txd[2]#rgmii_txd[3]#rgmii_tx_ctl#rgmii_rx_clk#rgmii_rxd[0]#rgmii_rxd[1]#rgmii_rxd[2]#rgmii_rxd[3]#rgmii_rx_ctl#gem1_mdc#gem1_mdio_out#ulpi_clk_in#ulpi_dir#ulpi_tx_data[2]#ulpi_nxt#ulpi_tx_data[0]#ulpi_tx_data[1]#ulpi_stp#ulpi_tx_data[3]#ulpi_tx_data[4]#ulpi_tx_data[5]#ulpi_tx_data[6]#ulpi_tx_data[7]#ulpi_clk_in#ulpi_dir#ulpi_tx_data[2]#ulpi_nxt#ulpi_tx_data[0]#ulpi_tx_data[1]#ulpi_stp#ulpi_tx_data[3]#ulpi_tx_data[4]#ulpi_tx_data[5]#ulpi_tx_data[6]#ulpi_tx_data[7]#gpio2[76]#gpio2[77]} \
   CONFIG.PSU_SD0_INTERNAL_BUS_WIDTH {4} \
   CONFIG.PSU_USB3__DUAL_CLOCK_ENABLE {1} \
   CONFIG.PSU__ACT_DDR_FREQ_MHZ {1199.999756} \
   CONFIG.PSU__CAN1__GRP_CLK__ENABLE {0} \
   CONFIG.PSU__CAN1__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__ACT_FREQMHZ {1199.999756} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__FREQMHZ {1200} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__SRCSEL {APLL} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FBDIV {72} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__APLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__ACT_FREQMHZ {249.999954} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__ACT_FREQMHZ {249.999954} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__ACT_FREQMHZ {599.999878} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__FREQMHZ {1200} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__ACT_FREQMHZ {599.999878} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {72} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__DPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__ACT_FREQMHZ {24.999996} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR0 {21} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRF_APB__DP_AUDIO__FRAC_ENABLED {0} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__ACT_FREQMHZ {26.249996} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR0 {20} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__ACT_FREQMHZ {299.999939} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_VIDEO__FRAC_ENABLED {0} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__ACT_FREQMHZ {599.999878} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__ACT_FREQMHZ {99.999985} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__ACT_FREQMHZ {399.999908} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__FREQMHZ {533.33} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FBDIV {90} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__VPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__ACT_FREQMHZ {524.999939} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__FREQMHZ {533.333} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__ACT_FREQMHZ {49.999992} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR0 {30} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__ACT_FREQMHZ {499.999908} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__ACT_FREQMHZ {249.999954} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__DLL_REF_CTRL__ACT_FREQMHZ {1499.999756} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__ACT_FREQMHZ {124.999977} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__ACT_FREQMHZ {249.999954} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__ACT_FREQMHZ {99.999985} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__ACT_FREQMHZ {99.999985} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FBDIV {90} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__IOPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__ACT_FREQMHZ {262.499969} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__FREQMHZ {267} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__ACT_FREQMHZ {99.999985} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__ACT_FREQMHZ {524.999939} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__FREQMHZ {533.333} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__ACT_FREQMHZ {187.499969} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__ACT_FREQMHZ {99.999985} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FBDIV {63} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__RPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__ACT_FREQMHZ {187.499969} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__ACT_FREQMHZ {187.499969} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__ACT_FREQMHZ {187.499969} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__ACT_FREQMHZ {33.333328} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__ACT_FREQMHZ {99.999985} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__ACT_FREQMHZ {249.999954} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__ACT_FREQMHZ {249.999954} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__ACT_FREQMHZ {19.999996} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR0 {25} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR1 {3} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__FREQMHZ {20} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB3__ENABLE {1} \
   CONFIG.PSU__DDRC__ADDR_MIRROR {0} \
   CONFIG.PSU__DDRC__BANK_ADDR_COUNT {2} \
   CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
   CONFIG.PSU__DDRC__BRC_MAPPING {ROW_BANK_COL} \
   CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
   CONFIG.PSU__DDRC__CL {16} \
   CONFIG.PSU__DDRC__CLOCK_STOP_EN {0} \
   CONFIG.PSU__DDRC__COL_ADDR_COUNT {10} \
   CONFIG.PSU__DDRC__COMPONENTS {Components} \
   CONFIG.PSU__DDRC__CWL {12} \
   CONFIG.PSU__DDRC__DDR3L_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__DDR3_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__DDR4_ADDR_MAPPING {1} \
   CONFIG.PSU__DDRC__DDR4_CAL_MODE_ENABLE {0} \
   CONFIG.PSU__DDRC__DDR4_CRC_CONTROL {0} \
   CONFIG.PSU__DDRC__DDR4_T_REF_MODE {0} \
   CONFIG.PSU__DDRC__DDR4_T_REF_RANGE {Normal (0-85)} \
   CONFIG.PSU__DDRC__DEEP_PWR_DOWN_EN {0} \
   CONFIG.PSU__DDRC__DEVICE_CAPACITY {16384 MBits} \
   CONFIG.PSU__DDRC__DIMM_ADDR_MIRROR {0} \
   CONFIG.PSU__DDRC__DM_DBI {DM_NO_DBI} \
   CONFIG.PSU__DDRC__DQMAP_0_3 {0} \
   CONFIG.PSU__DDRC__DQMAP_12_15 {0} \
   CONFIG.PSU__DDRC__DQMAP_16_19 {0} \
   CONFIG.PSU__DDRC__DQMAP_20_23 {0} \
   CONFIG.PSU__DDRC__DQMAP_24_27 {0} \
   CONFIG.PSU__DDRC__DQMAP_28_31 {0} \
   CONFIG.PSU__DDRC__DQMAP_32_35 {0} \
   CONFIG.PSU__DDRC__DQMAP_36_39 {0} \
   CONFIG.PSU__DDRC__DQMAP_40_43 {0} \
   CONFIG.PSU__DDRC__DQMAP_44_47 {0} \
   CONFIG.PSU__DDRC__DQMAP_48_51 {0} \
   CONFIG.PSU__DDRC__DQMAP_4_7 {0} \
   CONFIG.PSU__DDRC__DQMAP_52_55 {0} \
   CONFIG.PSU__DDRC__DQMAP_56_59 {0} \
   CONFIG.PSU__DDRC__DQMAP_60_63 {0} \
   CONFIG.PSU__DDRC__DQMAP_64_67 {0} \
   CONFIG.PSU__DDRC__DQMAP_68_71 {0} \
   CONFIG.PSU__DDRC__DQMAP_8_11 {0} \
   CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
   CONFIG.PSU__DDRC__ECC {Disabled} \
   CONFIG.PSU__DDRC__ENABLE_LP4_HAS_ECC_COMP {0} \
   CONFIG.PSU__DDRC__ENABLE_LP4_SLOWBOOT {0} \
   CONFIG.PSU__DDRC__FGRM {1X} \
   CONFIG.PSU__DDRC__LPDDR3_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__LPDDR4_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__LP_ASR {manual normal} \
   CONFIG.PSU__DDRC__MEMORY_TYPE {DDR 4} \
   CONFIG.PSU__DDRC__PARITY_ENABLE {0} \
   CONFIG.PSU__DDRC__PER_BANK_REFRESH {0} \
   CONFIG.PSU__DDRC__PHY_DBI_MODE {0} \
   CONFIG.PSU__DDRC__RANK_ADDR_COUNT {0} \
   CONFIG.PSU__DDRC__ROW_ADDR_COUNT {17} \
   CONFIG.PSU__DDRC__SB_TARGET {16-16-16} \
   CONFIG.PSU__DDRC__SELF_REF_ABORT {0} \
   CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400R} \
   CONFIG.PSU__DDRC__STATIC_RD_MODE {0} \
   CONFIG.PSU__DDRC__TRAIN_DATA_EYE {1} \
   CONFIG.PSU__DDRC__TRAIN_READ_GATE {1} \
   CONFIG.PSU__DDRC__TRAIN_WRITE_LEVEL {1} \
   CONFIG.PSU__DDRC__T_FAW {30.0} \
   CONFIG.PSU__DDRC__T_RAS_MIN {32.0} \
   CONFIG.PSU__DDRC__T_RC {45.32} \
   CONFIG.PSU__DDRC__T_RCD {16} \
   CONFIG.PSU__DDRC__T_RP {16} \
   CONFIG.PSU__DDRC__VENDOR_PART {OTHERS} \
   CONFIG.PSU__DDRC__VREF {1} \
   CONFIG.PSU__DDR_HIGH_ADDRESS_GUI_ENABLE {1} \
   CONFIG.PSU__DDR__INTERFACE__FREQMHZ {600.000} \
   CONFIG.PSU__DISPLAYPORT__LANE0__ENABLE {1} \
   CONFIG.PSU__DISPLAYPORT__LANE0__IO {GT Lane1} \
   CONFIG.PSU__DISPLAYPORT__LANE1__ENABLE {1} \
   CONFIG.PSU__DISPLAYPORT__LANE1__IO {GT Lane0} \
   CONFIG.PSU__DISPLAYPORT__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__DLL__ISUSED {1} \
   CONFIG.PSU__DPAUX__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__DPAUX__PERIPHERAL__IO {MIO 27 .. 30} \
   CONFIG.PSU__DP__LANE_SEL {Dual Lower} \
   CONFIG.PSU__DP__REF_CLK_FREQ {27} \
   CONFIG.PSU__DP__REF_CLK_SEL {Ref Clk0} \
   CONFIG.PSU__ENET1__FIFO__ENABLE {0} \
   CONFIG.PSU__ENET1__GRP_MDIO__ENABLE {1} \
   CONFIG.PSU__ENET1__GRP_MDIO__IO {MIO 50 .. 51} \
   CONFIG.PSU__ENET1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__ENET1__PERIPHERAL__IO {MIO 38 .. 49} \
   CONFIG.PSU__ENET1__PTP__ENABLE {0} \
   CONFIG.PSU__ENET1__TSU__ENABLE {0} \
   CONFIG.PSU__FPGA_PL0_ENABLE {1} \
   CONFIG.PSU__GEM1_COHERENCY {0} \
   CONFIG.PSU__GEM1_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__GEM__TSU__ENABLE {0} \
   CONFIG.PSU__GPIO0_MIO__IO {MIO 0 .. 25} \
   CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GPIO1_MIO__IO {MIO 26 .. 51} \
   CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GPIO2_MIO__IO {MIO 52 .. 77} \
   CONFIG.PSU__GPIO2_MIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GPIO_EMIO_WIDTH {41} \
   CONFIG.PSU__GPIO_EMIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GPIO_EMIO__PERIPHERAL__IO {41} \
   CONFIG.PSU__GT__LINK_SPEED {HBR} \
   CONFIG.PSU__GT__PRE_EMPH_LVL_4 {0} \
   CONFIG.PSU__GT__VLT_SWNG_LVL_4 {0} \
   CONFIG.PSU__HIGH_ADDRESS__ENABLE {1} \
   CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__I2C0__PERIPHERAL__IO {MIO 18 .. 19} \
   CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__I2C1__PERIPHERAL__IO {MIO 36 .. 37} \
   CONFIG.PSU__MAXIGP0__DATA_WIDTH {128} \
   CONFIG.PSU__MAXIGP1__DATA_WIDTH {128} \
   CONFIG.PSU__MAXIGP2__DATA_WIDTH {32} \
   CONFIG.PSU__OVERRIDE__BASIC_CLOCK {0} \
   CONFIG.PSU__PL_CLK0_BUF {TRUE} \
   CONFIG.PSU__PMU_COHERENCY {0} \
   CONFIG.PSU__PMU__AIBACK__ENABLE {0} \
   CONFIG.PSU__PMU__EMIO_GPI__ENABLE {0} \
   CONFIG.PSU__PMU__EMIO_GPO__ENABLE {0} \
   CONFIG.PSU__PMU__GPI0__ENABLE {0} \
   CONFIG.PSU__PMU__GPI1__ENABLE {0} \
   CONFIG.PSU__PMU__GPI2__ENABLE {0} \
   CONFIG.PSU__PMU__GPI3__ENABLE {0} \
   CONFIG.PSU__PMU__GPI4__ENABLE {0} \
   CONFIG.PSU__PMU__GPI5__ENABLE {0} \
   CONFIG.PSU__PMU__GPO0__ENABLE {0} \
   CONFIG.PSU__PMU__GPO1__ENABLE {0} \
   CONFIG.PSU__PMU__GPO2__ENABLE {0} \
   CONFIG.PSU__PMU__GPO3__ENABLE {0} \
   CONFIG.PSU__PMU__GPO4__ENABLE {0} \
   CONFIG.PSU__PMU__GPO5__ENABLE {0} \
   CONFIG.PSU__PMU__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__PMU__PLERROR__ENABLE {0} \
   CONFIG.PSU__PRESET_APPLIED {1} \
   CONFIG.PSU__PROTECTION__MASTERS {USB1:NonSecure;1|USB0:NonSecure;1|S_AXI_LPD:NA;0|S_AXI_HPC1_FPD:NA;0|S_AXI_HPC0_FPD:NA;0|S_AXI_HP3_FPD:NA;0|S_AXI_HP2_FPD:NA;1|S_AXI_HP1_FPD:NA;0|S_AXI_HP0_FPD:NA;0|S_AXI_ACP:NA;0|S_AXI_ACE:NA;0|SD1:NonSecure;0|SD0:NonSecure;1|SATA1:NonSecure;0|SATA0:NonSecure;0|RPU1:Secure;1|RPU0:Secure;1|QSPI:NonSecure;0|PMU:NA;1|PCIe:NonSecure;0|NAND:NonSecure;0|LDMA:NonSecure;1|GPU:NonSecure;1|GEM3:NonSecure;0|GEM2:NonSecure;0|GEM1:NonSecure;1|GEM0:NonSecure;0|FDMA:NonSecure;1|DP:NonSecure;1|DAP:NA;1|Coresight:NA;1|CSU:NA;1|APU:NA;1} \
   CONFIG.PSU__PROTECTION__SLAVES { \
     LPD;USB3_1_XHCI;FE300000;FE3FFFFF;1|LPD;USB3_1;FF9E0000;FF9EFFFF;1|LPD;USB3_0_XHCI;FE200000;FE2FFFFF;1|LPD;USB3_0;FF9D0000;FF9DFFFF;1|LPD;UART1;FF010000;FF01FFFF;1|LPD;UART0;FF000000;FF00FFFF;0|LPD;TTC3;FF140000;FF14FFFF;0|LPD;TTC2;FF130000;FF13FFFF;0|LPD;TTC1;FF120000;FF12FFFF;0|LPD;TTC0;FF110000;FF11FFFF;0|FPD;SWDT1;FD4D0000;FD4DFFFF;0|LPD;SWDT0;FF150000;FF15FFFF;0|LPD;SPI1;FF050000;FF05FFFF;1|LPD;SPI0;FF040000;FF04FFFF;1|FPD;SMMU_REG;FD5F0000;FD5FFFFF;1|FPD;SMMU;FD800000;FDFFFFFF;1|FPD;SIOU;FD3D0000;FD3DFFFF;1|FPD;SERDES;FD400000;FD47FFFF;1|LPD;SD1;FF170000;FF17FFFF;0|LPD;SD0;FF160000;FF16FFFF;1|FPD;SATA;FD0C0000;FD0CFFFF;0|LPD;RTC;FFA60000;FFA6FFFF;1|LPD;RSA_CORE;FFCE0000;FFCEFFFF;1|LPD;RPU;FF9A0000;FF9AFFFF;1|LPD;R5_TCM_RAM_GLOBAL;FFE00000;FFE3FFFF;1|LPD;R5_1_Instruction_Cache;FFEC0000;FFECFFFF;1|LPD;R5_1_Data_Cache;FFED0000;FFEDFFFF;1|LPD;R5_1_BTCM_GLOBAL;FFEB0000;FFEBFFFF;1|LPD;R5_1_ATCM_GLOBAL;FFE90000;FFE9FFFF;1|LPD;R5_0_Instruction_Cache;FFE40000;FFE4FFFF;1|LPD;R5_0_Data_Cache;FFE50000;FFE5FFFF;1|LPD;R5_0_BTCM_GLOBAL;FFE20000;FFE2FFFF;1|LPD;R5_0_ATCM_GLOBAL;FFE00000;FFE0FFFF;1|LPD;QSPI_Linear_Address;C0000000;DFFFFFFF;1|LPD;QSPI;FF0F0000;FF0FFFFF;0|LPD;PMU_RAM;FFDC0000;FFDDFFFF;1|LPD;PMU_GLOBAL;FFD80000;FFDBFFFF;1|FPD;PCIE_MAIN;FD0E0000;FD0EFFFF;0|FPD;PCIE_LOW;E0000000;EFFFFFFF;0|FPD;PCIE_HIGH2;8000000000;BFFFFFFFFF;0|FPD;PCIE_HIGH1;600000000;7FFFFFFFF;0|FPD;PCIE_DMA;FD0F0000;FD0FFFFF;0|FPD;PCIE_ATTRIB;FD480000;FD48FFFF;0|LPD;OCM_XMPU_CFG;FFA70000;FFA7FFFF;1|LPD;OCM_SLCR;FF960000;FF96FFFF;1|OCM;OCM;FFFC0000;FFFFFFFF;1|LPD;NAND;FF100000;FF10FFFF;0|LPD;MBISTJTAG;FFCF0000;FFCFFFFF;1|LPD;LPD_XPPU_SINK;FF9C0000;FF9CFFFF;1|LPD;LPD_XPPU;FF980000;FF98FFFF;1|LPD;LPD_SLCR_SECURE;FF4B0000;FF4DFFFF;1|LPD;LPD_SLCR;FF410000;FF4AFFFF;1|LPD;LPD_GPV;FE100000;FE1FFFFF;1|LPD;LPD_DMA_7;FFAF0000;FFAFFFFF;1|LPD;LPD_DMA_6;FFAE0000;FFAEFFFF;1|LPD;LPD_DMA_5;FFAD0000;FFADFFFF;1|LPD;LPD_DMA_4;FFAC0000;FFACFFFF;1|LPD;LPD_DMA_3;FFAB0000;FFABFFFF;1|LPD;LPD_DMA_2;FFAA0000;FFAAFFFF;1|LPD;LPD_DMA_1;FFA90000;FFA9FFFF;1|LPD;LPD_DMA_0;FFA80000;FFA8FFFF;1|LPD;IPI_CTRL;FF380000;FF3FFFFF;1|LPD;IOU_SLCR;FF180000;FF23FFFF;1|LPD;IOU_SECURE_SLCR;FF240000;FF24FFFF;1|LPD;IOU_SCNTRS;FF260000;FF26FFFF;1|LPD;IOU_SCNTR;FF250000;FF25FFFF;1|LPD;IOU_GPV;FE000000;FE0FFFFF;1|LPD;I2C1;FF030000;FF03FFFF;1|LPD;I2C0;FF020000;FF02FFFF;1|FPD;GPU;FD4B0000;FD4BFFFF;0|LPD;GPIO;FF0A0000;FF0AFFFF;1|LPD;GEM3;FF0E0000;FF0EFFFF;0|LPD;GEM2;FF0D0000;FF0DFFFF;0|LPD;GEM1;FF0C0000;FF0CFFFF;1|LPD;GEM0;FF0B0000;FF0BFFFF;0|FPD;FPD_XMPU_SINK;FD4F0000;FD4FFFFF;1|FPD;FPD_XMPU_CFG;FD5D0000;FD5DFFFF;1|FPD;FPD_SLCR_SECURE;FD690000;FD6CFFFF;1|FPD;FPD_SLCR;FD610000;FD68FFFF;1|FPD;FPD_DMA_CH7;FD570000;FD57FFFF;1|FPD;FPD_DMA_CH6;FD560000;FD56FFFF;1|FPD;FPD_DMA_CH5;FD550000;FD55FFFF;1|FPD;FPD_DMA_CH4;FD540000;FD54FFFF;1|FPD;FPD_DMA_CH3;FD530000;FD53FFFF;1|FPD;FPD_DMA_CH2;FD520000;FD52FFFF;1|FPD;FPD_DMA_CH1;FD510000;FD51FFFF;1|FPD;FPD_DMA_CH0;FD500000;FD50FFFF;1|LPD;EFUSE;FFCC0000;FFCCFFFF;1|FPD;Display Port;FD4A0000;FD4AFFFF;1|FPD;DPDMA;FD4C0000;FD4CFFFF;1|FPD;DDR_XMPU5_CFG;FD050000;FD05FFFF;1|FPD;DDR_XMPU4_CFG;FD040000;FD04FFFF;1|FPD;DDR_XMPU3_CFG;FD030000;FD03FFFF;1|FPD;DDR_XMPU2_CFG;FD020000;FD02FFFF;1|FPD;DDR_XMPU1_CFG;FD010000;FD01FFFF;1|FPD;DDR_XMPU0_CFG;FD000000;FD00FFFF;1|FPD;DDR_QOS_CTRL;FD090000;FD09FFFF;1|FPD;DDR_PHY;FD080000;FD08FFFF;1|DDR;DDR_LOW;0;7FFFFFFF;1|DDR;DDR_HIGH;800000000;97FFFFFFF;1|FPD;DDDR_CTRL;FD070000;FD070FFF;1|LPD;Coresight;FE800000;FEFFFFFF;1|LPD;CSU_DMA;FFC80000;FFC9FFFF;1|LPD;CSU;FFCA0000;FFCAFFFF;1|LPD;CRL_APB;FF5E0000;FF85FFFF;1|FPD;CRF_APB;FD1A0000;FD2DFFFF;1|FPD;CCI_REG;FD5E0000;FD5EFFFF;1|LPD;CAN1;FF070000;FF07FFFF;0|LPD;CAN0;FF060000;FF06FFFF;0|FPD;APU;FD5C0000;FD5CFFFF;1|LPD;APM_INTC_IOU;FFA20000;FFA2FFFF;1|LPD;APM_FPD_LPD;FFA30000;FFA3FFFF;1|FPD;APM_5;FD490000;FD49FFFF;1|FPD;APM_0;FD0B0000;FD0BFFFF;1|LPD;APM2;FFA10000;FFA1FFFF;1|LPD;APM1;FFA00000;FFA0FFFF;1|LPD;AMS;FFA50000;FFA5FFFF;1|FPD;AFI_5;FD3B0000;FD3BFFFF;1|FPD;AFI_4;FD3A0000;FD3AFFFF;1|FPD;AFI_3;FD390000;FD39FFFF;1|FPD;AFI_2;FD380000;FD38FFFF;1|FPD;AFI_1;FD370000;FD37FFFF;1|FPD;AFI_0;FD360000;FD36FFFF;1|LPD;AFIFM6;FF9B0000;FF9BFFFF;1|FPD;ACPU_GIC;F9010000;F907FFFF;1 \
   } \
   CONFIG.PSU__PSS_REF_CLK__FREQMHZ {33.33333} \
   CONFIG.PSU__QSPI_COHERENCY {0} \
   CONFIG.PSU__QSPI_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {0} \
   CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__SAXIGP4__DATA_WIDTH {128} \
   CONFIG.PSU__SD0_COHERENCY {0} \
   CONFIG.PSU__SD0_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__SD0__DATA_TRANSFER_MODE {4Bit} \
   CONFIG.PSU__SD0__GRP_CD__ENABLE {1} \
   CONFIG.PSU__SD0__GRP_CD__IO {MIO 24} \
   CONFIG.PSU__SD0__GRP_POW__ENABLE {0} \
   CONFIG.PSU__SD0__GRP_WP__ENABLE {1} \
   CONFIG.PSU__SD0__GRP_WP__IO {MIO 25} \
   CONFIG.PSU__SD0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SD0__PERIPHERAL__IO {MIO 13 .. 16 21 22} \
   CONFIG.PSU__SD0__RESET__ENABLE {0} \
   CONFIG.PSU__SD0__SLOT_TYPE {SD 2.0} \
   CONFIG.PSU__SPI0__GRP_SS0__ENABLE {1} \
   CONFIG.PSU__SPI0__GRP_SS0__IO {MIO 3} \
   CONFIG.PSU__SPI0__GRP_SS1__ENABLE {1} \
   CONFIG.PSU__SPI0__GRP_SS1__IO {MIO 2} \
   CONFIG.PSU__SPI0__GRP_SS2__ENABLE {1} \
   CONFIG.PSU__SPI0__GRP_SS2__IO {MIO 1} \
   CONFIG.PSU__SPI0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SPI0__PERIPHERAL__IO {MIO 0 .. 5} \
   CONFIG.PSU__SPI1__GRP_SS0__ENABLE {1} \
   CONFIG.PSU__SPI1__GRP_SS0__IO {MIO 9} \
   CONFIG.PSU__SPI1__GRP_SS1__ENABLE {0} \
   CONFIG.PSU__SPI1__GRP_SS2__ENABLE {0} \
   CONFIG.PSU__SPI1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SPI1__PERIPHERAL__IO {MIO 6 .. 11} \
   CONFIG.PSU__TSU__BUFG_PORT_PAIR {0} \
   CONFIG.PSU__UART0__MODEM__ENABLE {0} \
   CONFIG.PSU__UART0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__UART1__BAUD_RATE {115200} \
   CONFIG.PSU__UART1__MODEM__ENABLE {0} \
   CONFIG.PSU__UART1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__UART1__PERIPHERAL__IO {MIO 32 .. 33} \
   CONFIG.PSU__USB0_COHERENCY {0} \
   CONFIG.PSU__USB0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__USB0__PERIPHERAL__IO {MIO 52 .. 63} \
   CONFIG.PSU__USB0__REF_CLK_FREQ {100} \
   CONFIG.PSU__USB0__REF_CLK_SEL {Ref Clk1} \
   CONFIG.PSU__USB0__RESET__ENABLE {0} \
   CONFIG.PSU__USB1_COHERENCY {0} \
   CONFIG.PSU__USB1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__USB1__PERIPHERAL__IO {MIO 64 .. 75} \
   CONFIG.PSU__USB1__REF_CLK_FREQ {100} \
   CONFIG.PSU__USB1__REF_CLK_SEL {Ref Clk1} \
   CONFIG.PSU__USB1__RESET__ENABLE {0} \
   CONFIG.PSU__USB2_0__EMIO__ENABLE {0} \
   CONFIG.PSU__USB2_1__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_0__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__USB3_0__PERIPHERAL__IO {GT Lane2} \
   CONFIG.PSU__USB3_1__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__USB3_1__PERIPHERAL__IO {GT Lane3} \
   CONFIG.PSU__USB__RESET__MODE {Boot Pin} \
   CONFIG.PSU__USB__RESET__POLARITY {Active Low} \
   CONFIG.PSU__USE__IRQ0 {0} \
   CONFIG.PSU__USE__IRQ1 {0} \
   CONFIG.PSU__USE__M_AXI_GP0 {1} \
   CONFIG.PSU__USE__M_AXI_GP1 {1} \
   CONFIG.PSU__USE__M_AXI_GP2 {0} \
   CONFIG.PSU__USE__S_AXI_GP4 {1} \
   CONFIG.SUBPRESET1 {Custom} \
 ] $zynq_ultra_ps_e

  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN1_D_0_1 [get_bd_intf_ports sys_clk] [get_bd_intf_pins clk_wiz_307_2M/CLK_IN1_D]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins radio/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e/M_AXI_HPM0_FPD]
  connect_bd_intf_net -intf_net adc0_clk_1 [get_bd_intf_ports adc0_clk] [get_bd_intf_pins radio/adc0_clk]
  connect_bd_intf_net -intf_net adc2_clk_1 [get_bd_intf_ports adc2_clk] [get_bd_intf_pins radio/adc2_clk]
  connect_bd_intf_net -intf_net axi_data_fifo1_M_AXI [get_bd_intf_pins axi_data_fifo1/M_AXI] [get_bd_intf_pins zynq_ultra_ps_e/S_AXI_HP2_FPD]
  connect_bd_intf_net -intf_net axi_data_fifo_M_AXI [get_bd_intf_pins axi_data_fifo/M_AXI] [get_bd_intf_pins axi_data_fifo1/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_sam_M00_AXI [get_bd_intf_pins axi_data_fifo/S_AXI] [get_bd_intf_pins radio/M00_AXI]
  connect_bd_intf_net -intf_net dac0_clk_1 [get_bd_intf_ports dac0_clk] [get_bd_intf_pins radio/dac0_clk]
  connect_bd_intf_net -intf_net dac2_clk_1 [get_bd_intf_ports dac2_clk] [get_bd_intf_pins radio/dac2_clk]
  connect_bd_intf_net -intf_net ps8_axi_periph_M00_AXI [get_bd_intf_pins ps8_axi_periph/M00_AXI] [get_bd_intf_pins radio/s_axi]
  connect_bd_intf_net -intf_net sysref_in_1 [get_bd_intf_ports sysref_in] [get_bd_intf_pins radio/sysref_in]
  connect_bd_intf_net -intf_net usp_rf_data_converter_vout00 [get_bd_intf_ports vout00] [get_bd_intf_pins radio/vout00]
  connect_bd_intf_net -intf_net usp_rf_data_converter_vout20 [get_bd_intf_ports vout20] [get_bd_intf_pins radio/vout20]
  connect_bd_intf_net -intf_net vin0_01_1 [get_bd_intf_ports vin0_01] [get_bd_intf_pins radio/vin0_01]
  connect_bd_intf_net -intf_net vin0_23_1 [get_bd_intf_ports vin0_23] [get_bd_intf_pins radio/vin0_23]
  connect_bd_intf_net -intf_net vin2_01_1 [get_bd_intf_ports vin2_01] [get_bd_intf_pins radio/vin2_01]
  connect_bd_intf_net -intf_net vin2_23_1 [get_bd_intf_ports vin2_23] [get_bd_intf_pins radio/vin2_23]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_M_AXI_HPM1_FPD [get_bd_intf_pins ps8_axi_periph/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e/M_AXI_HPM1_FPD]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins proc_sys_reset_307_2M/interconnect_aresetn] [get_bd_pins radio/ARESETN]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins axi_data_fifo/aresetn] [get_bd_pins axi_data_fifo1/aresetn] [get_bd_pins proc_sys_reset_307_2M/peripheral_aresetn] [get_bd_pins radio/S00_ARESETN1]
  connect_bd_net -net clk_wiz_307_2M_clk_out1 [get_bd_pins axi_data_fifo/aclk] [get_bd_pins axi_data_fifo1/aclk] [get_bd_pins clk_wiz_307_2M/clk_out1] [get_bd_pins proc_sys_reset_307_2M/slowest_sync_clk] [get_bd_pins radio/M00_ACLK] [get_bd_pins zynq_ultra_ps_e/maxihpm0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e/saxihp2_fpd_aclk]
  connect_bd_net -net clk_wiz_307_2M_locked [get_bd_pins clk_wiz_307_2M/locked] [get_bd_pins proc_sys_reset_307_2M/dcm_locked]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins proc_sys_reset_100M/peripheral_aresetn] [get_bd_pins ps8_axi_periph/ARESETN] [get_bd_pins ps8_axi_periph/M00_ARESETN] [get_bd_pins ps8_axi_periph/S00_ARESETN] [get_bd_pins radio/s_axi_aresetn]
  connect_bd_net -net zynq_ultra_ps_e_pl_clk0 [get_bd_pins proc_sys_reset_100M/slowest_sync_clk] [get_bd_pins ps8_axi_periph/ACLK] [get_bd_pins ps8_axi_periph/M00_ACLK] [get_bd_pins ps8_axi_periph/S00_ACLK] [get_bd_pins radio/s_axi_aclk] [get_bd_pins zynq_ultra_ps_e/maxihpm1_fpd_aclk] [get_bd_pins zynq_ultra_ps_e/pl_clk0]
  connect_bd_net -net zynq_ultra_ps_e_pl_resetn0 [get_bd_pins proc_sys_reset_100M/ext_reset_in] [get_bd_pins proc_sys_reset_307_2M/ext_reset_in] [get_bd_pins radio/ext_reset_in] [get_bd_pins zynq_ultra_ps_e/pl_resetn0]

  # Create address segments
  assign_bd_address -offset 0xA0090000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/transmitter/channel_20/control/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0xA0080000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/transmitter/channel_00/control/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0xA0040000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_20/decimator/xsg_bwselector_s_axi/reg0] -force
  assign_bd_address -offset 0xA0060000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_22/decimator/xsg_bwselector_s_axi/reg0] -force
  assign_bd_address -offset 0xA0000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_00/decimator/xsg_bwselector_s_axi/reg0] -force
  assign_bd_address -offset 0xA0020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_02/decimator/xsg_bwselector_s_axi/reg0] -force
  assign_bd_address -offset 0xA0030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_02/spectrum_analyser/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0xA0050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_20/spectrum_analyser/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0xA0070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_22/spectrum_analyser/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0xA0010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_00/spectrum_analyser/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0xB0000000 -range 0x00040000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/rfdc/s_axi/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_00/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_00/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_LPS_OCM] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_02/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_02/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_LPS_OCM] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_20/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_20/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_LPS_OCM] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_22/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_22/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_LPS_OCM] -force

  # Exclude Address Segments
  exclude_bd_addr_seg -target_address_space [get_bd_addr_spaces radio/receiver/channel_00/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_HIGH]
  exclude_bd_addr_seg -target_address_space [get_bd_addr_spaces radio/receiver/channel_02/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_HIGH]
  exclude_bd_addr_seg -target_address_space [get_bd_addr_spaces radio/receiver/channel_20/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_HIGH]
  exclude_bd_addr_seg -target_address_space [get_bd_addr_spaces radio/receiver/channel_22/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_HIGH]


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


