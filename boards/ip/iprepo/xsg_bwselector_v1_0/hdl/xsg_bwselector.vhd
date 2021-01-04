-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/AXI-Stream Master Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_axi_stream_master_interface is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in : in std_logic_vector( 128-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in : in std_logic_vector( 128-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_im_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_re_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_axi_stream_master_interface;
architecture structural of xsg_bwselector_axi_stream_master_interface is 
  signal register1_q_net : std_logic_vector( 128-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 128-1 downto 0 );
  signal ce_net : std_logic;
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
begin
  mux_y_net <= re_valid_in;
  mux1_y_net <= re_data_in;
  mux2_y_net <= im_valid_in;
  mux3_y_net <= im_data_in;
  m_axis_im_tdata <= register3_q_net;
  m_axis_im_tvalid <= register2_q_net;
  m_axis_re_tdata <= register1_q_net;
  m_axis_re_tvalid <= register_q_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 128,
    init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux1_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 128,
    init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux3_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register3_q_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/AXI-Stream Slave Interface/Scalar2Vector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_scalar2vector is
  port (
    i : in std_logic_vector( 128-1 downto 0 );
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 );
    o_3 : out std_logic_vector( 16-1 downto 0 );
    o_4 : out std_logic_vector( 16-1 downto 0 );
    o_5 : out std_logic_vector( 16-1 downto 0 );
    o_6 : out std_logic_vector( 16-1 downto 0 );
    o_7 : out std_logic_vector( 16-1 downto 0 );
    o_8 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_scalar2vector;
architecture structural of xsg_bwselector_scalar2vector is 
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice6_y_net : std_logic_vector( 16-1 downto 0 );
  signal register1_q_net : std_logic_vector( 128-1 downto 0 );
  signal slice2_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice4_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice3_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice7_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice5_y_net : std_logic_vector( 16-1 downto 0 );
begin
  o_1 <= slice0_y_net;
  o_2 <= slice1_y_net;
  o_3 <= slice2_y_net;
  o_4 <= slice3_y_net;
  o_5 <= slice4_y_net;
  o_6 <= slice5_y_net;
  o_7 <= slice6_y_net;
  o_8 <= slice7_y_net;
  register1_q_net <= i;
  slice0 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register1_q_net,
    y => slice0_y_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register1_q_net,
    y => slice1_y_net
  );
  slice2 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 32,
    new_msb => 47,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register1_q_net,
    y => slice2_y_net
  );
  slice3 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 48,
    new_msb => 63,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register1_q_net,
    y => slice3_y_net
  );
  slice4 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 64,
    new_msb => 79,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register1_q_net,
    y => slice4_y_net
  );
  slice5 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 80,
    new_msb => 95,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register1_q_net,
    y => slice5_y_net
  );
  slice6 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 96,
    new_msb => 111,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register1_q_net,
    y => slice6_y_net
  );
  slice7 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 112,
    new_msb => 127,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register1_q_net,
    y => slice7_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/AXI-Stream Slave Interface/Scalar2Vector1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_scalar2vector1 is
  port (
    i : in std_logic_vector( 128-1 downto 0 );
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 );
    o_3 : out std_logic_vector( 16-1 downto 0 );
    o_4 : out std_logic_vector( 16-1 downto 0 );
    o_5 : out std_logic_vector( 16-1 downto 0 );
    o_6 : out std_logic_vector( 16-1 downto 0 );
    o_7 : out std_logic_vector( 16-1 downto 0 );
    o_8 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_scalar2vector1;
architecture structural of xsg_bwselector_scalar2vector1 is 
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice2_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice5_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice6_y_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 128-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice4_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice3_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice7_y_net : std_logic_vector( 16-1 downto 0 );
begin
  o_1 <= slice0_y_net;
  o_2 <= slice1_y_net;
  o_3 <= slice2_y_net;
  o_4 <= slice3_y_net;
  o_5 <= slice4_y_net;
  o_6 <= slice5_y_net;
  o_7 <= slice6_y_net;
  o_8 <= slice7_y_net;
  register_q_net <= i;
  slice0 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register_q_net,
    y => slice0_y_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
  slice2 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 32,
    new_msb => 47,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register_q_net,
    y => slice2_y_net
  );
  slice3 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 48,
    new_msb => 63,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register_q_net,
    y => slice3_y_net
  );
  slice4 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 64,
    new_msb => 79,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register_q_net,
    y => slice4_y_net
  );
  slice5 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 80,
    new_msb => 95,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register_q_net,
    y => slice5_y_net
  );
  slice6 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 96,
    new_msb => 111,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register_q_net,
    y => slice6_y_net
  );
  slice7 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 112,
    new_msb => 127,
    x_width => 128,
    y_width => 16
  )
  port map (
    x => register_q_net,
    y => slice7_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/AXI-Stream Slave Interface/Vector Reinterpret
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    in_3 : in std_logic_vector( 16-1 downto 0 );
    in_4 : in std_logic_vector( 16-1 downto 0 );
    in_5 : in std_logic_vector( 16-1 downto 0 );
    in_6 : in std_logic_vector( 16-1 downto 0 );
    in_7 : in std_logic_vector( 16-1 downto 0 );
    in_8 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 );
    out_3 : out std_logic_vector( 16-1 downto 0 );
    out_4 : out std_logic_vector( 16-1 downto 0 );
    out_5 : out std_logic_vector( 16-1 downto 0 );
    out_6 : out std_logic_vector( 16-1 downto 0 );
    out_7 : out std_logic_vector( 16-1 downto 0 );
    out_8 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret;
architecture structural of xsg_bwselector_vector_reinterpret is 
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice2_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice3_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice4_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice5_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice6_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice7_y_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  out_3 <= reinterpret2_output_port_net;
  out_4 <= reinterpret3_output_port_net;
  out_5 <= reinterpret4_output_port_net;
  out_6 <= reinterpret5_output_port_net;
  out_7 <= reinterpret6_output_port_net;
  out_8 <= reinterpret7_output_port_net;
  slice0_y_net <= in_1;
  slice1_y_net <= in_2;
  slice2_y_net <= in_3;
  slice3_y_net <= in_4;
  slice4_y_net <= in_5;
  slice5_y_net <= in_6;
  slice6_y_net <= in_7;
  slice7_y_net <= in_8;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice0_y_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice2_y_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice3_y_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice4_y_net,
    output_port => reinterpret4_output_port_net
  );
  reinterpret5 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice5_y_net,
    output_port => reinterpret5_output_port_net
  );
  reinterpret6 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice6_y_net,
    output_port => reinterpret6_output_port_net
  );
  reinterpret7 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice7_y_net,
    output_port => reinterpret7_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/AXI-Stream Slave Interface/Vector Reinterpret1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret1 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    in_3 : in std_logic_vector( 16-1 downto 0 );
    in_4 : in std_logic_vector( 16-1 downto 0 );
    in_5 : in std_logic_vector( 16-1 downto 0 );
    in_6 : in std_logic_vector( 16-1 downto 0 );
    in_7 : in std_logic_vector( 16-1 downto 0 );
    in_8 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 );
    out_3 : out std_logic_vector( 16-1 downto 0 );
    out_4 : out std_logic_vector( 16-1 downto 0 );
    out_5 : out std_logic_vector( 16-1 downto 0 );
    out_6 : out std_logic_vector( 16-1 downto 0 );
    out_7 : out std_logic_vector( 16-1 downto 0 );
    out_8 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret1;
