-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity xsg_bwselector_stub is
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
end xsg_bwselector_stub;
architecture structural of xsg_bwselector_stub is 
begin
  sysgen_dut : entity xil_defaultlib.xsg_bwselector_0 
  port map (
    s_axis_im_tdata => s_axis_im_tdata,
    s_axis_im_tvalid => s_axis_im_tvalid,
    s_axis_re_tdata => s_axis_re_tdata,
    s_axis_re_tvalid => s_axis_re_tvalid,
    clk => clk,
    xsg_bwselector_aresetn => xsg_bwselector_aresetn,
    xsg_bwselector_s_axi_awaddr => xsg_bwselector_s_axi_awaddr,
    xsg_bwselector_s_axi_awvalid => xsg_bwselector_s_axi_awvalid,
    xsg_bwselector_s_axi_wdata => xsg_bwselector_s_axi_wdata,
    xsg_bwselector_s_axi_wstrb => xsg_bwselector_s_axi_wstrb,
    xsg_bwselector_s_axi_wvalid => xsg_bwselector_s_axi_wvalid,
    xsg_bwselector_s_axi_bready => xsg_bwselector_s_axi_bready,
    xsg_bwselector_s_axi_araddr => xsg_bwselector_s_axi_araddr,
    xsg_bwselector_s_axi_arvalid => xsg_bwselector_s_axi_arvalid,
    xsg_bwselector_s_axi_rready => xsg_bwselector_s_axi_rready,
    m_axis_im_tdata => m_axis_im_tdata,
    m_axis_im_tvalid => m_axis_im_tvalid,
    m_axis_re_tdata => m_axis_re_tdata,
    m_axis_re_tvalid => m_axis_re_tvalid,
    s_axis_im_tready => s_axis_im_tready,
    s_axis_re_tready => s_axis_re_tready,
    xsg_bwselector_s_axi_awready => xsg_bwselector_s_axi_awready,
    xsg_bwselector_s_axi_wready => xsg_bwselector_s_axi_wready,
    xsg_bwselector_s_axi_bresp => xsg_bwselector_s_axi_bresp,
    xsg_bwselector_s_axi_bvalid => xsg_bwselector_s_axi_bvalid,
    xsg_bwselector_s_axi_arready => xsg_bwselector_s_axi_arready,
    xsg_bwselector_s_axi_rdata => xsg_bwselector_s_axi_rdata,
    xsg_bwselector_s_axi_rresp => xsg_bwselector_s_axi_rresp,
    xsg_bwselector_s_axi_rvalid => xsg_bwselector_s_axi_rvalid
  );
end structural;
