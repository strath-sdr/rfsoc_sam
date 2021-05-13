
################################################################
# This is a generated script based on design: block_design
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
set scripts_vivado_version 2020.1
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
# source block_design_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu28dr-ffvg1517-2-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name block_design

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
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:zynq_ultra_ps_e:3.3\
xilinx.com:ip:usp_rf_data_converter:2.3\
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


# Hierarchical cell: channel_10
proc create_hier_cell_channel_10 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_channel_10() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis


  # Create pins
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: axis_broadcaster, and set properties
  set axis_broadcaster [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster ]

  # Create instance: axis_combiner, and set properties
  set axis_combiner [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_combiner:1.1 axis_combiner ]

  # Create instance: control, and set properties
  set control [ create_bd_cell -type ip -vlnv xilinx.com:ip:mw_transmitter:1.0 control ]

  # Create interface connections
  connect_bd_intf_net -intf_net axis_broadcaster_M00_AXIS [get_bd_intf_pins axis_broadcaster/M00_AXIS] [get_bd_intf_pins axis_combiner/S00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_M01_AXIS [get_bd_intf_pins axis_broadcaster/M01_AXIS] [get_bd_intf_pins axis_combiner/S01_AXIS]
  connect_bd_intf_net -intf_net axis_combiner_M_AXIS [get_bd_intf_pins m_axis] [get_bd_intf_pins axis_combiner/M_AXIS]
  connect_bd_intf_net -intf_net control_AXI4_Stream_Master [get_bd_intf_pins axis_broadcaster/S_AXIS] [get_bd_intf_pins control/AXI4_Stream_Master]
  connect_bd_intf_net -intf_net ps8_axi_periph_M01_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins control/AXI4_Lite]

  # Create port connections
  connect_bd_net -net rst_usp_rf_data_converter_256M_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins axis_broadcaster/aresetn] [get_bd_pins axis_combiner/aresetn] [get_bd_pins control/AXI4_Lite_ARESETN] [get_bd_pins control/IPCORE_RESETN]
  connect_bd_net -net usp_rf_data_converter_clk_dac1 [get_bd_pins s_axi_aclk] [get_bd_pins axis_broadcaster/aclk] [get_bd_pins axis_combiner/aclk] [get_bd_pins control/AXI4_Lite_ACLK] [get_bd_pins control/IPCORE_CLK]

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
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis


  # Create pins
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: axis_broadcaster, and set properties
  set axis_broadcaster [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster ]

  # Create instance: axis_combiner, and set properties
  set axis_combiner [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_combiner:1.1 axis_combiner ]

  # Create instance: control, and set properties
  set control [ create_bd_cell -type ip -vlnv xilinx.com:ip:mw_transmitter:1.0 control ]

  # Create interface connections
  connect_bd_intf_net -intf_net axis_broadcaster_M00_AXIS [get_bd_intf_pins axis_broadcaster/M00_AXIS] [get_bd_intf_pins axis_combiner/S00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_M01_AXIS [get_bd_intf_pins axis_broadcaster/M01_AXIS] [get_bd_intf_pins axis_combiner/S01_AXIS]
  connect_bd_intf_net -intf_net axis_combiner_M_AXIS [get_bd_intf_pins m_axis] [get_bd_intf_pins axis_combiner/M_AXIS]
  connect_bd_intf_net -intf_net control_AXI4_Stream_Master [get_bd_intf_pins axis_broadcaster/S_AXIS] [get_bd_intf_pins control/AXI4_Stream_Master]
  connect_bd_intf_net -intf_net ps8_axi_periph_M01_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins control/AXI4_Lite]

  # Create port connections
  connect_bd_net -net rst_usp_rf_data_converter_256M_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins axis_broadcaster/aresetn] [get_bd_pins axis_combiner/aresetn] [get_bd_pins control/AXI4_Lite_ARESETN] [get_bd_pins control/IPCORE_RESETN]
  connect_bd_net -net usp_rf_data_converter_clk_dac1 [get_bd_pins s_axi_aclk] [get_bd_pins axis_broadcaster/aclk] [get_bd_pins axis_combiner/aclk] [get_bd_pins control/AXI4_Lite_ACLK] [get_bd_pins control/IPCORE_CLK]

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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re


  # Create pins
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn
  create_bd_pin -dir I -type clk s_axis_aclk
  create_bd_pin -dir I -type rst s_axis_aresetn

  # Create instance: axi_interconnect, and set properties
  set axi_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
 ] $axi_interconnect

  # Create instance: decimator, and set properties
  set decimator [ create_bd_cell -type ip -vlnv strath.ac.uk:RFSoC:xsg_bwselector:1.1 decimator ]

  # Create instance: spectrum_analyser, and set properties
  set spectrum_analyser [ create_bd_cell -type ip -vlnv xilinx.com:ip:SpectrumAnalyser:1.1 spectrum_analyser ]

  # Create interface connections
  connect_bd_intf_net -intf_net AXI4_Lite_1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net SpectrumAnalyser_0_AXI4_Master [get_bd_intf_pins M_AXI] [get_bd_intf_pins spectrum_analyser/AXI4_Master]
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins axi_interconnect/M00_AXI] [get_bd_intf_pins decimator/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_M01_AXI [get_bd_intf_pins axi_interconnect/M01_AXI] [get_bd_intf_pins spectrum_analyser/AXI4_Lite]
  connect_bd_intf_net -intf_net decimator_m_axis_im [get_bd_intf_pins decimator/m_axis_im] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Imag_Slave]
  connect_bd_intf_net -intf_net decimator_m_axis_re [get_bd_intf_pins decimator/m_axis_re] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Real_Slave]
  connect_bd_intf_net -intf_net s_axis_im_1 [get_bd_intf_pins s_axis_im] [get_bd_intf_pins decimator/s_axis_im]
  connect_bd_intf_net -intf_net s_axis_re_1 [get_bd_intf_pins s_axis_re] [get_bd_intf_pins decimator/s_axis_re]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins s_axi_aclk] [get_bd_pins axi_interconnect/ACLK] [get_bd_pins axi_interconnect/S00_ACLK]
  connect_bd_net -net ARESETN_1 [get_bd_pins s_axi_aresetn] [get_bd_pins axi_interconnect/ARESETN] [get_bd_pins axi_interconnect/S00_ARESETN]
  connect_bd_net -net m_axi_aclk_1 [get_bd_pins s_axis_aclk] [get_bd_pins axi_interconnect/M00_ACLK] [get_bd_pins axi_interconnect/M01_ACLK] [get_bd_pins decimator/clk] [get_bd_pins spectrum_analyser/AXI4_Lite_ACLK] [get_bd_pins spectrum_analyser/IPCORE_CLK]
  connect_bd_net -net m_axi_aresetn_1 [get_bd_pins s_axis_aresetn] [get_bd_pins axi_interconnect/M00_ARESETN] [get_bd_pins axi_interconnect/M01_ARESETN] [get_bd_pins decimator/xsg_bwselector_aresetn] [get_bd_pins spectrum_analyser/AXI4_Lite_ARESETN] [get_bd_pins spectrum_analyser/IPCORE_RESETN]

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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_im

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_re


  # Create pins
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn
  create_bd_pin -dir I -type clk s_axis_aclk
  create_bd_pin -dir I -type rst s_axis_aresetn

  # Create instance: axi_interconnect, and set properties
  set axi_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
 ] $axi_interconnect

  # Create instance: decimator, and set properties
  set decimator [ create_bd_cell -type ip -vlnv strath.ac.uk:RFSoC:xsg_bwselector:1.1 decimator ]

  # Create instance: spectrum_analyser, and set properties
  set spectrum_analyser [ create_bd_cell -type ip -vlnv xilinx.com:ip:SpectrumAnalyser:1.1 spectrum_analyser ]

  # Create interface connections
  connect_bd_intf_net -intf_net AXI4_Lite_1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net SpectrumAnalyser_0_AXI4_Master [get_bd_intf_pins M_AXI] [get_bd_intf_pins spectrum_analyser/AXI4_Master]
  connect_bd_intf_net -intf_net axi_interconnect_M00_AXI [get_bd_intf_pins axi_interconnect/M00_AXI] [get_bd_intf_pins decimator/xsg_bwselector_s_axi]
  connect_bd_intf_net -intf_net axi_interconnect_M01_AXI [get_bd_intf_pins axi_interconnect/M01_AXI] [get_bd_intf_pins spectrum_analyser/AXI4_Lite]
  connect_bd_intf_net -intf_net decimator_m_axis_im [get_bd_intf_pins decimator/m_axis_im] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Imag_Slave]
  connect_bd_intf_net -intf_net decimator_m_axis_re [get_bd_intf_pins decimator/m_axis_re] [get_bd_intf_pins spectrum_analyser/AXI4_Stream_Real_Slave]
  connect_bd_intf_net -intf_net s_axis_im_1 [get_bd_intf_pins s_axis_im] [get_bd_intf_pins decimator/s_axis_im]
  connect_bd_intf_net -intf_net s_axis_re_1 [get_bd_intf_pins s_axis_re] [get_bd_intf_pins decimator/s_axis_re]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins s_axi_aclk] [get_bd_pins axi_interconnect/ACLK] [get_bd_pins axi_interconnect/S00_ACLK]
  connect_bd_net -net ARESETN_1 [get_bd_pins s_axi_aresetn] [get_bd_pins axi_interconnect/ARESETN] [get_bd_pins axi_interconnect/S00_ARESETN]
  connect_bd_net -net m_axi_aclk_1 [get_bd_pins s_axis_aclk] [get_bd_pins axi_interconnect/M00_ACLK] [get_bd_pins axi_interconnect/M01_ACLK] [get_bd_pins decimator/clk] [get_bd_pins spectrum_analyser/AXI4_Lite_ACLK] [get_bd_pins spectrum_analyser/IPCORE_CLK]
  connect_bd_net -net m_axi_aresetn_1 [get_bd_pins s_axis_aresetn] [get_bd_pins axi_interconnect/M00_ARESETN] [get_bd_pins axi_interconnect/M01_ARESETN] [get_bd_pins decimator/xsg_bwselector_aresetn] [get_bd_pins spectrum_analyser/AXI4_Lite_ARESETN] [get_bd_pins spectrum_analyser/IPCORE_RESETN]

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
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m00_axis

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m10_axis


  # Create pins
  create_bd_pin -dir I -type clk m00_axis_aclk
  create_bd_pin -dir I -type rst m00_axis_aresetn
  create_bd_pin -dir I -type clk m10_axis_aclk
  create_bd_pin -dir I -type rst m10_axis_aresetn
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: axi_interconnect_ps, and set properties
  set axi_interconnect_ps [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_ps ]

  # Create instance: channel_00
  create_hier_cell_channel_00_1 $hier_obj channel_00

  # Create instance: channel_10
  create_hier_cell_channel_10 $hier_obj channel_10

  # Create interface connections
  connect_bd_intf_net -intf_net AXI4_Lite_1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_interconnect_ps/S00_AXI]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins m00_axis] [get_bd_intf_pins channel_00/m_axis]
  connect_bd_intf_net -intf_net S_AXI_1 [get_bd_intf_pins axi_interconnect_ps/M01_AXI] [get_bd_intf_pins channel_10/S_AXI]
  connect_bd_intf_net -intf_net S_AXI_2 [get_bd_intf_pins axi_interconnect_ps/M00_AXI] [get_bd_intf_pins channel_00/S_AXI]
  connect_bd_intf_net -intf_net axis_subset_converter_M_AXIS [get_bd_intf_pins m10_axis] [get_bd_intf_pins channel_10/m_axis]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins s_axi_aclk] [get_bd_pins axi_interconnect_ps/ACLK] [get_bd_pins axi_interconnect_ps/S00_ACLK]
  connect_bd_net -net ARESETN_1 [get_bd_pins s_axi_aresetn] [get_bd_pins axi_interconnect_ps/ARESETN] [get_bd_pins axi_interconnect_ps/S00_ARESETN]
  connect_bd_net -net M00_ACLK_1 [get_bd_pins m00_axis_aclk] [get_bd_pins axi_interconnect_ps/M00_ACLK] [get_bd_pins channel_00/s_axi_aclk]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins m00_axis_aresetn] [get_bd_pins axi_interconnect_ps/M00_ARESETN] [get_bd_pins channel_00/s_axi_aresetn]
  connect_bd_net -net rst_usp_rf_data_converter_256M_peripheral_aresetn [get_bd_pins m10_axis_aresetn] [get_bd_pins axi_interconnect_ps/M01_ARESETN] [get_bd_pins channel_10/s_axi_aresetn]
  connect_bd_net -net usp_rf_data_converter_clk_dac1 [get_bd_pins m10_axis_aclk] [get_bd_pins axi_interconnect_ps/M01_ACLK] [get_bd_pins channel_10/s_axi_aclk]

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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s00_axis_im

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s00_axis_re

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s20_axis_im

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s20_axis_re


  # Create pins
  create_bd_pin -dir I -type clk m_axi_aclk
  create_bd_pin -dir I -type rst m_axi_aresetn
  create_bd_pin -dir I -type clk s00_axis_aclk
  create_bd_pin -dir I -type rst s00_axis_aresetn
  create_bd_pin -dir I -type clk s20_axis_aclk
  create_bd_pin -dir I -type rst s20_axis_aresetn
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: channel_00
  create_hier_cell_channel_00 $hier_obj channel_00

  # Create instance: channel_20
  create_hier_cell_channel_20 $hier_obj channel_20

  # Create instance: m_axi_interconnect, and set properties
  set m_axi_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 m_axi_interconnect ]

  # Create instance: s_axi_interconnect, and set properties
  set s_axi_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 s_axi_interconnect ]
  set_property -dict [ list \
   CONFIG.M00_HAS_DATA_FIFO {2} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {2} \
   CONFIG.S00_HAS_DATA_FIFO {2} \
   CONFIG.S01_HAS_DATA_FIFO {2} \
   CONFIG.STRATEGY {2} \
 ] $s_axi_interconnect

  # Create interface connections
  connect_bd_intf_net -intf_net AXI4_Lite_1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins m_axi_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net S_AXI_1 [get_bd_intf_pins channel_20/S_AXI] [get_bd_intf_pins m_axi_interconnect/M01_AXI]
  connect_bd_intf_net -intf_net S_AXI_2 [get_bd_intf_pins channel_00/S_AXI] [get_bd_intf_pins m_axi_interconnect/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins M_AXI] [get_bd_intf_pins s_axi_interconnect/M00_AXI]
  connect_bd_intf_net -intf_net channel_00_M_AXI [get_bd_intf_pins channel_00/M_AXI] [get_bd_intf_pins s_axi_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net channel_0_M_AXI [get_bd_intf_pins channel_20/M_AXI] [get_bd_intf_pins s_axi_interconnect/S01_AXI]
  connect_bd_intf_net -intf_net s00_axis_im_1 [get_bd_intf_pins s00_axis_im] [get_bd_intf_pins channel_00/s_axis_im]
  connect_bd_intf_net -intf_net s00_axis_re_1 [get_bd_intf_pins s00_axis_re] [get_bd_intf_pins channel_00/s_axis_re]
  connect_bd_intf_net -intf_net s20_axis_im_1 [get_bd_intf_pins s20_axis_im] [get_bd_intf_pins channel_20/s_axis_im]
  connect_bd_intf_net -intf_net s20_axis_re_1 [get_bd_intf_pins s20_axis_re] [get_bd_intf_pins channel_20/s_axis_re]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins s_axi_aclk] [get_bd_pins channel_00/s_axi_aclk] [get_bd_pins channel_20/s_axi_aclk] [get_bd_pins m_axi_interconnect/ACLK] [get_bd_pins m_axi_interconnect/M00_ACLK] [get_bd_pins m_axi_interconnect/M01_ACLK] [get_bd_pins m_axi_interconnect/S00_ACLK]
  connect_bd_net -net ARESETN_1 [get_bd_pins s_axi_aresetn] [get_bd_pins channel_00/s_axi_aresetn] [get_bd_pins channel_20/s_axi_aresetn] [get_bd_pins m_axi_interconnect/ARESETN] [get_bd_pins m_axi_interconnect/M00_ARESETN] [get_bd_pins m_axi_interconnect/M01_ARESETN] [get_bd_pins m_axi_interconnect/S00_ARESETN]
  connect_bd_net -net IPCORE_RESETN_0_1 [get_bd_pins m_axi_aresetn] [get_bd_pins s_axi_interconnect/ARESETN] [get_bd_pins s_axi_interconnect/M00_ARESETN]
  connect_bd_net -net m_axis_aclk_0_1 [get_bd_pins m_axi_aclk] [get_bd_pins s_axi_interconnect/ACLK] [get_bd_pins s_axi_interconnect/M00_ACLK]
  connect_bd_net -net s00_axis_aclk_1 [get_bd_pins s00_axis_aclk] [get_bd_pins channel_00/s_axis_aclk] [get_bd_pins s_axi_interconnect/S00_ACLK]
  connect_bd_net -net s00_axis_aresetn_1 [get_bd_pins s00_axis_aresetn] [get_bd_pins channel_00/s_axis_aresetn] [get_bd_pins s_axi_interconnect/S00_ARESETN]
  connect_bd_net -net s20_axis_aclk_1 [get_bd_pins s20_axis_aclk] [get_bd_pins channel_20/s_axis_aclk] [get_bd_pins s_axi_interconnect/S01_ACLK]
  connect_bd_net -net s20_axis_aresetn_1 [get_bd_pins s20_axis_aresetn] [get_bd_pins channel_20/s_axis_aresetn] [get_bd_pins s_axi_interconnect/S01_ARESETN]

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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc0_clk

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc2_clk

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac0_clk

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac1_clk

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:display_usp_rf_data_converter:diff_pins_rtl:1.0 sysref_in

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin0_01

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin2_01

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout00

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout10


  # Create pins
  create_bd_pin -dir I -type rst ext_reset
  create_bd_pin -dir I -type clk m_axi_aclk
  create_bd_pin -dir I -type rst m_axi_aresetn
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: axi_interconnect_ps, and set properties
  set axi_interconnect_ps [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_ps ]
  set_property -dict [ list \
   CONFIG.NUM_MI {3} \
 ] $axi_interconnect_ps

  # Create instance: proc_sys_reset_adc0, and set properties
  set proc_sys_reset_adc0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_adc0 ]

  # Create instance: proc_sys_reset_adc2, and set properties
  set proc_sys_reset_adc2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_adc2 ]

  # Create instance: proc_sys_reset_dac0, and set properties
  set proc_sys_reset_dac0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_dac0 ]

  # Create instance: proc_sys_reset_dac1, and set properties
  set proc_sys_reset_dac1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_dac1 ]

  # Create instance: receiver
  create_hier_cell_receiver $hier_obj receiver

  # Create instance: rfdc, and set properties
  set rfdc [ create_bd_cell -type ip -vlnv xilinx.com:ip:usp_rf_data_converter:2.3 rfdc ]
  set_property -dict [ list \
   CONFIG.ADC0_Enable {1} \
   CONFIG.ADC0_Fabric_Freq {256.000} \
   CONFIG.ADC0_Outclk_Freq {256.000} \
   CONFIG.ADC0_PLL_Enable {true} \
   CONFIG.ADC0_Refclk_Freq {409.600} \
   CONFIG.ADC0_Sampling_Rate {4.096} \
   CONFIG.ADC2_Enable {1} \
   CONFIG.ADC2_Fabric_Freq {256.000} \
   CONFIG.ADC2_Outclk_Freq {256.000} \
   CONFIG.ADC2_PLL_Enable {true} \
   CONFIG.ADC2_Refclk_Freq {409.600} \
   CONFIG.ADC2_Sampling_Rate {4.096} \
   CONFIG.ADC_Data_Type00 {1} \
   CONFIG.ADC_Data_Type01 {1} \
   CONFIG.ADC_Data_Type20 {1} \
   CONFIG.ADC_Data_Type21 {1} \
   CONFIG.ADC_Data_Width00 {8} \
   CONFIG.ADC_Data_Width01 {8} \
   CONFIG.ADC_Decimation_Mode00 {2} \
   CONFIG.ADC_Decimation_Mode01 {2} \
   CONFIG.ADC_Decimation_Mode20 {2} \
   CONFIG.ADC_Decimation_Mode21 {2} \
   CONFIG.ADC_Mixer_Mode00 {0} \
   CONFIG.ADC_Mixer_Mode01 {0} \
   CONFIG.ADC_Mixer_Mode20 {0} \
   CONFIG.ADC_Mixer_Mode21 {0} \
   CONFIG.ADC_Mixer_Type00 {2} \
   CONFIG.ADC_Mixer_Type01 {2} \
   CONFIG.ADC_Mixer_Type20 {2} \
   CONFIG.ADC_Mixer_Type21 {2} \
   CONFIG.ADC_RESERVED_1_00 {false} \
   CONFIG.ADC_RESERVED_1_02 {false} \
   CONFIG.ADC_RESERVED_1_20 {false} \
   CONFIG.ADC_RESERVED_1_22 {false} \
   CONFIG.ADC_Slice00_Enable {true} \
   CONFIG.ADC_Slice01_Enable {true} \
   CONFIG.ADC_Slice20_Enable {true} \
   CONFIG.ADC_Slice21_Enable {true} \
   CONFIG.DAC0_Enable {1} \
   CONFIG.DAC0_Fabric_Freq {256.000} \
   CONFIG.DAC0_Outclk_Freq {256.000} \
   CONFIG.DAC0_PLL_Enable {true} \
   CONFIG.DAC0_Refclk_Freq {256.000} \
   CONFIG.DAC0_Sampling_Rate {4.096} \
   CONFIG.DAC1_Enable {1} \
   CONFIG.DAC1_Fabric_Freq {256.000} \
   CONFIG.DAC1_Outclk_Freq {256.000} \
   CONFIG.DAC1_PLL_Enable {true} \
   CONFIG.DAC1_Refclk_Freq {409.600} \
   CONFIG.DAC1_Sampling_Rate {4.096} \
   CONFIG.DAC_Data_Type10 {0} \
   CONFIG.DAC_Data_Width10 {16} \
   CONFIG.DAC_Interpolation_Mode00 {2} \
   CONFIG.DAC_Interpolation_Mode10 {2} \
   CONFIG.DAC_Mixer_Mode00 {0} \
   CONFIG.DAC_Mixer_Mode10 {0} \
   CONFIG.DAC_Mixer_Type00 {2} \
   CONFIG.DAC_Mixer_Type10 {2} \
   CONFIG.DAC_RESERVED_1_00 {false} \
   CONFIG.DAC_RESERVED_1_01 {false} \
   CONFIG.DAC_RESERVED_1_02 {false} \
   CONFIG.DAC_RESERVED_1_03 {false} \
   CONFIG.DAC_RESERVED_1_10 {false} \
   CONFIG.DAC_RESERVED_1_11 {false} \
   CONFIG.DAC_RESERVED_1_12 {false} \
   CONFIG.DAC_RESERVED_1_13 {false} \
   CONFIG.DAC_Slice00_Enable {true} \
   CONFIG.DAC_Slice10_Enable {true} \
 ] $rfdc

  # Create instance: transmitter
  create_hier_cell_transmitter $hier_obj transmitter

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins adc0_clk] [get_bd_intf_pins rfdc/adc0_clk]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins vin0_01] [get_bd_intf_pins rfdc/vin0_01]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins dac0_clk] [get_bd_intf_pins rfdc/dac0_clk]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins vout00] [get_bd_intf_pins rfdc/vout00]
  connect_bd_intf_net -intf_net SpectrumAnalyser_AXI4_Master [get_bd_intf_pins M_AXI] [get_bd_intf_pins receiver/M_AXI]
  connect_bd_intf_net -intf_net adc2_clk_1 [get_bd_intf_pins adc2_clk] [get_bd_intf_pins rfdc/adc2_clk]
  connect_bd_intf_net -intf_net axis_subset_converter_M_AXIS [get_bd_intf_pins rfdc/s10_axis] [get_bd_intf_pins transmitter/m10_axis]
  connect_bd_intf_net -intf_net dac1_clk_1 [get_bd_intf_pins dac1_clk] [get_bd_intf_pins rfdc/dac1_clk]
  connect_bd_intf_net -intf_net ps8_axi_periph_M00_AXI [get_bd_intf_pins axi_interconnect_ps/M00_AXI] [get_bd_intf_pins rfdc/s_axi]
  connect_bd_intf_net -intf_net ps8_axi_periph_M01_AXI [get_bd_intf_pins axi_interconnect_ps/M01_AXI] [get_bd_intf_pins transmitter/S_AXI]
  connect_bd_intf_net -intf_net ps8_axi_periph_M02_AXI [get_bd_intf_pins axi_interconnect_ps/M02_AXI] [get_bd_intf_pins receiver/S_AXI]
  connect_bd_intf_net -intf_net s00_axis_im_1 [get_bd_intf_pins receiver/s00_axis_im] [get_bd_intf_pins rfdc/m01_axis]
  connect_bd_intf_net -intf_net s00_axis_re_1 [get_bd_intf_pins receiver/s00_axis_re] [get_bd_intf_pins rfdc/m00_axis]
  connect_bd_intf_net -intf_net sysref_in_1 [get_bd_intf_pins sysref_in] [get_bd_intf_pins rfdc/sysref_in]
  connect_bd_intf_net -intf_net transmitter_m00_axis [get_bd_intf_pins rfdc/s00_axis] [get_bd_intf_pins transmitter/m00_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m20_axis [get_bd_intf_pins receiver/s20_axis_re] [get_bd_intf_pins rfdc/m20_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_m21_axis [get_bd_intf_pins receiver/s20_axis_im] [get_bd_intf_pins rfdc/m21_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_vout10 [get_bd_intf_pins vout10] [get_bd_intf_pins rfdc/vout10]
  connect_bd_intf_net -intf_net vin2_01_1 [get_bd_intf_pins vin2_01] [get_bd_intf_pins rfdc/vin2_01]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_M_AXI_HPM0_LPD [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_interconnect_ps/S00_AXI]

  # Create port connections
  connect_bd_net -net IPCORE_RESETN_0_1 [get_bd_pins m_axi_aresetn] [get_bd_pins receiver/m_axi_aresetn]
  connect_bd_net -net m_axis_aclk_0_1 [get_bd_pins m_axi_aclk] [get_bd_pins receiver/m_axi_aclk]
  connect_bd_net -net proc_sys_reset_adc3_peripheral_aresetn [get_bd_pins proc_sys_reset_adc0/peripheral_aresetn] [get_bd_pins receiver/s00_axis_aresetn] [get_bd_pins rfdc/m0_axis_aresetn]
  connect_bd_net -net proc_sys_reset_dac0_peripheral_aresetn [get_bd_pins proc_sys_reset_dac0/peripheral_aresetn] [get_bd_pins rfdc/s0_axis_aresetn] [get_bd_pins transmitter/m00_axis_aresetn]
  connect_bd_net -net proc_sys_reset_peripheral_aresetn [get_bd_pins proc_sys_reset_adc2/peripheral_aresetn] [get_bd_pins receiver/s20_axis_aresetn] [get_bd_pins rfdc/m2_axis_aresetn]
  connect_bd_net -net rfdc_clk_adc0 [get_bd_pins proc_sys_reset_adc0/slowest_sync_clk] [get_bd_pins receiver/s00_axis_aclk] [get_bd_pins rfdc/clk_adc0] [get_bd_pins rfdc/m0_axis_aclk]
  connect_bd_net -net rfdc_clk_dac0 [get_bd_pins proc_sys_reset_dac0/slowest_sync_clk] [get_bd_pins rfdc/clk_dac0] [get_bd_pins rfdc/s0_axis_aclk] [get_bd_pins transmitter/m00_axis_aclk]
  connect_bd_net -net rst_ps8_96M_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins axi_interconnect_ps/ARESETN] [get_bd_pins axi_interconnect_ps/M00_ARESETN] [get_bd_pins axi_interconnect_ps/M01_ARESETN] [get_bd_pins axi_interconnect_ps/M02_ARESETN] [get_bd_pins axi_interconnect_ps/S00_ARESETN] [get_bd_pins receiver/s_axi_aresetn] [get_bd_pins rfdc/s_axi_aresetn] [get_bd_pins transmitter/s_axi_aresetn]
  connect_bd_net -net rst_usp_rf_data_converter_256M_peripheral_aresetn [get_bd_pins proc_sys_reset_dac1/peripheral_aresetn] [get_bd_pins rfdc/s1_axis_aresetn] [get_bd_pins transmitter/m10_axis_aresetn]
  connect_bd_net -net usp_rf_data_converter_clk_adc2 [get_bd_pins proc_sys_reset_adc2/slowest_sync_clk] [get_bd_pins receiver/s20_axis_aclk] [get_bd_pins rfdc/clk_adc2] [get_bd_pins rfdc/m2_axis_aclk]
  connect_bd_net -net usp_rf_data_converter_clk_dac1 [get_bd_pins proc_sys_reset_dac1/slowest_sync_clk] [get_bd_pins rfdc/clk_dac1] [get_bd_pins rfdc/s1_axis_aclk] [get_bd_pins transmitter/m10_axis_aclk]
  connect_bd_net -net zynq_ultra_ps_e_pl_clk0 [get_bd_pins s_axi_aclk] [get_bd_pins axi_interconnect_ps/ACLK] [get_bd_pins axi_interconnect_ps/M00_ACLK] [get_bd_pins axi_interconnect_ps/M01_ACLK] [get_bd_pins axi_interconnect_ps/M02_ACLK] [get_bd_pins axi_interconnect_ps/S00_ACLK] [get_bd_pins receiver/s_axi_aclk] [get_bd_pins rfdc/s_axi_aclk] [get_bd_pins transmitter/s_axi_aclk]
  connect_bd_net -net zynq_ultra_ps_e_pl_resetn0 [get_bd_pins ext_reset] [get_bd_pins proc_sys_reset_adc0/ext_reset_in] [get_bd_pins proc_sys_reset_adc2/ext_reset_in] [get_bd_pins proc_sys_reset_dac0/ext_reset_in] [get_bd_pins proc_sys_reset_dac1/ext_reset_in]

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
   CONFIG.FREQ_HZ {409600000.0} \
   ] $adc0_clk

  set adc2_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc2_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {409600000.0} \
   ] $adc2_clk

  set dac0_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac0_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {256000000.0} \
   ] $dac0_clk

  set dac1_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac1_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {409600000.0} \
   ] $dac1_clk

  set sys_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $sys_clk

  set sysref_in [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_usp_rf_data_converter:diff_pins_rtl:1.0 sysref_in ]

  set vin0_01 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin0_01 ]

  set vin2_01 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin2_01 ]

  set vout00 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout00 ]

  set vout10 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout10 ]


  # Create ports
  set lmk_reset [ create_bd_port -dir O -from 0 -to 0 lmk_reset ]

  # Create instance: axi_smc, and set properties
  set axi_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc ]
  set_property -dict [ list \
   CONFIG.NUM_SI {1} \
 ] $axi_smc

  # Create instance: clk_wiz_256M, and set properties
  set clk_wiz_256M [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_256M ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {50.0} \
   CONFIG.CLKOUT1_JITTER {133.468} \
   CONFIG.CLKOUT1_PHASE_ERROR {176.321} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {256} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {28.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {5.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {4.375} \
   CONFIG.MMCM_DIVCLK_DIVIDE {5} \
   CONFIG.PRIM_IN_FREQ {200} \
   CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
   CONFIG.USE_RESET {false} \
 ] $clk_wiz_256M

  # Create instance: lmk_reset_low, and set properties
  set lmk_reset_low [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 lmk_reset_low ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $lmk_reset_low

  # Create instance: radio
  create_hier_cell_radio [current_bd_instance .] radio

  # Create instance: rst_ps8_100M, and set properties
  set rst_ps8_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps8_100M ]

  # Create instance: rst_ps8_256M, and set properties
  set rst_ps8_256M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps8_256M ]

  # Create instance: zynq_ultra_ps_e, and set properties
  set zynq_ultra_ps_e [ create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_ultra_ps_e ]
  set_property -dict [ list \
   CONFIG.PSU_DDR_RAM_HIGHADDR {0x7FFFFFFF} \
   CONFIG.PSU_DDR_RAM_HIGHADDR_OFFSET {0x00000002} \
   CONFIG.PSU_DDR_RAM_LOWADDR_OFFSET {0x80000000} \
   CONFIG.PSU__ACT_DDR_FREQ_MHZ {799.992004} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__ACT_FREQMHZ {1333.320068} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FBDIV {80} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__ACT_FREQMHZ {399.996002} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__ACT_FREQMHZ {599.994019} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {72} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR0 {63} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR1 {10} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__ACT_FREQMHZ {599.994019} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FBDIV {64} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__ACT_FREQMHZ {49.999500} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR0 {20} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__DLL_REF_CTRL__ACT_FREQMHZ {999.989990} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FBDIV {60} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__ACT_FREQMHZ {266.664001} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__DIVISOR0 {10} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__ACT_FREQMHZ {199.998001} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {10} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__ACT_FREQMHZ {299.997009} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FBDIV {64} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__ACT_FREQMHZ {33.333000} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR1 {15} \
   CONFIG.PSU__DDR_HIGH_ADDRESS_GUI_ENABLE {0} \
   CONFIG.PSU__FPGA_PL1_ENABLE {0} \
   CONFIG.PSU__HIGH_ADDRESS__ENABLE {0} \
   CONFIG.PSU__PL_CLK1_BUF {FALSE} \
   CONFIG.PSU__PROTECTION__MASTERS {USB1:NonSecure;0|USB0:NonSecure;0|S_AXI_LPD:NA;0|S_AXI_HPC1_FPD:NA;0|S_AXI_HPC0_FPD:NA;0|S_AXI_HP3_FPD:NA;0|S_AXI_HP2_FPD:NA;1|S_AXI_HP1_FPD:NA;0|S_AXI_HP0_FPD:NA;0|S_AXI_ACP:NA;0|S_AXI_ACE:NA;0|SD1:NonSecure;0|SD0:NonSecure;0|SATA1:NonSecure;0|SATA0:NonSecure;0|RPU1:Secure;1|RPU0:Secure;1|QSPI:NonSecure;0|PMU:NA;1|PCIe:NonSecure;0|NAND:NonSecure;0|LDMA:NonSecure;1|GPU:NonSecure;1|GEM3:NonSecure;0|GEM2:NonSecure;0|GEM1:NonSecure;0|GEM0:NonSecure;0|FDMA:NonSecure;1|DP:NonSecure;0|DAP:NA;1|Coresight:NA;1|CSU:NA;1|APU:NA;1} \
   CONFIG.PSU__PROTECTION__SLAVES {LPD;USB3_1_XHCI;FE300000;FE3FFFFF;0|LPD;USB3_1;FF9E0000;FF9EFFFF;0|LPD;USB3_0_XHCI;FE200000;FE2FFFFF;0|LPD;USB3_0;FF9D0000;FF9DFFFF;0|LPD;UART1;FF010000;FF01FFFF;0|LPD;UART0;FF000000;FF00FFFF;0|LPD;TTC3;FF140000;FF14FFFF;0|LPD;TTC2;FF130000;FF13FFFF;0|LPD;TTC1;FF120000;FF12FFFF;0|LPD;TTC0;FF110000;FF11FFFF;0|FPD;SWDT1;FD4D0000;FD4DFFFF;0|LPD;SWDT0;FF150000;FF15FFFF;0|LPD;SPI1;FF050000;FF05FFFF;0|LPD;SPI0;FF040000;FF04FFFF;0|FPD;SMMU_REG;FD5F0000;FD5FFFFF;1|FPD;SMMU;FD800000;FDFFFFFF;1|FPD;SIOU;FD3D0000;FD3DFFFF;1|FPD;SERDES;FD400000;FD47FFFF;1|LPD;SD1;FF170000;FF17FFFF;0|LPD;SD0;FF160000;FF16FFFF;0|FPD;SATA;FD0C0000;FD0CFFFF;0|LPD;RTC;FFA60000;FFA6FFFF;1|LPD;RSA_CORE;FFCE0000;FFCEFFFF;1|LPD;RPU;FF9A0000;FF9AFFFF;1|LPD;R5_TCM_RAM_GLOBAL;FFE00000;FFE3FFFF;1|LPD;R5_1_Instruction_Cache;FFEC0000;FFECFFFF;1|LPD;R5_1_Data_Cache;FFED0000;FFEDFFFF;1|LPD;R5_1_BTCM_GLOBAL;FFEB0000;FFEBFFFF;1|LPD;R5_1_ATCM_GLOBAL;FFE90000;FFE9FFFF;1|LPD;R5_0_Instruction_Cache;FFE40000;FFE4FFFF;1|LPD;R5_0_Data_Cache;FFE50000;FFE5FFFF;1|LPD;R5_0_BTCM_GLOBAL;FFE20000;FFE2FFFF;1|LPD;R5_0_ATCM_GLOBAL;FFE00000;FFE0FFFF;1|LPD;QSPI_Linear_Address;C0000000;DFFFFFFF;1|LPD;QSPI;FF0F0000;FF0FFFFF;0|LPD;PMU_RAM;FFDC0000;FFDDFFFF;1|LPD;PMU_GLOBAL;FFD80000;FFDBFFFF;1|FPD;PCIE_MAIN;FD0E0000;FD0EFFFF;0|FPD;PCIE_LOW;E0000000;EFFFFFFF;0|FPD;PCIE_HIGH2;8000000000;BFFFFFFFFF;0|FPD;PCIE_HIGH1;600000000;7FFFFFFFF;0|FPD;PCIE_DMA;FD0F0000;FD0FFFFF;0|FPD;PCIE_ATTRIB;FD480000;FD48FFFF;0|LPD;OCM_XMPU_CFG;FFA70000;FFA7FFFF;1|LPD;OCM_SLCR;FF960000;FF96FFFF;1|OCM;OCM;FFFC0000;FFFFFFFF;1|LPD;NAND;FF100000;FF10FFFF;0|LPD;MBISTJTAG;FFCF0000;FFCFFFFF;1|LPD;LPD_XPPU_SINK;FF9C0000;FF9CFFFF;1|LPD;LPD_XPPU;FF980000;FF98FFFF;1|LPD;LPD_SLCR_SECURE;FF4B0000;FF4DFFFF;1|LPD;LPD_SLCR;FF410000;FF4AFFFF;1|LPD;LPD_GPV;FE100000;FE1FFFFF;1|LPD;LPD_DMA_7;FFAF0000;FFAFFFFF;1|LPD;LPD_DMA_6;FFAE0000;FFAEFFFF;1|LPD;LPD_DMA_5;FFAD0000;FFADFFFF;1|LPD;LPD_DMA_4;FFAC0000;FFACFFFF;1|LPD;LPD_DMA_3;FFAB0000;FFABFFFF;1|LPD;LPD_DMA_2;FFAA0000;FFAAFFFF;1|LPD;LPD_DMA_1;FFA90000;FFA9FFFF;1|LPD;LPD_DMA_0;FFA80000;FFA8FFFF;1|LPD;IPI_CTRL;FF380000;FF3FFFFF;1|LPD;IOU_SLCR;FF180000;FF23FFFF;1|LPD;IOU_SECURE_SLCR;FF240000;FF24FFFF;1|LPD;IOU_SCNTRS;FF260000;FF26FFFF;1|LPD;IOU_SCNTR;FF250000;FF25FFFF;1|LPD;IOU_GPV;FE000000;FE0FFFFF;1|LPD;I2C1;FF030000;FF03FFFF;0|LPD;I2C0;FF020000;FF02FFFF;0|FPD;GPU;FD4B0000;FD4BFFFF;0|LPD;GPIO;FF0A0000;FF0AFFFF;1|LPD;GEM3;FF0E0000;FF0EFFFF;0|LPD;GEM2;FF0D0000;FF0DFFFF;0|LPD;GEM1;FF0C0000;FF0CFFFF;0|LPD;GEM0;FF0B0000;FF0BFFFF;0|FPD;FPD_XMPU_SINK;FD4F0000;FD4FFFFF;1|FPD;FPD_XMPU_CFG;FD5D0000;FD5DFFFF;1|FPD;FPD_SLCR_SECURE;FD690000;FD6CFFFF;1|FPD;FPD_SLCR;FD610000;FD68FFFF;1|FPD;FPD_GPV;FD700000;FD7FFFFF;1|FPD;FPD_DMA_CH7;FD570000;FD57FFFF;1|FPD;FPD_DMA_CH6;FD560000;FD56FFFF;1|FPD;FPD_DMA_CH5;FD550000;FD55FFFF;1|FPD;FPD_DMA_CH4;FD540000;FD54FFFF;1|FPD;FPD_DMA_CH3;FD530000;FD53FFFF;1|FPD;FPD_DMA_CH2;FD520000;FD52FFFF;1|FPD;FPD_DMA_CH1;FD510000;FD51FFFF;1|FPD;FPD_DMA_CH0;FD500000;FD50FFFF;1|LPD;EFUSE;FFCC0000;FFCCFFFF;1|FPD;Display Port;FD4A0000;FD4AFFFF;0|FPD;DPDMA;FD4C0000;FD4CFFFF;0|FPD;DDR_XMPU5_CFG;FD050000;FD05FFFF;1|FPD;DDR_XMPU4_CFG;FD040000;FD04FFFF;1|FPD;DDR_XMPU3_CFG;FD030000;FD03FFFF;1|FPD;DDR_XMPU2_CFG;FD020000;FD02FFFF;1|FPD;DDR_XMPU1_CFG;FD010000;FD01FFFF;1|FPD;DDR_XMPU0_CFG;FD000000;FD00FFFF;1|FPD;DDR_QOS_CTRL;FD090000;FD09FFFF;1|FPD;DDR_PHY;FD080000;FD08FFFF;1|DDR;DDR_LOW;0;7FFFFFFF;1|DDR;DDR_HIGH;800000000;800000000;0|FPD;DDDR_CTRL;FD070000;FD070FFF;1|LPD;Coresight;FE800000;FEFFFFFF;1|LPD;CSU_DMA;FFC80000;FFC9FFFF;1|LPD;CSU;FFCA0000;FFCAFFFF;1|LPD;CRL_APB;FF5E0000;FF85FFFF;1|FPD;CRF_APB;FD1A0000;FD2DFFFF;1|FPD;CCI_REG;FD5E0000;FD5EFFFF;1|FPD;CCI_GPV;FD6E0000;FD6EFFFF;1|LPD;CAN1;FF070000;FF07FFFF;0|LPD;CAN0;FF060000;FF06FFFF;0|FPD;APU;FD5C0000;FD5CFFFF;1|LPD;APM_INTC_IOU;FFA20000;FFA2FFFF;1|LPD;APM_FPD_LPD;FFA30000;FFA3FFFF;1|FPD;APM_5;FD490000;FD49FFFF;1|FPD;APM_0;FD0B0000;FD0BFFFF;1|LPD;APM2;FFA10000;FFA1FFFF;1|LPD;APM1;FFA00000;FFA0FFFF;1|LPD;AMS;FFA50000;FFA5FFFF;1|FPD;AFI_5;FD3B0000;FD3BFFFF;1|FPD;AFI_4;FD3A0000;FD3AFFFF;1|FPD;AFI_3;FD390000;FD39FFFF;1|FPD;AFI_2;FD380000;FD38FFFF;1|FPD;AFI_1;FD370000;FD37FFFF;1|FPD;AFI_0;FD360000;FD36FFFF;1|LPD;AFIFM6;FF9B0000;FF9BFFFF;1|FPD;ACPU_GIC;F9010000;F907FFFF;1} \
   CONFIG.PSU__SAXIGP4__DATA_WIDTH {128} \
   CONFIG.PSU__USE__S_AXI_GP4 {1} \
 ] $zynq_ultra_ps_e

  # Create interface connections
  connect_bd_intf_net -intf_net SpectrumAnalyser_AXI4_Master [get_bd_intf_pins axi_smc/S00_AXI] [get_bd_intf_pins radio/M_AXI]
  connect_bd_intf_net -intf_net adc0_clk_1 [get_bd_intf_ports adc0_clk] [get_bd_intf_pins radio/adc0_clk]
  connect_bd_intf_net -intf_net adc2_clk_1 [get_bd_intf_ports adc2_clk] [get_bd_intf_pins radio/adc2_clk]
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e/S_AXI_HP2_FPD]
  connect_bd_intf_net -intf_net dac0_clk_1 [get_bd_intf_ports dac0_clk] [get_bd_intf_pins radio/dac0_clk]
  connect_bd_intf_net -intf_net dac1_clk_1 [get_bd_intf_ports dac1_clk] [get_bd_intf_pins radio/dac1_clk]
  connect_bd_intf_net -intf_net diff_clock_rtl_0_1 [get_bd_intf_ports sys_clk] [get_bd_intf_pins clk_wiz_256M/CLK_IN1_D]
  connect_bd_intf_net -intf_net radio_vout00 [get_bd_intf_ports vout00] [get_bd_intf_pins radio/vout00]
  connect_bd_intf_net -intf_net sysref_in_1 [get_bd_intf_ports sysref_in] [get_bd_intf_pins radio/sysref_in]
  connect_bd_intf_net -intf_net usp_rf_data_converter_vout10 [get_bd_intf_ports vout10] [get_bd_intf_pins radio/vout10]
  connect_bd_intf_net -intf_net vin0_01_1 [get_bd_intf_ports vin0_01] [get_bd_intf_pins radio/vin0_01]
  connect_bd_intf_net -intf_net vin2_01_1 [get_bd_intf_ports vin2_01] [get_bd_intf_pins radio/vin2_01]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_M_AXI_HPM0_LPD [get_bd_intf_pins radio/S_AXI] [get_bd_intf_pins zynq_ultra_ps_e/M_AXI_HPM0_LPD]

  # Create port connections
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_256M/locked] [get_bd_pins rst_ps8_256M/dcm_locked]
  connect_bd_net -net clk_wiz_260M_clk_out1 [get_bd_pins axi_smc/aclk] [get_bd_pins clk_wiz_256M/clk_out1] [get_bd_pins radio/m_axi_aclk] [get_bd_pins rst_ps8_256M/slowest_sync_clk] [get_bd_pins zynq_ultra_ps_e/saxihp2_fpd_aclk]
  connect_bd_net -net lmk_reset_low_dout [get_bd_ports lmk_reset] [get_bd_pins lmk_reset_low/dout]
  connect_bd_net -net rst_ps8_260M_peripheral_aresetn [get_bd_pins axi_smc/aresetn] [get_bd_pins radio/m_axi_aresetn] [get_bd_pins rst_ps8_256M/peripheral_aresetn]
  connect_bd_net -net rst_ps8_96M_peripheral_aresetn [get_bd_pins radio/s_axi_aresetn] [get_bd_pins rst_ps8_100M/peripheral_aresetn]
  connect_bd_net -net zynq_ultra_ps_e_pl_clk0 [get_bd_pins radio/s_axi_aclk] [get_bd_pins rst_ps8_100M/slowest_sync_clk] [get_bd_pins zynq_ultra_ps_e/maxihpm0_lpd_aclk] [get_bd_pins zynq_ultra_ps_e/pl_clk0]
  connect_bd_net -net zynq_ultra_ps_e_pl_resetn0 [get_bd_pins radio/ext_reset] [get_bd_pins rst_ps8_100M/ext_reset_in] [get_bd_pins rst_ps8_256M/ext_reset_in] [get_bd_pins zynq_ultra_ps_e/pl_resetn0]

  # Create address segments
  assign_bd_address -offset 0x80090000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/transmitter/channel_00/control/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0x80040000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_00/decimator/xsg_bwselector_s_axi/reg0] -force
  assign_bd_address -offset 0x80070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_20/decimator/xsg_bwselector_s_axi/reg0] -force
  assign_bd_address -offset 0x80080000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/transmitter/channel_10/control/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0x80050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_00/spectrum_analyser/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0x80060000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/receiver/channel_20/spectrum_analyser/AXI4_Lite/reg0] -force
  assign_bd_address -offset 0x80000000 -range 0x00040000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e/Data] [get_bd_addr_segs radio/rfdc/s_axi/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_00/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_00/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_LPS_OCM] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_20/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces radio/receiver/channel_20/spectrum_analyser/AXI4_Master] [get_bd_addr_segs zynq_ultra_ps_e/SAXIGP4/HP2_LPS_OCM] -force


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


