--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Sun Jan  3 21:10:19 2021
--Host        : DESKTOP-2K5Q0I9 running 64-bit major release  (build 9200)
--Command     : generate_target xsg_bwselector_bd_wrapper.bd
--Design      : xsg_bwselector_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xsg_bwselector_bd_wrapper is
  port (
    CLK_IN1_D_clk_n : in STD_LOGIC;
    CLK_IN1_D_clk_p : in STD_LOGIC;
    m_axis_im_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_im_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_re_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_re_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset_rtl : in STD_LOGIC;
    s_axis_im_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_im_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_im_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_re_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_re_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_re_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end xsg_bwselector_bd_wrapper;

architecture STRUCTURE of xsg_bwselector_bd_wrapper is
  component xsg_bwselector_bd is
  port (
    CLK_IN1_D_clk_n : in STD_LOGIC;
    CLK_IN1_D_clk_p : in STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    m_axis_im_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_im_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_re_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_re_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_im_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_im_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_im_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_re_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_re_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_re_tready : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component xsg_bwselector_bd;
begin
xsg_bwselector_bd_i: component xsg_bwselector_bd
     port map (
      CLK_IN1_D_clk_n => CLK_IN1_D_clk_n,
      CLK_IN1_D_clk_p => CLK_IN1_D_clk_p,
      m_axis_im_tdata(127 downto 0) => m_axis_im_tdata(127 downto 0),
      m_axis_im_tvalid(0) => m_axis_im_tvalid(0),
      m_axis_re_tdata(127 downto 0) => m_axis_re_tdata(127 downto 0),
      m_axis_re_tvalid(0) => m_axis_re_tvalid(0),
      reset_rtl => reset_rtl,
      s_axis_im_tdata(127 downto 0) => s_axis_im_tdata(127 downto 0),
      s_axis_im_tready(0) => s_axis_im_tready(0),
      s_axis_im_tvalid(0) => s_axis_im_tvalid(0),
      s_axis_re_tdata(127 downto 0) => s_axis_re_tdata(127 downto 0),
      s_axis_re_tready(0) => s_axis_re_tready(0),
      s_axis_re_tvalid(0) => s_axis_re_tvalid(0)
    );
end STRUCTURE;