architecture structural of xsg_bwselector_vector_reinterpret1 is 
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice7_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice2_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice6_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice3_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice5_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice4_y_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  out_3 <= reinterpret2_output_port_net;
  out_4 <= reinterpret3_output_port_net;
  out_5 <= reinterpret4_output_port_net;
  out_6 <= reinterpret5_output_port_net;
  out_7 <= reinterpret6_output_port_net;
  out_8 <= reinterpret7_output_port_net;
  slice0_y_net <= in_1;
  slice1_y_net <= in_2;
  slice2_y_net <= in_3;
  slice3_y_net <= in_4;
  slice4_y_net <= in_5;
  slice5_y_net <= in_6;
  slice6_y_net <= in_7;
  slice7_y_net <= in_8;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice0_y_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice2_y_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice3_y_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice4_y_net,
    output_port => reinterpret4_output_port_net
  );
  reinterpret5 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice5_y_net,
    output_port => reinterpret5_output_port_net
  );
  reinterpret6 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice6_y_net,
    output_port => reinterpret6_output_port_net
  );
  reinterpret7 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice7_y_net,
    output_port => reinterpret7_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/AXI-Stream Slave Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_axi_stream_slave_interface is
  port (
    s_axis_im_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic_vector( 1-1 downto 0 );
    re_data_out_1 : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic_vector( 1-1 downto 0 );
    im_data_out_1 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_2 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_3 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_4 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_5 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_6 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_7 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_8 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_2 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_3 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_4 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_5 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_6 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_7 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_8 : out std_logic_vector( 16-1 downto 0 );
    s_axis_im_tready : out std_logic_vector( 1-1 downto 0 );
    s_axis_re_tready : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_axi_stream_slave_interface;
architecture structural of xsg_bwselector_axi_stream_slave_interface is 
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_re_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice2_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice5_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice6_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal s_axis_re_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal slice5_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice2_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice3_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal slice6_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 128-1 downto 0 );
  signal slice7_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice7_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice4_y_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_im_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret5_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret6_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal s_axis_im_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal slice1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice3_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register1_q_net : std_logic_vector( 128-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice4_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
begin
  re_valid_out <= register3_q_net;
  re_data_out_1 <= reinterpret0_output_port_net_x0;
  im_valid_out <= register2_q_net;
  im_data_out_1 <= reinterpret0_output_port_net;
  re_data_out_2 <= reinterpret1_output_port_net_x0;
  re_data_out_3 <= reinterpret2_output_port_net_x0;
  re_data_out_4 <= reinterpret3_output_port_net_x0;
  re_data_out_5 <= reinterpret4_output_port_net_x0;
  re_data_out_6 <= reinterpret5_output_port_net_x0;
  re_data_out_7 <= reinterpret6_output_port_net_x0;
  re_data_out_8 <= reinterpret7_output_port_net;
  im_data_out_2 <= reinterpret1_output_port_net;
  im_data_out_3 <= reinterpret2_output_port_net;
  im_data_out_4 <= reinterpret3_output_port_net;
  im_data_out_5 <= reinterpret4_output_port_net;
  im_data_out_6 <= reinterpret5_output_port_net;
  im_data_out_7 <= reinterpret6_output_port_net;
  im_data_out_8 <= reinterpret7_output_port_net_x0;
  s_axis_im_tdata_net <= s_axis_im_tdata;
  s_axis_im_tready <= constant_op_net;
  s_axis_im_tvalid_net <= s_axis_im_tvalid;
  s_axis_re_tdata_net <= s_axis_re_tdata;
  s_axis_re_tready <= constant_op_net;
  s_axis_re_tvalid_net <= s_axis_re_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  scalar2vector : entity xil_defaultlib.xsg_bwselector_scalar2vector 
  port map (
    i => register1_q_net,
    o_1 => slice0_y_net_x0,
    o_2 => slice1_y_net_x0,
    o_3 => slice2_y_net_x0,
    o_4 => slice3_y_net_x0,
    o_5 => slice4_y_net_x0,
    o_6 => slice5_y_net_x0,
    o_7 => slice6_y_net_x0,
    o_8 => slice7_y_net_x0
  );
  scalar2vector1 : entity xil_defaultlib.xsg_bwselector_scalar2vector1 
  port map (
    i => register_q_net,
    o_1 => slice0_y_net,
    o_2 => slice1_y_net,
    o_3 => slice2_y_net,
    o_4 => slice3_y_net,
    o_5 => slice4_y_net,
    o_6 => slice5_y_net,
    o_7 => slice6_y_net,
    o_8 => slice7_y_net
  );
  vector_reinterpret : entity xil_defaultlib.xsg_bwselector_vector_reinterpret 
  port map (
    in_1 => slice0_y_net_x0,
    in_2 => slice1_y_net_x0,
    in_3 => slice2_y_net_x0,
    in_4 => slice3_y_net_x0,
    in_5 => slice4_y_net_x0,
    in_6 => slice5_y_net_x0,
    in_7 => slice6_y_net_x0,
    in_8 => slice7_y_net_x0,
    out_1 => reinterpret0_output_port_net_x0,
    out_2 => reinterpret1_output_port_net_x0,
    out_3 => reinterpret2_output_port_net_x0,
    out_4 => reinterpret3_output_port_net_x0,
    out_5 => reinterpret4_output_port_net_x0,
    out_6 => reinterpret5_output_port_net_x0,
    out_7 => reinterpret6_output_port_net_x0,
    out_8 => reinterpret7_output_port_net
  );
  vector_reinterpret1 : entity xil_defaultlib.xsg_bwselector_vector_reinterpret1 
  port map (
    in_1 => slice0_y_net,
    in_2 => slice1_y_net,
    in_3 => slice2_y_net,
    in_4 => slice3_y_net,
    in_5 => slice4_y_net,
    in_6 => slice5_y_net,
    in_7 => slice6_y_net,
    in_8 => slice7_y_net,
    out_1 => reinterpret0_output_port_net,
    out_2 => reinterpret1_output_port_net,
    out_3 => reinterpret2_output_port_net,
    out_4 => reinterpret3_output_port_net,
    out_5 => reinterpret4_output_port_net,
    out_6 => reinterpret5_output_port_net,
    out_7 => reinterpret6_output_port_net,
    out_8 => reinterpret7_output_port_net_x0
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_861c8eb41f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 128,
    init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_im_tdata_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 128,
    init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_re_tdata_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_im_tvalid_net,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_re_tvalid_net,
    clk => clk_net,
    ce => ce_net,
    q => register3_q_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 0/Vector Convert
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_convert is
  port (
    i_1 : in std_logic_vector( 32-1 downto 0 );
    i_2 : in std_logic_vector( 32-1 downto 0 );
    i_3 : in std_logic_vector( 32-1 downto 0 );
    i_4 : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 );
    o_3 : out std_logic_vector( 16-1 downto 0 );
    o_4 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_convert;
architecture structural of xsg_bwselector_vector_convert is 
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect3_net : std_logic_vector( 32-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect2_net : std_logic_vector( 32-1 downto 0 );
begin
  o_1 <= convert0_dout_net;
  o_2 <= convert1_dout_net;
  o_3 <= convert2_dout_net;
  o_4 <= convert3_dout_net;
  fir_compiler_7_2_m_axis_data_tdata_vect0_net <= i_1;
  fir_compiler_7_2_m_axis_data_tdata_vect1_net <= i_2;
  fir_compiler_7_2_m_axis_data_tdata_vect2_net <= i_3;
  fir_compiler_7_2_m_axis_data_tdata_vect3_net <= i_4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  convert0 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert0_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
  convert2 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect2_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert2_dout_net
  );
  convert3 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect3_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert3_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 0/Vector Convert1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_convert1 is
  port (
    i_1 : in std_logic_vector( 32-1 downto 0 );
    i_2 : in std_logic_vector( 32-1 downto 0 );
    i_3 : in std_logic_vector( 32-1 downto 0 );
    i_4 : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 );
    o_3 : out std_logic_vector( 16-1 downto 0 );
    o_4 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_convert1;
architecture structural of xsg_bwselector_vector_convert1 is 
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect2_net : std_logic_vector( 32-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect3_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
begin
  o_1 <= convert0_dout_net;
  o_2 <= convert1_dout_net;
  o_3 <= convert2_dout_net;
  o_4 <= convert3_dout_net;
  fir_compiler_7_2_m_axis_data_tdata_vect0_net <= i_1;
  fir_compiler_7_2_m_axis_data_tdata_vect1_net <= i_2;
  fir_compiler_7_2_m_axis_data_tdata_vect2_net <= i_3;
  fir_compiler_7_2_m_axis_data_tdata_vect3_net <= i_4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  convert0 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert0_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
  convert2 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect2_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert2_dout_net
  );
  convert3 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect3_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert3_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 0/Vector Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_imag_fir_2 is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    tdi_3 : in std_logic_vector( 16-1 downto 0 );
    tdi_4 : in std_logic_vector( 16-1 downto 0 );
    tdi_5 : in std_logic_vector( 16-1 downto 0 );
    tdi_6 : in std_logic_vector( 16-1 downto 0 );
    tdi_7 : in std_logic_vector( 16-1 downto 0 );
    tdi_8 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo_1 : out std_logic_vector( 32-1 downto 0 );
    tdo_2 : out std_logic_vector( 32-1 downto 0 );
    tdo_3 : out std_logic_vector( 32-1 downto 0 );
    tdo_4 : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_imag_fir_2;
architecture structural of xsg_bwselector_vector_imag_fir_2 is 
  signal fir_compiler_7_2_m_axis_data_tdata_vect3_net : std_logic_vector( 32-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect2_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo_1 <= fir_compiler_7_2_m_axis_data_tdata_vect0_net;
  tdo_2 <= fir_compiler_7_2_m_axis_data_tdata_vect1_net;
  tdo_3 <= fir_compiler_7_2_m_axis_data_tdata_vect2_net;
  tdo_4 <= fir_compiler_7_2_m_axis_data_tdata_vect3_net;
  register2_q_net <= tvi;
  reinterpret0_output_port_net <= tdi_1;
  reinterpret1_output_port_net <= tdi_2;
  reinterpret2_output_port_net <= tdi_3;
  reinterpret3_output_port_net <= tdi_4;
  reinterpret4_output_port_net <= tdi_5;
  reinterpret5_output_port_net <= tdi_6;
  reinterpret6_output_port_net <= tdi_7;
  reinterpret7_output_port_net <= tdi_8;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_77585be71a3fcdcbdad3183d582a337c 
  port map (
    s_axis_data_tvalid => register2_q_net(0),
    s_axis_data_tdata_vect7 => reinterpret7_output_port_net,
    s_axis_data_tdata_vect6 => reinterpret6_output_port_net,
    s_axis_data_tdata_vect5 => reinterpret5_output_port_net,
    s_axis_data_tdata_vect4 => reinterpret4_output_port_net,
    s_axis_data_tdata_vect3 => reinterpret3_output_port_net,
    s_axis_data_tdata_vect2 => reinterpret2_output_port_net,
    s_axis_data_tdata_vect1 => reinterpret1_output_port_net,
    s_axis_data_tdata_vect0 => reinterpret0_output_port_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_vect3 => fir_compiler_7_2_m_axis_data_tdata_vect3_net,
    m_axis_data_tdata_vect2 => fir_compiler_7_2_m_axis_data_tdata_vect2_net,
    m_axis_data_tdata_vect1 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    m_axis_data_tdata_vect0 => fir_compiler_7_2_m_axis_data_tdata_vect0_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 0/Vector Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_real_fir_2 is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    tdi_3 : in std_logic_vector( 16-1 downto 0 );
    tdi_4 : in std_logic_vector( 16-1 downto 0 );
    tdi_5 : in std_logic_vector( 16-1 downto 0 );
    tdi_6 : in std_logic_vector( 16-1 downto 0 );
    tdi_7 : in std_logic_vector( 16-1 downto 0 );
    tdi_8 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo_1 : out std_logic_vector( 32-1 downto 0 );
    tdo_2 : out std_logic_vector( 32-1 downto 0 );
    tdo_3 : out std_logic_vector( 32-1 downto 0 );
    tdo_4 : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_real_fir_2;
architecture structural of xsg_bwselector_vector_real_fir_2 is 
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect2_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect3_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo_1 <= fir_compiler_7_2_m_axis_data_tdata_vect0_net;
  tdo_2 <= fir_compiler_7_2_m_axis_data_tdata_vect1_net;
  tdo_3 <= fir_compiler_7_2_m_axis_data_tdata_vect2_net;
  tdo_4 <= fir_compiler_7_2_m_axis_data_tdata_vect3_net;
  register3_q_net <= tvi;
  reinterpret0_output_port_net <= tdi_1;
  reinterpret1_output_port_net <= tdi_2;
  reinterpret2_output_port_net <= tdi_3;
  reinterpret3_output_port_net <= tdi_4;
  reinterpret4_output_port_net <= tdi_5;
  reinterpret5_output_port_net <= tdi_6;
  reinterpret6_output_port_net <= tdi_7;
  reinterpret7_output_port_net <= tdi_8;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_77585be71a3fcdcbdad3183d582a337c 
  port map (
    s_axis_data_tvalid => register3_q_net(0),
    s_axis_data_tdata_vect7 => reinterpret7_output_port_net,
    s_axis_data_tdata_vect6 => reinterpret6_output_port_net,
    s_axis_data_tdata_vect5 => reinterpret5_output_port_net,
    s_axis_data_tdata_vect4 => reinterpret4_output_port_net,
    s_axis_data_tdata_vect3 => reinterpret3_output_port_net,
    s_axis_data_tdata_vect2 => reinterpret2_output_port_net,
    s_axis_data_tdata_vect1 => reinterpret1_output_port_net,
    s_axis_data_tdata_vect0 => reinterpret0_output_port_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_vect3 => fir_compiler_7_2_m_axis_data_tdata_vect3_net,
    m_axis_data_tdata_vect2 => fir_compiler_7_2_m_axis_data_tdata_vect2_net,
    m_axis_data_tdata_vect1 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    m_axis_data_tdata_vect0 => fir_compiler_7_2_m_axis_data_tdata_vect0_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_0 is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_5 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_6 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_7 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_8 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_5 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_6 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_7 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_8 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out_1 : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out_1 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_2 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_3 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_4 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_2 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_3 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_4 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_0;
architecture structural of xsg_bwselector_fir_2_system_0 is 
  signal convert0_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect3_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect2_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect3_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect2_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out_1 <= convert0_dout_net_x0;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  im_data_out_1 <= convert0_dout_net;
  re_data_out_2 <= convert1_dout_net_x0;
  re_data_out_3 <= convert2_dout_net_x0;
  re_data_out_4 <= convert3_dout_net_x0;
  im_data_out_2 <= convert1_dout_net;
  im_data_out_3 <= convert2_dout_net;
  im_data_out_4 <= convert3_dout_net;
  register3_q_net <= re_valid_in;
  reinterpret0_output_port_net_x0 <= re_data_in_1;
  register2_q_net <= im_valid_in;
  reinterpret0_output_port_net <= im_data_in_1;
  reinterpret1_output_port_net_x0 <= re_data_in_2;
  reinterpret2_output_port_net_x0 <= re_data_in_3;
  reinterpret3_output_port_net_x0 <= re_data_in_4;
  reinterpret4_output_port_net <= re_data_in_5;
  reinterpret5_output_port_net_x0 <= re_data_in_6;
  reinterpret6_output_port_net_x0 <= re_data_in_7;
  reinterpret7_output_port_net_x0 <= re_data_in_8;
  reinterpret1_output_port_net <= im_data_in_2;
  reinterpret2_output_port_net <= im_data_in_3;
  reinterpret3_output_port_net <= im_data_in_4;
  reinterpret4_output_port_net_x0 <= im_data_in_5;
  reinterpret5_output_port_net <= im_data_in_6;
  reinterpret6_output_port_net <= im_data_in_7;
  reinterpret7_output_port_net <= im_data_in_8;
  clk_net <= clk_1;
  ce_net <= ce_1;
  vector_convert : entity xil_defaultlib.xsg_bwselector_vector_convert 
  port map (
    i_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0,
    i_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0,
    i_3 => fir_compiler_7_2_m_axis_data_tdata_vect2_net,
    i_4 => fir_compiler_7_2_m_axis_data_tdata_vect3_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    o_1 => convert0_dout_net_x0,
    o_2 => convert1_dout_net_x0,
    o_3 => convert2_dout_net_x0,
    o_4 => convert3_dout_net_x0
  );
  vector_convert1 : entity xil_defaultlib.xsg_bwselector_vector_convert1 
  port map (
    i_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    i_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    i_3 => fir_compiler_7_2_m_axis_data_tdata_vect2_net_x0,
    i_4 => fir_compiler_7_2_m_axis_data_tdata_vect3_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    o_1 => convert0_dout_net,
    o_2 => convert1_dout_net,
    o_3 => convert2_dout_net,
    o_4 => convert3_dout_net
  );
  vector_imag_fir_2 : entity xil_defaultlib.xsg_bwselector_vector_imag_fir_2 
  port map (
    tvi => register2_q_net,
    tdi_1 => reinterpret0_output_port_net,
    tdi_2 => reinterpret1_output_port_net,
    tdi_3 => reinterpret2_output_port_net,
    tdi_4 => reinterpret3_output_port_net,
    tdi_5 => reinterpret4_output_port_net_x0,
    tdi_6 => reinterpret5_output_port_net,
    tdi_7 => reinterpret6_output_port_net,
    tdi_8 => reinterpret7_output_port_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    tdo_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    tdo_3 => fir_compiler_7_2_m_axis_data_tdata_vect2_net_x0,
    tdo_4 => fir_compiler_7_2_m_axis_data_tdata_vect3_net_x0
  );
  vector_real_fir_2 : entity xil_defaultlib.xsg_bwselector_vector_real_fir_2 
  port map (
    tvi => register3_q_net,
    tdi_1 => reinterpret0_output_port_net_x0,
    tdi_2 => reinterpret1_output_port_net_x0,
    tdi_3 => reinterpret2_output_port_net_x0,
    tdi_4 => reinterpret3_output_port_net_x0,
    tdi_5 => reinterpret4_output_port_net,
    tdi_6 => reinterpret5_output_port_net_x0,
    tdi_7 => reinterpret6_output_port_net_x0,
    tdi_8 => reinterpret7_output_port_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0,
    tdo_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0,
    tdo_3 => fir_compiler_7_2_m_axis_data_tdata_vect2_net,
    tdo_4 => fir_compiler_7_2_m_axis_data_tdata_vect3_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 1/Vector Convert
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_convert_x0 is
  port (
    i_1 : in std_logic_vector( 32-1 downto 0 );
    i_2 : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_convert_x0;
architecture structural of xsg_bwselector_vector_convert_x0 is 
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  o_1 <= convert0_dout_net;
  o_2 <= convert1_dout_net;
  fir_compiler_7_2_m_axis_data_tdata_vect0_net <= i_1;
  fir_compiler_7_2_m_axis_data_tdata_vect1_net <= i_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  convert0 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert0_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 1/Vector Convert1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_convert1_x0 is
  port (
    i_1 : in std_logic_vector( 32-1 downto 0 );
    i_2 : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_convert1_x0;
architecture structural of xsg_bwselector_vector_convert1_x0 is 
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  o_1 <= convert0_dout_net;
  o_2 <= convert1_dout_net;
  fir_compiler_7_2_m_axis_data_tdata_vect0_net <= i_1;
  fir_compiler_7_2_m_axis_data_tdata_vect1_net <= i_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  convert0 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert0_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 1/Vector Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_imag_fir_2_x0 is
  port (
    tvi : in std_logic;
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    tdi_3 : in std_logic_vector( 16-1 downto 0 );
    tdi_4 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo_1 : out std_logic_vector( 32-1 downto 0 );
    tdo_2 : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_imag_fir_2_x0;
architecture structural of xsg_bwselector_vector_imag_fir_2_x0 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal clk_net : std_logic;
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo_1 <= fir_compiler_7_2_m_axis_data_tdata_vect0_net;
  tdo_2 <= fir_compiler_7_2_m_axis_data_tdata_vect1_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert0_dout_net <= tdi_1;
  convert1_dout_net <= tdi_2;
  convert2_dout_net <= tdi_3;
  convert3_dout_net <= tdi_4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_b2a36ee9c093246bbf53aedb97dcea8e 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_vect3 => convert3_dout_net,
    s_axis_data_tdata_vect2 => convert2_dout_net,
    s_axis_data_tdata_vect1 => convert1_dout_net,
    s_axis_data_tdata_vect0 => convert0_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_vect1 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    m_axis_data_tdata_vect0 => fir_compiler_7_2_m_axis_data_tdata_vect0_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 1/Vector Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_real_fir_2_x0 is
  port (
    tvi : in std_logic;
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    tdi_3 : in std_logic_vector( 16-1 downto 0 );
    tdi_4 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo_1 : out std_logic_vector( 32-1 downto 0 );
    tdo_2 : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_real_fir_2_x0;
architecture structural of xsg_bwselector_vector_real_fir_2_x0 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo_1 <= fir_compiler_7_2_m_axis_data_tdata_vect0_net;
  tdo_2 <= fir_compiler_7_2_m_axis_data_tdata_vect1_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert0_dout_net <= tdi_1;
  convert1_dout_net <= tdi_2;
  convert2_dout_net <= tdi_3;
  convert3_dout_net <= tdi_4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_b2a36ee9c093246bbf53aedb97dcea8e 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_vect3 => convert3_dout_net,
    s_axis_data_tdata_vect2 => convert2_dout_net,
    s_axis_data_tdata_vect1 => convert1_dout_net,
    s_axis_data_tdata_vect0 => convert0_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_vect1 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    m_axis_data_tdata_vect0 => fir_compiler_7_2_m_axis_data_tdata_vect0_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_1 is
  port (
    re_valid_in : in std_logic;
    re_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out_1 : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out_1 : out std_logic_vector( 16-1 downto 0 );
    re_data_out_2 : out std_logic_vector( 16-1 downto 0 );
    im_data_out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_1;
architecture structural of xsg_bwselector_fir_2_system_1 is 
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_vect1_net : std_logic_vector( 32-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal clk_net : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert2_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert3_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_vect0_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert0_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out_1 <= convert0_dout_net_x0;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  im_data_out_1 <= convert0_dout_net;
  re_data_out_2 <= convert1_dout_net_x0;
  im_data_out_2 <= convert1_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_in;
  convert0_dout_net_x2 <= re_data_in_1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_in;
  convert0_dout_net_x1 <= im_data_in_1;
  convert1_dout_net_x2 <= re_data_in_2;
  convert2_dout_net <= re_data_in_3;
  convert3_dout_net_x0 <= re_data_in_4;
  convert1_dout_net_x1 <= im_data_in_2;
  convert2_dout_net_x0 <= im_data_in_3;
  convert3_dout_net <= im_data_in_4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  vector_convert : entity xil_defaultlib.xsg_bwselector_vector_convert_x0 
  port map (
    i_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0,
    i_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    o_1 => convert0_dout_net_x0,
    o_2 => convert1_dout_net_x0
  );
  vector_convert1 : entity xil_defaultlib.xsg_bwselector_vector_convert1_x0 
  port map (
    i_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    i_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    o_1 => convert0_dout_net,
    o_2 => convert1_dout_net
  );
  vector_imag_fir_2 : entity xil_defaultlib.xsg_bwselector_vector_imag_fir_2_x0 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    tdi_1 => convert0_dout_net_x1,
    tdi_2 => convert1_dout_net_x1,
    tdi_3 => convert2_dout_net_x0,
    tdi_4 => convert3_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net,
    tdo_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net
  );
  vector_real_fir_2 : entity xil_defaultlib.xsg_bwselector_vector_real_fir_2_x0 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi_1 => convert0_dout_net_x2,
    tdi_2 => convert1_dout_net_x2,
    tdi_3 => convert2_dout_net,
    tdi_4 => convert3_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo_1 => fir_compiler_7_2_m_axis_data_tdata_vect0_net_x0,
    tdo_2 => fir_compiler_7_2_m_axis_data_tdata_vect1_net_x0
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 2/Vector Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_imag_fir_2_x1 is
  port (
    tvi : in std_logic;
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_imag_fir_2_x1;
architecture structural of xsg_bwselector_vector_imag_fir_2_x1 is 
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
begin
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert0_dout_net <= tdi_1;
  convert1_dout_net <= tdi_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_af3721e210868ca8451d0c9d4ed84b4a 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_vect1 => convert1_dout_net,
    s_axis_data_tdata_vect0 => convert0_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 2/Vector Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_real_fir_2_x1 is
  port (
    tvi : in std_logic;
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_real_fir_2_x1;
architecture structural of xsg_bwselector_vector_real_fir_2_x1 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert0_dout_net <= tdi_1;
  convert1_dout_net <= tdi_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_af3721e210868ca8451d0c9d4ed84b4a 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_vect1 => convert1_dout_net,
    s_axis_data_tdata_vect0 => convert0_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/FIR 2 System 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_2 is
  port (
    re_valid_in : in std_logic;
    re_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_2;
architecture structural of xsg_bwselector_fir_2_system_2 is 
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert0_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal convert1_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out <= convert1_dout_net;
  im_data_out <= convert_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_in;
  convert0_dout_net_x0 <= re_data_in_1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_in;
  convert0_dout_net <= im_data_in_1;
  convert1_dout_net_x1 <= re_data_in_2;
  convert1_dout_net_x0 <= im_data_in_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  vector_imag_fir_2 : entity xil_defaultlib.xsg_bwselector_vector_imag_fir_2_x1 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    tdi_1 => convert0_dout_net,
    tdi_2 => convert1_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  vector_real_fir_2 : entity xil_defaultlib.xsg_bwselector_vector_real_fir_2_x1 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi_1 => convert0_dout_net_x0,
    tdi_2 => convert1_dout_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 0/Vector Reinterpret
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret_x0 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    in_3 : in std_logic_vector( 16-1 downto 0 );
    in_4 : in std_logic_vector( 16-1 downto 0 );
    in_5 : in std_logic_vector( 16-1 downto 0 );
    in_6 : in std_logic_vector( 16-1 downto 0 );
    in_7 : in std_logic_vector( 16-1 downto 0 );
    in_8 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 );
    out_3 : out std_logic_vector( 16-1 downto 0 );
    out_4 : out std_logic_vector( 16-1 downto 0 );
    out_5 : out std_logic_vector( 16-1 downto 0 );
    out_6 : out std_logic_vector( 16-1 downto 0 );
    out_7 : out std_logic_vector( 16-1 downto 0 );
    out_8 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret_x0;
architecture structural of xsg_bwselector_vector_reinterpret_x0 is 
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net_x0;
  out_2 <= reinterpret1_output_port_net_x0;
  out_3 <= reinterpret2_output_port_net_x0;
  out_4 <= reinterpret3_output_port_net_x0;
  out_5 <= reinterpret4_output_port_net_x0;
  out_6 <= reinterpret5_output_port_net_x0;
  out_7 <= reinterpret6_output_port_net_x0;
  out_8 <= reinterpret7_output_port_net_x0;
  reinterpret0_output_port_net <= in_1;
  reinterpret1_output_port_net <= in_2;
  reinterpret2_output_port_net <= in_3;
  reinterpret3_output_port_net <= in_4;
  reinterpret4_output_port_net <= in_5;
  reinterpret5_output_port_net <= in_6;
  reinterpret6_output_port_net <= in_7;
  reinterpret7_output_port_net <= in_8;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret0_output_port_net,
    output_port => reinterpret0_output_port_net_x0
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret1_output_port_net,
    output_port => reinterpret1_output_port_net_x0
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret2_output_port_net,
    output_port => reinterpret2_output_port_net_x0
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret3_output_port_net,
    output_port => reinterpret3_output_port_net_x0
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret4_output_port_net,
    output_port => reinterpret4_output_port_net_x0
  );
  reinterpret5 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret5_output_port_net,
    output_port => reinterpret5_output_port_net_x0
  );
  reinterpret6 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret6_output_port_net,
    output_port => reinterpret6_output_port_net_x0
  );
  reinterpret7 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret7_output_port_net,
    output_port => reinterpret7_output_port_net_x0
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 0/Vector Reinterpret1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret1_x0 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    in_3 : in std_logic_vector( 16-1 downto 0 );
    in_4 : in std_logic_vector( 16-1 downto 0 );
    in_5 : in std_logic_vector( 16-1 downto 0 );
    in_6 : in std_logic_vector( 16-1 downto 0 );
    in_7 : in std_logic_vector( 16-1 downto 0 );
    in_8 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 );
    out_3 : out std_logic_vector( 16-1 downto 0 );
    out_4 : out std_logic_vector( 16-1 downto 0 );
    out_5 : out std_logic_vector( 16-1 downto 0 );
    out_6 : out std_logic_vector( 16-1 downto 0 );
    out_7 : out std_logic_vector( 16-1 downto 0 );
    out_8 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret1_x0;
architecture structural of xsg_bwselector_vector_reinterpret1_x0 is 
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net_x0;
  out_2 <= reinterpret1_output_port_net_x0;
  out_3 <= reinterpret2_output_port_net_x0;
  out_4 <= reinterpret3_output_port_net_x0;
  out_5 <= reinterpret4_output_port_net_x0;
  out_6 <= reinterpret5_output_port_net_x0;
  out_7 <= reinterpret6_output_port_net_x0;
  out_8 <= reinterpret7_output_port_net_x0;
  reinterpret0_output_port_net <= in_1;
  reinterpret1_output_port_net <= in_2;
  reinterpret2_output_port_net <= in_3;
  reinterpret3_output_port_net <= in_4;
  reinterpret4_output_port_net <= in_5;
  reinterpret5_output_port_net <= in_6;
  reinterpret6_output_port_net <= in_7;
  reinterpret7_output_port_net <= in_8;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret0_output_port_net,
    output_port => reinterpret0_output_port_net_x0
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret1_output_port_net,
    output_port => reinterpret1_output_port_net_x0
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret2_output_port_net,
    output_port => reinterpret2_output_port_net_x0
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret3_output_port_net,
    output_port => reinterpret3_output_port_net_x0
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret4_output_port_net,
    output_port => reinterpret4_output_port_net_x0
  );
  reinterpret5 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret5_output_port_net,
    output_port => reinterpret5_output_port_net_x0
  );
  reinterpret6 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret6_output_port_net,
    output_port => reinterpret6_output_port_net_x0
  );
  reinterpret7 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => reinterpret7_output_port_net,
    output_port => reinterpret7_output_port_net_x0
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 0/Vector2Scalar
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector2scalar is
  port (
    i_1 : in std_logic_vector( 16-1 downto 0 );
    i_2 : in std_logic_vector( 16-1 downto 0 );
    i_3 : in std_logic_vector( 16-1 downto 0 );
    i_4 : in std_logic_vector( 16-1 downto 0 );
    i_5 : in std_logic_vector( 16-1 downto 0 );
    i_6 : in std_logic_vector( 16-1 downto 0 );
    i_7 : in std_logic_vector( 16-1 downto 0 );
    i_8 : in std_logic_vector( 16-1 downto 0 );
    o : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_vector2scalar;
architecture structural of xsg_bwselector_vector2scalar is 
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  o <= concat1_y_net;
  reinterpret0_output_port_net <= i_1;
  reinterpret1_output_port_net <= i_2;
  reinterpret2_output_port_net <= i_3;
  reinterpret3_output_port_net <= i_4;
  reinterpret4_output_port_net <= i_5;
  reinterpret5_output_port_net <= i_6;
  reinterpret6_output_port_net <= i_7;
  reinterpret7_output_port_net <= i_8;
  concat1 : entity xil_defaultlib.sysgen_concat_6e01873e37 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret7_output_port_net,
    in1 => reinterpret6_output_port_net,
    in2 => reinterpret5_output_port_net,
    in3 => reinterpret4_output_port_net,
    in4 => reinterpret3_output_port_net,
    in5 => reinterpret2_output_port_net,
    in6 => reinterpret1_output_port_net,
    in7 => reinterpret0_output_port_net,
    y => concat1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 0/Vector2Scalar1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector2scalar1_x0 is
  port (
    i_1 : in std_logic_vector( 16-1 downto 0 );
    i_2 : in std_logic_vector( 16-1 downto 0 );
    i_3 : in std_logic_vector( 16-1 downto 0 );
    i_4 : in std_logic_vector( 16-1 downto 0 );
    i_5 : in std_logic_vector( 16-1 downto 0 );
    i_6 : in std_logic_vector( 16-1 downto 0 );
    i_7 : in std_logic_vector( 16-1 downto 0 );
    i_8 : in std_logic_vector( 16-1 downto 0 );
    o : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_vector2scalar1_x0;
architecture structural of xsg_bwselector_vector2scalar1_x0 is 
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  o <= concat1_y_net;
  reinterpret0_output_port_net <= i_1;
  reinterpret1_output_port_net <= i_2;
  reinterpret2_output_port_net <= i_3;
  reinterpret3_output_port_net <= i_4;
  reinterpret4_output_port_net <= i_5;
  reinterpret5_output_port_net <= i_6;
  reinterpret6_output_port_net <= i_7;
  reinterpret7_output_port_net <= i_8;
  concat1 : entity xil_defaultlib.sysgen_concat_6e01873e37 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret7_output_port_net,
    in1 => reinterpret6_output_port_net,
    in2 => reinterpret5_output_port_net,
    in3 => reinterpret4_output_port_net,
    in4 => reinterpret3_output_port_net,
    in5 => reinterpret2_output_port_net,
    in6 => reinterpret1_output_port_net,
    in7 => reinterpret0_output_port_net,
    y => concat1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_ssr_converter_0 is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_5 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_6 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_7 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_8 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_5 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_6 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_7 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_8 : in std_logic_vector( 16-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_ssr_converter_0;
architecture structural of xsg_bwselector_ssr_converter_0 is 
  signal reinterpret5_output_port_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret0_output_port_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret1_output_port_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal reinterpret3_output_port_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  re_data_out <= concat1_y_net_x0;
  im_data_out <= concat1_y_net;
  register3_q_net <= re_valid_in;
  reinterpret0_output_port_net_x2 <= re_data_in_1;
  register2_q_net <= im_valid_in;
  reinterpret0_output_port_net_x1 <= im_data_in_1;
  reinterpret1_output_port_net_x2 <= re_data_in_2;
  reinterpret2_output_port_net_x2 <= re_data_in_3;
  reinterpret3_output_port_net_x2 <= re_data_in_4;
  reinterpret4_output_port_net_x2 <= re_data_in_5;
  reinterpret5_output_port_net_x2 <= re_data_in_6;
  reinterpret6_output_port_net_x1 <= re_data_in_7;
  reinterpret7_output_port_net_x1 <= re_data_in_8;
  reinterpret1_output_port_net_x1 <= im_data_in_2;
  reinterpret2_output_port_net_x1 <= im_data_in_3;
  reinterpret3_output_port_net_x1 <= im_data_in_4;
  reinterpret4_output_port_net_x1 <= im_data_in_5;
  reinterpret5_output_port_net_x1 <= im_data_in_6;
  reinterpret6_output_port_net_x0 <= im_data_in_7;
  reinterpret7_output_port_net_x0 <= im_data_in_8;
  vector_reinterpret : entity xil_defaultlib.xsg_bwselector_vector_reinterpret_x0 
  port map (
    in_1 => reinterpret0_output_port_net_x2,
    in_2 => reinterpret1_output_port_net_x2,
    in_3 => reinterpret2_output_port_net_x2,
    in_4 => reinterpret3_output_port_net_x2,
    in_5 => reinterpret4_output_port_net_x2,
    in_6 => reinterpret5_output_port_net_x2,
    in_7 => reinterpret6_output_port_net_x1,
    in_8 => reinterpret7_output_port_net_x1,
    out_1 => reinterpret0_output_port_net_x0,
    out_2 => reinterpret1_output_port_net_x0,
    out_3 => reinterpret2_output_port_net_x0,
    out_4 => reinterpret3_output_port_net_x0,
    out_5 => reinterpret4_output_port_net_x0,
    out_6 => reinterpret5_output_port_net_x0,
    out_7 => reinterpret6_output_port_net,
    out_8 => reinterpret7_output_port_net
  );
  vector_reinterpret1 : entity xil_defaultlib.xsg_bwselector_vector_reinterpret1_x0 
  port map (
    in_1 => reinterpret0_output_port_net_x1,
    in_2 => reinterpret1_output_port_net_x1,
    in_3 => reinterpret2_output_port_net_x1,
    in_4 => reinterpret3_output_port_net_x1,
    in_5 => reinterpret4_output_port_net_x1,
    in_6 => reinterpret5_output_port_net_x1,
    in_7 => reinterpret6_output_port_net_x0,
    in_8 => reinterpret7_output_port_net_x0,
    out_1 => reinterpret0_output_port_net,
    out_2 => reinterpret1_output_port_net,
    out_3 => reinterpret2_output_port_net,
    out_4 => reinterpret3_output_port_net,
    out_5 => reinterpret4_output_port_net,
    out_6 => reinterpret5_output_port_net,
    out_7 => reinterpret6_output_port_net_x2,
    out_8 => reinterpret7_output_port_net_x2
  );
  vector2scalar : entity xil_defaultlib.xsg_bwselector_vector2scalar 
  port map (
    i_1 => reinterpret0_output_port_net_x0,
    i_2 => reinterpret1_output_port_net_x0,
    i_3 => reinterpret2_output_port_net_x0,
    i_4 => reinterpret3_output_port_net_x0,
    i_5 => reinterpret4_output_port_net_x0,
    i_6 => reinterpret5_output_port_net_x0,
    i_7 => reinterpret6_output_port_net,
    i_8 => reinterpret7_output_port_net,
    o => concat1_y_net_x0
  );
  vector2scalar1 : entity xil_defaultlib.xsg_bwselector_vector2scalar1_x0 
  port map (
    i_1 => reinterpret0_output_port_net,
    i_2 => reinterpret1_output_port_net,
    i_3 => reinterpret2_output_port_net,
    i_4 => reinterpret3_output_port_net,
    i_5 => reinterpret4_output_port_net,
    i_6 => reinterpret5_output_port_net,
    i_7 => reinterpret6_output_port_net_x2,
    i_8 => reinterpret7_output_port_net_x2,
    o => concat1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 1/Vector Reinterpret
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret_x1 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    in_3 : in std_logic_vector( 16-1 downto 0 );
    in_4 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 );
    out_3 : out std_logic_vector( 16-1 downto 0 );
    out_4 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret_x1;
architecture structural of xsg_bwselector_vector_reinterpret_x1 is 
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  out_3 <= reinterpret2_output_port_net;
  out_4 <= reinterpret3_output_port_net;
  convert0_dout_net <= in_1;
  convert1_dout_net <= in_2;
  convert2_dout_net <= in_3;
  convert3_dout_net <= in_4;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert0_dout_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert1_dout_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert2_dout_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert3_dout_net,
    output_port => reinterpret3_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 1/Vector Reinterpret1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret1_x1 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    in_3 : in std_logic_vector( 16-1 downto 0 );
    in_4 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 );
    out_3 : out std_logic_vector( 16-1 downto 0 );
    out_4 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret1_x1;
architecture structural of xsg_bwselector_vector_reinterpret1_x1 is 
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  out_3 <= reinterpret2_output_port_net;
  out_4 <= reinterpret3_output_port_net;
  convert0_dout_net <= in_1;
  convert1_dout_net <= in_2;
  convert2_dout_net <= in_3;
  convert3_dout_net <= in_4;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert0_dout_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert1_dout_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert2_dout_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert3_dout_net,
    output_port => reinterpret3_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 1/Vector2Scalar
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector2scalar_x0 is
  port (
    i_1 : in std_logic_vector( 16-1 downto 0 );
    i_2 : in std_logic_vector( 16-1 downto 0 );
    i_3 : in std_logic_vector( 16-1 downto 0 );
    i_4 : in std_logic_vector( 16-1 downto 0 );
    o : out std_logic_vector( 64-1 downto 0 )
  );
end xsg_bwselector_vector2scalar_x0;
architecture structural of xsg_bwselector_vector2scalar_x0 is 
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 64-1 downto 0 );
begin
  o <= concat1_y_net;
  reinterpret0_output_port_net <= i_1;
  reinterpret1_output_port_net <= i_2;
  reinterpret2_output_port_net <= i_3;
  reinterpret3_output_port_net <= i_4;
  concat1 : entity xil_defaultlib.sysgen_concat_471aabf868 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret3_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret1_output_port_net,
    in3 => reinterpret0_output_port_net,
    y => concat1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 1/Vector2Scalar1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector2scalar1 is
  port (
    i_1 : in std_logic_vector( 16-1 downto 0 );
    i_2 : in std_logic_vector( 16-1 downto 0 );
    i_3 : in std_logic_vector( 16-1 downto 0 );
    i_4 : in std_logic_vector( 16-1 downto 0 );
    o : out std_logic_vector( 64-1 downto 0 )
  );
end xsg_bwselector_vector2scalar1;
architecture structural of xsg_bwselector_vector2scalar1 is 
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 64-1 downto 0 );
begin
  o <= concat1_y_net;
  reinterpret0_output_port_net <= i_1;
  reinterpret1_output_port_net <= i_2;
  reinterpret2_output_port_net <= i_3;
  reinterpret3_output_port_net <= i_4;
  concat1 : entity xil_defaultlib.sysgen_concat_471aabf868 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret3_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret1_output_port_net,
    in3 => reinterpret0_output_port_net,
    y => concat1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_ssr_converter_1 is
  port (
    re_valid_in : in std_logic;
    re_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_ssr_converter_1;
architecture structural of xsg_bwselector_ssr_converter_1 is 
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal concat1_y_net_x1 : std_logic_vector( 128-1 downto 0 );
  signal concat1_y_net_x0 : std_logic_vector( 64-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert3_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal constant_op_net : std_logic_vector( 64-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 64-1 downto 0 );
begin
  re_data_out <= concat_y_net;
  im_data_out <= concat1_y_net_x1;
  fir_compiler_7_2_m_axis_data_tvalid_net <= re_valid_in;
  convert0_dout_net_x0 <= re_data_in_1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= im_valid_in;
  convert0_dout_net <= im_data_in_1;
  convert1_dout_net_x0 <= re_data_in_2;
  convert2_dout_net_x0 <= re_data_in_3;
  convert3_dout_net_x0 <= re_data_in_4;
  convert1_dout_net <= im_data_in_2;
  convert2_dout_net <= im_data_in_3;
  convert3_dout_net <= im_data_in_4;
  vector_reinterpret : entity xil_defaultlib.xsg_bwselector_vector_reinterpret_x1 
  port map (
    in_1 => convert0_dout_net_x0,
    in_2 => convert1_dout_net_x0,
    in_3 => convert2_dout_net_x0,
    in_4 => convert3_dout_net_x0,
    out_1 => reinterpret0_output_port_net,
    out_2 => reinterpret1_output_port_net,
    out_3 => reinterpret2_output_port_net,
    out_4 => reinterpret3_output_port_net_x0
  );
  vector_reinterpret1 : entity xil_defaultlib.xsg_bwselector_vector_reinterpret1_x1 
  port map (
    in_1 => convert0_dout_net,
    in_2 => convert1_dout_net,
    in_3 => convert2_dout_net,
    in_4 => convert3_dout_net,
    out_1 => reinterpret0_output_port_net_x0,
    out_2 => reinterpret1_output_port_net_x0,
    out_3 => reinterpret2_output_port_net_x0,
    out_4 => reinterpret3_output_port_net
  );
  vector2scalar : entity xil_defaultlib.xsg_bwselector_vector2scalar_x0 
  port map (
    i_1 => reinterpret0_output_port_net,
    i_2 => reinterpret1_output_port_net,
    i_3 => reinterpret2_output_port_net,
    i_4 => reinterpret3_output_port_net_x0,
    o => concat1_y_net_x0
  );
  vector2scalar1 : entity xil_defaultlib.xsg_bwselector_vector2scalar1 
  port map (
    i_1 => reinterpret0_output_port_net_x0,
    i_2 => reinterpret1_output_port_net_x0,
    i_3 => reinterpret2_output_port_net_x0,
    i_4 => reinterpret3_output_port_net,
    o => concat1_y_net
  );
  concat : entity xil_defaultlib.sysgen_concat_5f04d3dc0f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => constant_op_net,
    in1 => concat1_y_net_x0,
    y => concat_y_net
  );
  concat1 : entity xil_defaultlib.sysgen_concat_5f04d3dc0f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => constant_op_net,
    in1 => concat1_y_net,
    y => concat1_y_net_x1
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_9f319455c1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 2/Vector Reinterpret1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret1_x2 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret1_x2;
architecture structural of xsg_bwselector_vector_reinterpret1_x2 is 
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  convert0_dout_net <= in_1;
  convert1_dout_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert0_dout_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert1_dout_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 2/Vector Reinterpret2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret2 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret2;
architecture structural of xsg_bwselector_vector_reinterpret2 is 
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  convert0_dout_net <= in_1;
  convert1_dout_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert0_dout_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert1_dout_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 2/Vector2Scalar
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector2scalar_x1 is
  port (
    i_1 : in std_logic_vector( 16-1 downto 0 );
    i_2 : in std_logic_vector( 16-1 downto 0 );
    o : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector2scalar_x1;
architecture structural of xsg_bwselector_vector2scalar_x1 is 
  signal concat1_y_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  o <= concat1_y_net;
  reinterpret0_output_port_net <= i_1;
  reinterpret1_output_port_net <= i_2;
  concat1 : entity xil_defaultlib.sysgen_concat_154c3345c3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret0_output_port_net,
    y => concat1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 2/Vector2Scalar1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector2scalar1_x1 is
  port (
    i_1 : in std_logic_vector( 16-1 downto 0 );
    i_2 : in std_logic_vector( 16-1 downto 0 );
    o : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector2scalar1_x1;
architecture structural of xsg_bwselector_vector2scalar1_x1 is 
  signal concat1_y_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  o <= concat1_y_net;
  reinterpret0_output_port_net <= i_1;
  reinterpret1_output_port_net <= i_2;
  concat1 : entity xil_defaultlib.sysgen_concat_154c3345c3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret0_output_port_net,
    y => concat1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Converter 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_ssr_converter_2 is
  port (
    re_valid_in : in std_logic;
    re_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_ssr_converter_2;
architecture structural of xsg_bwselector_ssr_converter_2 is 
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal concat1_y_net_x1 : std_logic_vector( 128-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal constant_op_net : std_logic_vector( 96-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 32-1 downto 0 );
begin
  re_data_out <= concat_y_net;
  im_data_out <= concat1_y_net_x1;
  fir_compiler_7_2_m_axis_data_tvalid_net <= re_valid_in;
  convert0_dout_net_x0 <= re_data_in_1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= im_valid_in;
  convert0_dout_net <= im_data_in_1;
  convert1_dout_net_x0 <= re_data_in_2;
  convert1_dout_net <= im_data_in_2;
  vector_reinterpret1 : entity xil_defaultlib.xsg_bwselector_vector_reinterpret1_x2 
  port map (
    in_1 => convert0_dout_net_x0,
    in_2 => convert1_dout_net_x0,
    out_1 => reinterpret0_output_port_net_x0,
    out_2 => reinterpret1_output_port_net_x0
  );
  vector_reinterpret2 : entity xil_defaultlib.xsg_bwselector_vector_reinterpret2 
  port map (
    in_1 => convert0_dout_net,
    in_2 => convert1_dout_net,
    out_1 => reinterpret0_output_port_net,
    out_2 => reinterpret1_output_port_net
  );
  vector2scalar : entity xil_defaultlib.xsg_bwselector_vector2scalar_x1 
  port map (
    i_1 => reinterpret0_output_port_net_x0,
    i_2 => reinterpret1_output_port_net_x0,
    o => concat1_y_net_x0
  );
  vector2scalar1 : entity xil_defaultlib.xsg_bwselector_vector2scalar1_x1 
  port map (
    i_1 => reinterpret0_output_port_net,
    i_2 => reinterpret1_output_port_net,
    o => concat1_y_net
  );
  concat : entity xil_defaultlib.sysgen_concat_b51ed76204 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => constant_op_net,
    in1 => concat1_y_net_x0,
    y => concat_y_net
  );
  concat1 : entity xil_defaultlib.sysgen_concat_b51ed76204 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => constant_op_net,
    in1 => concat1_y_net,
    y => concat1_y_net_x1
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_d468de54d8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/SSR Switch
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_ssr_switch is
  port (
    sel : in std_logic_vector( 2-1 downto 0 );
    va0 : in std_logic_vector( 1-1 downto 0 );
    vb0 : in std_logic_vector( 128-1 downto 0 );
    vc0 : in std_logic_vector( 1-1 downto 0 );
    vd0 : in std_logic_vector( 128-1 downto 0 );
    va1 : in std_logic;
    vb1 : in std_logic_vector( 128-1 downto 0 );
    vc1 : in std_logic;
    vd1 : in std_logic_vector( 128-1 downto 0 );
    va2 : in std_logic;
    vb2 : in std_logic_vector( 128-1 downto 0 );
    vc2 : in std_logic;
    vd2 : in std_logic_vector( 128-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    va : out std_logic_vector( 1-1 downto 0 );
    vb : out std_logic_vector( 128-1 downto 0 );
    vc : out std_logic_vector( 1-1 downto 0 );
    vd : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_ssr_switch;
architecture structural of xsg_bwselector_ssr_switch is 
  signal mux1_y_net : std_logic_vector( 128-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal concat_y_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal clk_net : std_logic;
  signal concat1_y_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
  signal ce_net : std_logic;
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal concat1_y_net_x2 : std_logic_vector( 128-1 downto 0 );
  signal slice2_y_net : std_logic_vector( 2-1 downto 0 );
  signal concat1_y_net_x1 : std_logic_vector( 128-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
begin
  va <= mux_y_net;
  vb <= mux1_y_net;
  vc <= mux2_y_net;
  vd <= mux3_y_net;
  slice2_y_net <= sel;
  register3_q_net <= va0;
  concat1_y_net_x2 <= vb0;
  register2_q_net <= vc0;
  concat1_y_net_x1 <= vd0;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= va1;
  concat_y_net_x0 <= vb1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= vc1;
  concat1_y_net_x0 <= vd1;
  fir_compiler_7_2_m_axis_data_tvalid_net <= va2;
  concat_y_net <= vb2;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= vc2;
  concat1_y_net <= vd2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux : entity xil_defaultlib.sysgen_mux_769ff47f4a 
  port map (
    clr => '0',
    sel => slice2_y_net,
    d0 => register3_q_net,
    d1(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    d2(0) => fir_compiler_7_2_m_axis_data_tvalid_net,
    d3(0) => fir_compiler_7_2_m_axis_data_tvalid_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_6973bfb62e 
  port map (
    clr => '0',
    sel => slice2_y_net,
    d0 => concat1_y_net_x2,
    d1 => concat_y_net_x0,
    d2 => concat_y_net,
    d3 => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_769ff47f4a 
  port map (
    clr => '0',
    sel => slice2_y_net,
    d0 => register2_q_net,
    d1(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    d2(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    d3(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux2_y_net
  );
  mux3 : entity xil_defaultlib.sysgen_mux_6973bfb62e 
  port map (
    clr => '0',
    sel => slice2_y_net,
    d0 => concat1_y_net_x1,
    d1 => concat1_y_net_x0,
    d2 => concat1_y_net,
    d3 => concat1_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux3_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_coarse_decimator is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    decimation : in std_logic_vector( 2-1 downto 0 );
    re_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_5 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_6 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_7 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_8 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_5 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_6 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_7 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_8 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_data_out : out std_logic_vector( 16-1 downto 0 );
    ssr_re_valid_out : out std_logic_vector( 1-1 downto 0 );
    ssr_re_data_out : out std_logic_vector( 128-1 downto 0 );
    ssr_im_valid_out : out std_logic_vector( 1-1 downto 0 );
    ssr_im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_coarse_decimator;
architecture structural of xsg_bwselector_coarse_decimator is 
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal slice2_y_net : std_logic_vector( 2-1 downto 0 );
  signal reinterpret2_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal concat1_y_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal clk_net : std_logic;
  signal concat1_y_net_x1 : std_logic_vector( 128-1 downto 0 );
  signal reinterpret6_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x3 : std_logic;
  signal convert0_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x4 : std_logic;
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert0_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert0_dout_net : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net_x2 : std_logic_vector( 128-1 downto 0 );
  signal reinterpret5_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal concat_y_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal reinterpret4_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out <= convert1_dout_net;
  im_data_out <= convert_dout_net;
  ssr_re_valid_out <= mux_y_net;
  ssr_re_data_out <= mux1_y_net;
  ssr_im_valid_out <= mux2_y_net;
  ssr_im_data_out <= mux3_y_net;
  register3_q_net <= re_valid_in;
  reinterpret0_output_port_net_x0 <= re_data_in_1;
  register2_q_net <= im_valid_in;
  reinterpret0_output_port_net <= im_data_in_1;
  slice2_y_net <= decimation;
  reinterpret1_output_port_net_x0 <= re_data_in_2;
  reinterpret2_output_port_net_x0 <= re_data_in_3;
  reinterpret3_output_port_net <= re_data_in_4;
  reinterpret4_output_port_net_x0 <= re_data_in_5;
  reinterpret5_output_port_net_x0 <= re_data_in_6;
  reinterpret6_output_port_net_x0 <= re_data_in_7;
  reinterpret7_output_port_net_x0 <= re_data_in_8;
  reinterpret1_output_port_net <= im_data_in_2;
  reinterpret2_output_port_net <= im_data_in_3;
  reinterpret3_output_port_net_x0 <= im_data_in_4;
  reinterpret4_output_port_net <= im_data_in_5;
  reinterpret5_output_port_net <= im_data_in_6;
  reinterpret6_output_port_net <= im_data_in_7;
  reinterpret7_output_port_net <= im_data_in_8;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_2_system_0 : entity xil_defaultlib.xsg_bwselector_fir_2_system_0 
  port map (
    re_valid_in => register3_q_net,
    re_data_in_1 => reinterpret0_output_port_net_x0,
    im_valid_in => register2_q_net,
    im_data_in_1 => reinterpret0_output_port_net,
    re_data_in_2 => reinterpret1_output_port_net_x0,
    re_data_in_3 => reinterpret2_output_port_net_x0,
    re_data_in_4 => reinterpret3_output_port_net,
    re_data_in_5 => reinterpret4_output_port_net_x0,
    re_data_in_6 => reinterpret5_output_port_net_x0,
    re_data_in_7 => reinterpret6_output_port_net_x0,
    re_data_in_8 => reinterpret7_output_port_net_x0,
    im_data_in_2 => reinterpret1_output_port_net,
    im_data_in_3 => reinterpret2_output_port_net,
    im_data_in_4 => reinterpret3_output_port_net_x0,
    im_data_in_5 => reinterpret4_output_port_net,
    im_data_in_6 => reinterpret5_output_port_net,
    im_data_in_7 => reinterpret6_output_port_net,
    im_data_in_8 => reinterpret7_output_port_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    re_data_out_1 => convert0_dout_net_x2,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    im_data_out_1 => convert0_dout_net_x1,
    re_data_out_2 => convert1_dout_net_x3,
    re_data_out_3 => convert2_dout_net_x0,
    re_data_out_4 => convert3_dout_net_x0,
    im_data_out_2 => convert1_dout_net_x2,
    im_data_out_3 => convert2_dout_net,
    im_data_out_4 => convert3_dout_net
  );
  fir_2_system_1 : entity xil_defaultlib.xsg_bwselector_fir_2_system_1 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    re_data_in_1 => convert0_dout_net_x2,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    im_data_in_1 => convert0_dout_net_x1,
    re_data_in_2 => convert1_dout_net_x3,
    re_data_in_3 => convert2_dout_net_x0,
    re_data_in_4 => convert3_dout_net_x0,
    im_data_in_2 => convert1_dout_net_x2,
    im_data_in_3 => convert2_dout_net,
    im_data_in_4 => convert3_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    re_data_out_1 => convert0_dout_net_x0,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    im_data_out_1 => convert0_dout_net,
    re_data_out_2 => convert1_dout_net_x1,
    im_data_out_2 => convert1_dout_net_x0
  );
  fir_2_system_2 : entity xil_defaultlib.xsg_bwselector_fir_2_system_2 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    re_data_in_1 => convert0_dout_net_x0,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    im_data_in_1 => convert0_dout_net,
    re_data_in_2 => convert1_dout_net_x1,
    im_data_in_2 => convert1_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net,
    re_data_out => convert1_dout_net,
    im_data_out => convert_dout_net
  );
  ssr_converter_0 : entity xil_defaultlib.xsg_bwselector_ssr_converter_0 
  port map (
    re_valid_in => register3_q_net,
    re_data_in_1 => reinterpret0_output_port_net_x0,
    im_valid_in => register2_q_net,
    im_data_in_1 => reinterpret0_output_port_net,
    re_data_in_2 => reinterpret1_output_port_net_x0,
    re_data_in_3 => reinterpret2_output_port_net_x0,
    re_data_in_4 => reinterpret3_output_port_net,
    re_data_in_5 => reinterpret4_output_port_net_x0,
    re_data_in_6 => reinterpret5_output_port_net_x0,
    re_data_in_7 => reinterpret6_output_port_net_x0,
    re_data_in_8 => reinterpret7_output_port_net_x0,
    im_data_in_2 => reinterpret1_output_port_net,
    im_data_in_3 => reinterpret2_output_port_net,
    im_data_in_4 => reinterpret3_output_port_net_x0,
    im_data_in_5 => reinterpret4_output_port_net,
    im_data_in_6 => reinterpret5_output_port_net,
    im_data_in_7 => reinterpret6_output_port_net,
    im_data_in_8 => reinterpret7_output_port_net,
    re_data_out => concat1_y_net_x2,
    im_data_out => concat1_y_net_x1
  );
  ssr_converter_1 : entity xil_defaultlib.xsg_bwselector_ssr_converter_1 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    re_data_in_1 => convert0_dout_net_x2,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    im_data_in_1 => convert0_dout_net_x1,
    re_data_in_2 => convert1_dout_net_x3,
    re_data_in_3 => convert2_dout_net_x0,
    re_data_in_4 => convert3_dout_net_x0,
    im_data_in_2 => convert1_dout_net_x2,
    im_data_in_3 => convert2_dout_net,
    im_data_in_4 => convert3_dout_net,
    re_data_out => concat_y_net_x0,
    im_data_out => concat1_y_net_x0
  );
  ssr_converter_2 : entity xil_defaultlib.xsg_bwselector_ssr_converter_2 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    re_data_in_1 => convert0_dout_net_x0,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    im_data_in_1 => convert0_dout_net,
    re_data_in_2 => convert1_dout_net_x1,
    im_data_in_2 => convert1_dout_net_x0,
    re_data_out => concat_y_net,
    im_data_out => concat1_y_net
  );
  ssr_switch : entity xil_defaultlib.xsg_bwselector_ssr_switch 
  port map (
    sel => slice2_y_net,
    va0 => register3_q_net,
    vb0 => concat1_y_net_x2,
    vc0 => register2_q_net,
    vd0 => concat1_y_net_x1,
    va1 => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    vb1 => concat_y_net_x0,
    vc1 => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    vd1 => concat1_y_net_x0,
    va2 => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    vb2 => concat_y_net,
    vc2 => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    vd2 => concat1_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    va => mux_y_net,
    vb => mux1_y_net,
    vc => mux2_y_net,
    vd => mux3_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/FIR 0 System/Vector FIR
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_fir_x1 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_fir_x1;
architecture structural of xsg_bwselector_vector_fir_x1 is 
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert1_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_c8d77182473f1656541cf6b048d7f2a1 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert1_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/FIR 0 System/Vector FIR1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_fir1_x1 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_fir1_x1;
architecture structural of xsg_bwselector_vector_fir1_x1 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
begin
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_c8d77182473f1656541cf6b048d7f2a1 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/FIR 0 System
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_0_system is
  port (
    valid_in : in std_logic;
    re_in : in std_logic_vector( 16-1 downto 0 );
    im_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    valid_out : out std_logic;
    re_out : out std_logic_vector( 16-1 downto 0 );
    im_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_0_system;
architecture structural of xsg_bwselector_fir_0_system is 
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  re_out <= convert2_dout_net;
  im_out <= convert3_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= valid_in;
  convert1_dout_net <= re_in;
  convert_dout_net <= im_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  vector_fir : entity xil_defaultlib.xsg_bwselector_vector_fir_x1 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi => convert1_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  vector_fir1 : entity xil_defaultlib.xsg_bwselector_vector_fir1_x1 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi => convert_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert2 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert2_dout_net
  );
  convert3 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert3_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/FIR 1 System/Vector FIR
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_fir_x0 is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_fir_x0;
architecture structural of xsg_bwselector_vector_fir_x0 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal ce_net : std_logic;
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  mux3_y_net <= tvi;
  mux2_y_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_f17e7b34263bd652a7715aaef1b9ecd8 
  port map (
    s_axis_data_tvalid => mux3_y_net(0),
    s_axis_data_tdata_real => mux2_y_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/FIR 1 System/Vector FIR1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_fir1_x0 is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_fir1_x0;
architecture structural of xsg_bwselector_vector_fir1_x0 is 
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
begin
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  mux3_y_net <= tvi;
  mux1_y_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_f17e7b34263bd652a7715aaef1b9ecd8 
  port map (
    s_axis_data_tvalid => mux3_y_net(0),
    s_axis_data_tdata_real => mux1_y_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/FIR 1 System
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_1_system is
  port (
    valid_in : in std_logic_vector( 1-1 downto 0 );
    re_in : in std_logic_vector( 16-1 downto 0 );
    im_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    valid_out : out std_logic;
    re_out : out std_logic_vector( 16-1 downto 0 );
    im_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_1_system;
architecture structural of xsg_bwselector_fir_1_system is 
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal clk_net : std_logic;
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
begin
  valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  re_out <= convert2_dout_net;
  im_out <= convert3_dout_net;
  mux3_y_net <= valid_in;
  mux2_y_net <= re_in;
  mux1_y_net <= im_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  vector_fir : entity xil_defaultlib.xsg_bwselector_vector_fir_x0 
  port map (
    tvi => mux3_y_net,
    tdi => mux2_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  vector_fir1 : entity xil_defaultlib.xsg_bwselector_vector_fir1_x0 
  port map (
    tvi => mux3_y_net,
    tdi => mux1_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert2 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert2_dout_net
  );
  convert3 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert3_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/FIR 2 System/Vector FIR
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_fir is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_fir;
architecture structural of xsg_bwselector_vector_fir is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  mux3_y_net <= tvi;
  mux2_y_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2c2194d219c47f3851f897f8c2672424 
  port map (
    s_axis_data_tvalid => mux3_y_net(0),
    s_axis_data_tdata_real => mux2_y_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/FIR 2 System/Vector FIR1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_fir1 is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_fir1;
architecture structural of xsg_bwselector_vector_fir1 is 
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal ce_net : std_logic;
begin
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  mux3_y_net <= tvi;
  mux1_y_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2c2194d219c47f3851f897f8c2672424 
  port map (
    s_axis_data_tvalid => mux3_y_net(0),
    s_axis_data_tdata_real => mux1_y_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/FIR 2 System
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system is
  port (
    valid_in : in std_logic_vector( 1-1 downto 0 );
    re_in : in std_logic_vector( 16-1 downto 0 );
    im_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    valid_out : out std_logic;
    re_out : out std_logic_vector( 16-1 downto 0 );
    im_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system;
architecture structural of xsg_bwselector_fir_2_system is 
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
begin
  valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  re_out <= convert2_dout_net;
  im_out <= convert3_dout_net;
  mux3_y_net <= valid_in;
  mux2_y_net <= re_in;
  mux1_y_net <= im_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  vector_fir : entity xil_defaultlib.xsg_bwselector_vector_fir 
  port map (
    tvi => mux3_y_net,
    tdi => mux2_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  vector_fir1 : entity xil_defaultlib.xsg_bwselector_vector_fir1 
  port map (
    tvi => mux3_y_net,
    tdi => mux1_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert2 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert2_dout_net
  );
  convert3 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert3_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Switch 0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_switch_0 is
  port (
    sel : in std_logic_vector( 1-1 downto 0 );
    a0 : in std_logic;
    a1 : in std_logic;
    b0 : in std_logic_vector( 16-1 downto 0 );
    b1 : in std_logic_vector( 16-1 downto 0 );
    c0 : in std_logic_vector( 16-1 downto 0 );
    c1 : in std_logic_vector( 16-1 downto 0 );
    a : out std_logic_vector( 1-1 downto 0 );
    b : out std_logic_vector( 16-1 downto 0 );
    c : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_switch_0;
architecture structural of xsg_bwselector_switch_0 is 
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice_v_y_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  a <= mux3_y_net;
  b <= mux2_y_net;
  c <= mux1_y_net;
  slice_v_y_net <= sel;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= a0;
  fir_compiler_7_2_m_axis_data_tvalid_net <= a1;
  convert1_dout_net <= b0;
  convert2_dout_net <= b1;
  convert_dout_net <= c0;
  convert3_dout_net <= c1;
  mux1 : entity xil_defaultlib.sysgen_mux_5cfc090c81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => slice_v_y_net,
    d0 => convert_dout_net,
    d1 => convert3_dout_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_5cfc090c81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => slice_v_y_net,
    d0 => convert1_dout_net,
    d1 => convert2_dout_net,
    y => mux2_y_net
  );
  mux3 : entity xil_defaultlib.sysgen_mux_94065815e7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => slice_v_y_net,
    d0(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    d1(0) => fir_compiler_7_2_m_axis_data_tvalid_net,
    y => mux3_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Switch 1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_switch_1 is
  port (
    sel : in std_logic_vector( 1-1 downto 0 );
    a0 : in std_logic_vector( 1-1 downto 0 );
    a1 : in std_logic;
    b0 : in std_logic_vector( 16-1 downto 0 );
    b1 : in std_logic_vector( 16-1 downto 0 );
    c0 : in std_logic_vector( 16-1 downto 0 );
    c1 : in std_logic_vector( 16-1 downto 0 );
    a : out std_logic_vector( 1-1 downto 0 );
    b : out std_logic_vector( 16-1 downto 0 );
    c : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_switch_1;
architecture structural of xsg_bwselector_switch_1 is 
  signal mux3_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal mux1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal mux2_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
begin
  a <= mux3_y_net;
  b <= mux2_y_net;
  c <= mux1_y_net;
  logical1_y_net <= sel;
  mux3_y_net_x0 <= a0;
  fir_compiler_7_2_m_axis_data_tvalid_net <= a1;
  mux2_y_net_x0 <= b0;
  convert2_dout_net <= b1;
  mux1_y_net_x0 <= c0;
  convert3_dout_net <= c1;
  mux1 : entity xil_defaultlib.sysgen_mux_5cfc090c81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical1_y_net,
    d0 => mux1_y_net_x0,
    d1 => convert3_dout_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_5cfc090c81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical1_y_net,
    d0 => mux2_y_net_x0,
    d1 => convert2_dout_net,
    y => mux2_y_net
  );
  mux3 : entity xil_defaultlib.sysgen_mux_94065815e7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical1_y_net,
    d0 => mux3_y_net_x0,
    d1(0) => fir_compiler_7_2_m_axis_data_tvalid_net,
    y => mux3_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Switch 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_switch_2 is
  port (
    sel : in std_logic_vector( 1-1 downto 0 );
    a0 : in std_logic_vector( 1-1 downto 0 );
    a1 : in std_logic;
    b0 : in std_logic_vector( 16-1 downto 0 );
    b1 : in std_logic_vector( 16-1 downto 0 );
    c0 : in std_logic_vector( 16-1 downto 0 );
    c1 : in std_logic_vector( 16-1 downto 0 );
    a : out std_logic_vector( 1-1 downto 0 );
    b : out std_logic_vector( 16-1 downto 0 );
    c : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_switch_2;
architecture structural of xsg_bwselector_switch_2 is 
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal mux2_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  a <= mux3_y_net;
  b <= mux2_y_net;
  c <= mux1_y_net;
  logical_y_net <= sel;
  mux3_y_net_x0 <= a0;
  fir_compiler_7_2_m_axis_data_tvalid_net <= a1;
  mux2_y_net_x0 <= b0;
  convert2_dout_net <= b1;
  mux1_y_net_x0 <= c0;
  convert3_dout_net <= c1;
  mux1 : entity xil_defaultlib.sysgen_mux_5cfc090c81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical_y_net,
    d0 => mux1_y_net_x0,
    d1 => convert3_dout_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_5cfc090c81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical_y_net,
    d0 => mux2_y_net_x0,
    d1 => convert2_dout_net,
    y => mux2_y_net
  );
  mux3 : entity xil_defaultlib.sysgen_mux_94065815e7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical_y_net,
    d0 => mux3_y_net_x0,
    d1(0) => fir_compiler_7_2_m_axis_data_tvalid_net,
    y => mux3_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fine_decimator is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    decimation : in std_logic_vector( 3-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic_vector( 1-1 downto 0 );
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic_vector( 1-1 downto 0 );
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fine_decimator;
architecture structural of xsg_bwselector_fine_decimator is 
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal mux_y_net : std_logic_vector( 3-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert3_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert2_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal mux3_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal convert2_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal mux2_y_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux2_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice_v_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_w_y_net : std_logic_vector( 1-1 downto 0 );
begin
  re_valid_out <= mux3_y_net;
  re_data_out <= mux2_y_net;
  im_valid_out <= mux3_y_net;
  im_data_out <= mux1_y_net_x1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= re_valid_in;
  convert1_dout_net <= re_data_in;
  convert_dout_net <= im_data_in;
  mux_y_net <= decimation;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_0_system : entity xil_defaultlib.xsg_bwselector_fir_0_system 
  port map (
    valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    re_in => convert1_dout_net,
    im_in => convert_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    re_out => convert2_dout_net_x1,
    im_out => convert3_dout_net_x1
  );
  fir_1_system : entity xil_defaultlib.xsg_bwselector_fir_1_system 
  port map (
    valid_in => mux3_y_net_x0,
    re_in => mux2_y_net_x0,
    im_in => mux1_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    re_out => convert2_dout_net_x0,
    im_out => convert3_dout_net_x0
  );
  fir_2_system : entity xil_defaultlib.xsg_bwselector_fir_2_system 
  port map (
    valid_in => mux3_y_net_x1,
    re_in => mux2_y_net_x1,
    im_in => mux1_y_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    valid_out => fir_compiler_7_2_m_axis_data_tvalid_net,
    re_out => convert2_dout_net,
    im_out => convert3_dout_net
  );
  switch_0 : entity xil_defaultlib.xsg_bwselector_switch_0 
  port map (
    sel => slice_v_y_net,
    a0 => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    a1 => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    b0 => convert1_dout_net,
    b1 => convert2_dout_net_x1,
    c0 => convert_dout_net,
    c1 => convert3_dout_net_x1,
    a => mux3_y_net_x0,
    b => mux2_y_net_x0,
    c => mux1_y_net
  );
  switch_1 : entity xil_defaultlib.xsg_bwselector_switch_1 
  port map (
    sel => logical1_y_net,
    a0 => mux3_y_net_x0,
    a1 => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    b0 => mux2_y_net_x0,
    b1 => convert2_dout_net_x0,
    c0 => mux1_y_net,
    c1 => convert3_dout_net_x0,
    a => mux3_y_net_x1,
    b => mux2_y_net_x1,
    c => mux1_y_net_x0
  );
  switch_2 : entity xil_defaultlib.xsg_bwselector_switch_2 
  port map (
    sel => logical_y_net,
    a0 => mux3_y_net_x1,
    a1 => fir_compiler_7_2_m_axis_data_tvalid_net,
    b0 => mux2_y_net_x1,
    b1 => convert2_dout_net,
    c0 => mux1_y_net_x0,
    c1 => convert3_dout_net,
    a => mux3_y_net,
    b => mux2_y_net,
    c => mux1_y_net_x1
  );
  logical : entity xil_defaultlib.sysgen_logical_cbd80afd9a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_x_y_net,
    d1 => slice_w_y_net,
    d2 => slice_v_y_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_e7b2cf931e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_w_y_net,
    d1 => slice_v_y_net,
    y => logical1_y_net
  );
  slice_v : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 2,
    new_msb => 2,
    x_width => 3,
    y_width => 1
  )
  port map (
    x => mux_y_net,
    y => slice_v_y_net
  );
  slice_w : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 1,
    new_msb => 1,
    x_width => 3,
    y_width => 1
  )
  port map (
    x => mux_y_net,
    y => slice_w_y_net
  );
  slice_x : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 3,
    y_width => 1
  )
  port map (
    x => mux_y_net,
    y => slice_x_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/SSR Converter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_ssr_converter is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_ssr_converter;
architecture structural of xsg_bwselector_ssr_converter is 
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal constant_op_net : std_logic_vector( 112-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 1-1 downto 0 );
begin
  re_data_out <= concat_y_net;
  im_data_out <= concat1_y_net;
  mux3_y_net <= re_valid_in;
  mux2_y_net <= re_data_in;
  mux1_y_net <= im_data_in;
  concat : entity xil_defaultlib.sysgen_concat_b05fc24dc2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => constant_op_net,
    in1 => reinterpret_output_port_net,
    y => concat_y_net
  );
  concat1 : entity xil_defaultlib.sysgen_concat_b05fc24dc2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => constant_op_net,
    in1 => reinterpret1_output_port_net,
    y => concat1_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_1ff53682d3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => mux2_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => mux1_y_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/SSR Switch
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_ssr_switch_x0 is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in : in std_logic_vector( 128-1 downto 0 );
    im_data_in : in std_logic_vector( 128-1 downto 0 );
    ssr_re_valid_in : in std_logic_vector( 1-1 downto 0 );
    ssr_re_data_in : in std_logic_vector( 128-1 downto 0 );
    ssr_im_valid_in : in std_logic_vector( 1-1 downto 0 );
    ssr_im_data_in : in std_logic_vector( 128-1 downto 0 );
    decimation : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic_vector( 1-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_valid_out : out std_logic_vector( 1-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_ssr_switch_x0;
architecture structural of xsg_bwselector_ssr_switch_x0 is 
  signal mux3_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal ce_net : std_logic;
  signal mux1_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal mux3_y_net_x1 : std_logic_vector( 128-1 downto 0 );
begin
  re_valid_out <= mux_y_net;
  re_data_out <= mux1_y_net;
  im_valid_out <= mux2_y_net;
  im_data_out <= mux3_y_net;
  mux3_y_net_x0 <= re_valid_in;
  concat_y_net <= re_data_in;
  concat1_y_net <= im_data_in;
  mux_y_net_x0 <= ssr_re_valid_in;
  mux1_y_net_x0 <= ssr_re_data_in;
  mux2_y_net_x0 <= ssr_im_valid_in;
  mux3_y_net_x1 <= ssr_im_data_in;
  relational1_op_net <= decimation;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux : entity xil_defaultlib.sysgen_mux_1a4ba3d9a5 
  port map (
    clr => '0',
    sel => relational1_op_net,
    d0 => mux_y_net_x0,
    d1 => mux3_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_e03597c965 
  port map (
    clr => '0',
    sel => relational1_op_net,
    d0 => mux1_y_net_x0,
    d1 => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_1a4ba3d9a5 
  port map (
    clr => '0',
    sel => relational1_op_net,
    d0 => mux2_y_net_x0,
    d1 => mux3_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux2_y_net
  );
  mux3 : entity xil_defaultlib.sysgen_mux_e03597c965 
  port map (
    clr => '0',
    sel => relational1_op_net,
    d0 => mux3_y_net_x1,
    d1 => concat1_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux3_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_bandwidth_selector_core is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in_1 : in std_logic_vector( 16-1 downto 0 );
    decimation : in std_logic_vector( 32-1 downto 0 );
    re_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_5 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_6 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_7 : in std_logic_vector( 16-1 downto 0 );
    re_data_in_8 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_2 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_3 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_4 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_5 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_6 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_7 : in std_logic_vector( 16-1 downto 0 );
    im_data_in_8 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic_vector( 1-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_valid_out : out std_logic_vector( 1-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_bandwidth_selector_core;
architecture structural of xsg_bwselector_bandwidth_selector_core is 
  signal mux_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net_x1 : std_logic_vector( 128-1 downto 0 );
  signal mux2_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 3-1 downto 0 );
  signal slice2_y_net : std_logic_vector( 2-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 3-1 downto 0 );
  signal mux3_y_net_x1 : std_logic_vector( 128-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal reinterpret5_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal mux1_y_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal reinterpret7_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal register_q_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret2_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 3-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 3-1 downto 0 );
begin
  re_valid_out <= mux_y_net_x1;
  re_data_out <= mux1_y_net_x1;
  im_valid_out <= mux2_y_net_x1;
  im_data_out <= mux3_y_net_x1;
  register3_q_net <= re_valid_in;
  reinterpret0_output_port_net_x0 <= re_data_in_1;
  register2_q_net <= im_valid_in;
  reinterpret0_output_port_net <= im_data_in_1;
  register_q_net <= decimation;
  reinterpret1_output_port_net_x0 <= re_data_in_2;
  reinterpret2_output_port_net_x0 <= re_data_in_3;
  reinterpret3_output_port_net_x0 <= re_data_in_4;
  reinterpret4_output_port_net_x0 <= re_data_in_5;
  reinterpret5_output_port_net_x0 <= re_data_in_6;
  reinterpret6_output_port_net_x0 <= re_data_in_7;
  reinterpret7_output_port_net_x0 <= re_data_in_8;
  reinterpret1_output_port_net <= im_data_in_2;
  reinterpret2_output_port_net <= im_data_in_3;
  reinterpret3_output_port_net <= im_data_in_4;
  reinterpret4_output_port_net <= im_data_in_5;
  reinterpret5_output_port_net <= im_data_in_6;
  reinterpret6_output_port_net <= im_data_in_7;
  reinterpret7_output_port_net <= im_data_in_8;
  clk_net <= clk_1;
  ce_net <= ce_1;
  coarse_decimator : entity xil_defaultlib.xsg_bwselector_coarse_decimator 
  port map (
    re_valid_in => register3_q_net,
    re_data_in_1 => reinterpret0_output_port_net_x0,
    im_valid_in => register2_q_net,
    im_data_in_1 => reinterpret0_output_port_net,
    decimation => slice2_y_net,
    re_data_in_2 => reinterpret1_output_port_net_x0,
    re_data_in_3 => reinterpret2_output_port_net_x0,
    re_data_in_4 => reinterpret3_output_port_net_x0,
    re_data_in_5 => reinterpret4_output_port_net_x0,
    re_data_in_6 => reinterpret5_output_port_net_x0,
    re_data_in_7 => reinterpret6_output_port_net_x0,
    re_data_in_8 => reinterpret7_output_port_net_x0,
    im_data_in_2 => reinterpret1_output_port_net,
    im_data_in_3 => reinterpret2_output_port_net,
    im_data_in_4 => reinterpret3_output_port_net,
    im_data_in_5 => reinterpret4_output_port_net,
    im_data_in_6 => reinterpret5_output_port_net,
    im_data_in_7 => reinterpret6_output_port_net,
    im_data_in_8 => reinterpret7_output_port_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net,
    re_data_out => convert1_dout_net,
    im_data_out => convert_dout_net,
    ssr_re_valid_out => mux_y_net,
    ssr_re_data_out => mux1_y_net_x0,
    ssr_im_valid_out => mux2_y_net,
    ssr_im_data_out => mux3_y_net
  );
  fine_decimator : entity xil_defaultlib.xsg_bwselector_fine_decimator 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net,
    re_data_in => convert1_dout_net,
    im_data_in => convert_dout_net,
    decimation => mux_y_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => mux3_y_net_x0,
    re_data_out => mux2_y_net_x0,
    im_valid_out => mux3_y_net_x0,
    im_data_out => mux1_y_net
  );
  ssr_converter : entity xil_defaultlib.xsg_bwselector_ssr_converter 
  port map (
    re_valid_in => mux3_y_net_x0,
    re_data_in => mux2_y_net_x0,
    im_data_in => mux1_y_net,
    re_data_out => concat_y_net,
    im_data_out => concat1_y_net
  );
  ssr_switch : entity xil_defaultlib.xsg_bwselector_ssr_switch_x0 
  port map (
    re_valid_in => mux3_y_net_x0,
    re_data_in => concat_y_net,
    im_data_in => concat1_y_net,
    ssr_re_valid_in => mux_y_net,
    ssr_re_data_in => mux1_y_net_x0,
    ssr_im_valid_in => mux2_y_net,
    ssr_im_data_in => mux3_y_net,
    decimation => relational1_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => mux_y_net_x1,
    re_data_out => mux1_y_net_x1,
    im_valid_out => mux2_y_net_x1,
    im_data_out => mux3_y_net_x1
  );
  constant1 : entity xil_defaultlib.sysgen_constant_abffce7db1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_b25c9b5505 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_824b1345db 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => constant2_op_net,
    d1 => slice1_y_net,
    y => mux_y_net_x0
  );
  relational1 : entity xil_defaultlib.sysgen_relational_3caec802ba 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register_q_net,
    b => constant1_op_net,
    op => relational1_op_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 4,
    new_msb => 6,
    x_width => 32,
    y_width => 3
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
  slice2 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 1,
    new_msb => 2,
    x_width => 32,
    y_width => 2
  )
  port map (
    x => register_q_net,
    y => slice2_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_bandwidth_selector is
  port (
    s_axi_decimation : in std_logic_vector( 32-1 downto 0 );
    s_axis_im_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_im_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_re_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_im_tready : out std_logic_vector( 1-1 downto 0 );
    s_axis_re_tready : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_bandwidth_selector;
architecture structural of xsg_bwselector_bandwidth_selector is 
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal s_axis_re_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret3_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret7_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal s_axis_im_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal s_axis_re_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal register3_q_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal s_axi_decimation_net : std_logic_vector( 32-1 downto 0 );
  signal register2_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 128-1 downto 0 );
  signal s_axis_im_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  s_axi_decimation_net <= s_axi_decimation;
  m_axis_im_tdata <= register3_q_net_x0;
  m_axis_im_tvalid <= register2_q_net_x0;
  m_axis_re_tdata <= register1_q_net;
  m_axis_re_tvalid <= register_q_net;
  s_axis_im_tdata_net <= s_axis_im_tdata;
  s_axis_im_tready <= constant_op_net;
  s_axis_im_tvalid_net <= s_axis_im_tvalid;
  s_axis_re_tdata_net <= s_axis_re_tdata;
  s_axis_re_tready <= constant_op_net;
  s_axis_re_tvalid_net <= s_axis_re_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  axi_stream_master_interface : entity xil_defaultlib.xsg_bwselector_axi_stream_master_interface 
  port map (
    re_valid_in => mux_y_net,
    re_data_in => mux1_y_net,
    im_valid_in => mux2_y_net,
    im_data_in => mux3_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_im_tdata => register3_q_net_x0,
    m_axis_im_tvalid => register2_q_net_x0,
    m_axis_re_tdata => register1_q_net,
    m_axis_re_tvalid => register_q_net
  );
  axi_stream_slave_interface : entity xil_defaultlib.xsg_bwselector_axi_stream_slave_interface 
  port map (
    s_axis_im_tdata => s_axis_im_tdata_net,
    s_axis_im_tvalid => s_axis_im_tvalid_net,
    s_axis_re_tdata => s_axis_re_tdata_net,
    s_axis_re_tvalid => s_axis_re_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => register3_q_net,
    re_data_out_1 => reinterpret0_output_port_net_x0,
    im_valid_out => register2_q_net,
    im_data_out_1 => reinterpret0_output_port_net,
    re_data_out_2 => reinterpret1_output_port_net_x0,
    re_data_out_3 => reinterpret2_output_port_net_x0,
    re_data_out_4 => reinterpret3_output_port_net_x0,
    re_data_out_5 => reinterpret4_output_port_net_x0,
    re_data_out_6 => reinterpret5_output_port_net_x0,
    re_data_out_7 => reinterpret6_output_port_net_x0,
    re_data_out_8 => reinterpret7_output_port_net_x0,
    im_data_out_2 => reinterpret1_output_port_net,
    im_data_out_3 => reinterpret2_output_port_net,
    im_data_out_4 => reinterpret3_output_port_net,
    im_data_out_5 => reinterpret4_output_port_net,
    im_data_out_6 => reinterpret5_output_port_net,
    im_data_out_7 => reinterpret6_output_port_net,
    im_data_out_8 => reinterpret7_output_port_net,
    s_axis_im_tready => constant_op_net,
    s_axis_re_tready => constant_op_net
  );
  bandwidth_selector_core : entity xil_defaultlib.xsg_bwselector_bandwidth_selector_core 
  port map (
    re_valid_in => register3_q_net,
    re_data_in_1 => reinterpret0_output_port_net_x0,
    im_valid_in => register2_q_net,
    im_data_in_1 => reinterpret0_output_port_net,
    decimation => register_q_net_x0,
    re_data_in_2 => reinterpret1_output_port_net_x0,
    re_data_in_3 => reinterpret2_output_port_net_x0,
    re_data_in_4 => reinterpret3_output_port_net_x0,
    re_data_in_5 => reinterpret4_output_port_net_x0,
    re_data_in_6 => reinterpret5_output_port_net_x0,
    re_data_in_7 => reinterpret6_output_port_net_x0,
    re_data_in_8 => reinterpret7_output_port_net_x0,
    im_data_in_2 => reinterpret1_output_port_net,
    im_data_in_3 => reinterpret2_output_port_net,
    im_data_in_4 => reinterpret3_output_port_net,
    im_data_in_5 => reinterpret4_output_port_net,
    im_data_in_6 => reinterpret5_output_port_net,
    im_data_in_7 => reinterpret6_output_port_net,
    im_data_in_8 => reinterpret7_output_port_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => mux_y_net,
    re_data_out => mux1_y_net,
    im_valid_out => mux2_y_net,
    im_data_out => mux3_y_net
  );
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axi_decimation_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net_x0
  );
end structural;
-- Generated from Simulink block xsg_bwselector_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_struct is
  port (
    s_axi_decimation : in std_logic_vector( 32-1 downto 0 );
    s_axis_im_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_im_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_re_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_im_tready : out std_logic_vector( 1-1 downto 0 );
    s_axis_re_tready : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_struct;
architecture structural of xsg_bwselector_struct is 
  signal s_axis_re_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal s_axi_decimation_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_re_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_im_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal clk_net : std_logic;
  signal register3_q_net : std_logic_vector( 128-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 128-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_im_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
begin
  s_axi_decimation_net <= s_axi_decimation;
  m_axis_im_tdata <= register3_q_net;
  m_axis_im_tvalid <= register2_q_net;
  m_axis_re_tdata <= register1_q_net;
  m_axis_re_tvalid <= register_q_net;
  s_axis_im_tdata_net <= s_axis_im_tdata;
  s_axis_im_tready <= constant_op_net;
  s_axis_im_tvalid_net <= s_axis_im_tvalid;
  s_axis_re_tdata_net <= s_axis_re_tdata;
  s_axis_re_tready <= constant_op_net;
  s_axis_re_tvalid_net <= s_axis_re_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  bandwidth_selector : entity xil_defaultlib.xsg_bwselector_bandwidth_selector 
  port map (
    s_axi_decimation => s_axi_decimation_net,
    s_axis_im_tdata => s_axis_im_tdata_net,
    s_axis_im_tvalid => s_axis_im_tvalid_net,
    s_axis_re_tdata => s_axis_re_tdata_net,
    s_axis_re_tvalid => s_axis_re_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_im_tdata => register3_q_net,
    m_axis_im_tvalid => register2_q_net,
    m_axis_re_tdata => register1_q_net,
    m_axis_re_tvalid => register_q_net,
    s_axis_im_tready => constant_op_net,
    s_axis_re_tready => constant_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_default_clock_driver is
  port (
    xsg_bwselector_sysclk : in std_logic;
    xsg_bwselector_sysce : in std_logic;
    xsg_bwselector_sysclr : in std_logic;
    xsg_bwselector_clk1 : out std_logic;
    xsg_bwselector_ce1 : out std_logic
  );
end xsg_bwselector_default_clock_driver;
architecture structural of xsg_bwselector_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => xsg_bwselector_sysclk,
    sysce => xsg_bwselector_sysce,
    sysclr => xsg_bwselector_sysclr,
    clk => xsg_bwselector_clk1,
    ce => xsg_bwselector_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector is
  port (
    s_axis_im_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    xsg_bwselector_aresetn : in std_logic;
    xsg_bwselector_s_axi_awaddr : in std_logic;
    xsg_bwselector_s_axi_awvalid : in std_logic;
    xsg_bwselector_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    xsg_bwselector_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    xsg_bwselector_s_axi_wvalid : in std_logic;
    xsg_bwselector_s_axi_bready : in std_logic;
    xsg_bwselector_s_axi_araddr : in std_logic;
    xsg_bwselector_s_axi_arvalid : in std_logic;
    xsg_bwselector_s_axi_rready : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_im_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_re_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_im_tready : out std_logic_vector( 1-1 downto 0 );
    s_axis_re_tready : out std_logic_vector( 1-1 downto 0 );
    xsg_bwselector_s_axi_awready : out std_logic;
    xsg_bwselector_s_axi_wready : out std_logic;
    xsg_bwselector_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    xsg_bwselector_s_axi_bvalid : out std_logic;
    xsg_bwselector_s_axi_arready : out std_logic;
    xsg_bwselector_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    xsg_bwselector_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    xsg_bwselector_s_axi_rvalid : out std_logic
  );
end xsg_bwselector;
architecture structural of xsg_bwselector is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "xsg_bwselector,sysgen_core_2020_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=3.90625,system_simulink_period=3.90625e-09,waveform_viewer=0,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=1.6e-05,concat=12,constant=6,convert=20,fir_compiler_v7_2=12,logical=2,mux=18,register=9,reinterpret=46,relational=1,slice=21,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
  signal s_axi_decimation : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
begin
  xsg_bwselector_axi_lite_interface : entity xil_defaultlib.xsg_bwselector_axi_lite_interface 
  port map (
    xsg_bwselector_s_axi_awaddr => xsg_bwselector_s_axi_awaddr,
    xsg_bwselector_s_axi_awvalid => xsg_bwselector_s_axi_awvalid,
    xsg_bwselector_s_axi_wdata => xsg_bwselector_s_axi_wdata,
    xsg_bwselector_s_axi_wstrb => xsg_bwselector_s_axi_wstrb,
    xsg_bwselector_s_axi_wvalid => xsg_bwselector_s_axi_wvalid,
    xsg_bwselector_s_axi_bready => xsg_bwselector_s_axi_bready,
    xsg_bwselector_s_axi_araddr => xsg_bwselector_s_axi_araddr,
    xsg_bwselector_s_axi_arvalid => xsg_bwselector_s_axi_arvalid,
    xsg_bwselector_s_axi_rready => xsg_bwselector_s_axi_rready,
    xsg_bwselector_aresetn => xsg_bwselector_aresetn,
    xsg_bwselector_aclk => clk,
    s_axi_decimation => s_axi_decimation,
    xsg_bwselector_s_axi_awready => xsg_bwselector_s_axi_awready,
    xsg_bwselector_s_axi_wready => xsg_bwselector_s_axi_wready,
    xsg_bwselector_s_axi_bresp => xsg_bwselector_s_axi_bresp,
    xsg_bwselector_s_axi_bvalid => xsg_bwselector_s_axi_bvalid,
    xsg_bwselector_s_axi_arready => xsg_bwselector_s_axi_arready,
    xsg_bwselector_s_axi_rdata => xsg_bwselector_s_axi_rdata,
    xsg_bwselector_s_axi_rresp => xsg_bwselector_s_axi_rresp,
    xsg_bwselector_s_axi_rvalid => xsg_bwselector_s_axi_rvalid,
    clk => clk_net
  );
  xsg_bwselector_default_clock_driver : entity xil_defaultlib.xsg_bwselector_default_clock_driver 
  port map (
    xsg_bwselector_sysclk => clk_net,
    xsg_bwselector_sysce => '1',
    xsg_bwselector_sysclr => '0',
    xsg_bwselector_clk1 => clk_1_net,
    xsg_bwselector_ce1 => ce_1_net
  );
  xsg_bwselector_struct : entity xil_defaultlib.xsg_bwselector_struct 
  port map (
    s_axi_decimation => s_axi_decimation,
    s_axis_im_tdata => s_axis_im_tdata,
    s_axis_im_tvalid => s_axis_im_tvalid,
    s_axis_re_tdata => s_axis_re_tdata,
    s_axis_re_tvalid => s_axis_re_tvalid,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    m_axis_im_tdata => m_axis_im_tdata,
    m_axis_im_tvalid => m_axis_im_tvalid,
    m_axis_re_tdata => m_axis_re_tdata,
    m_axis_re_tvalid => m_axis_re_tvalid,
    s_axis_im_tready => s_axis_im_tready,
    s_axis_re_tready => s_axis_re_tready
  );
end structural;
