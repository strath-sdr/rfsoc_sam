-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_window\mw_window_axi4_stream_real_master.vhd
-- Created: 2020-12-23 15:04:51
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_window_axi4_stream_real_master
-- Source Path: mw_window/mw_window_axi4_stream_real_master
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mw_window_axi4_stream_real_master IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        AXI4_Stream_Real_Master_TREADY    :   IN    std_logic;  -- ufix1
        user_data                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        user_valid                        :   IN    std_logic;  -- ufix1
        user_TLAST                        :   IN    std_logic;  -- ufix1
        user_TUSER                        :   IN    std_logic;  -- ufix1
        AXI4_Stream_Real_Master_TDATA     :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Stream_Real_Master_TVALID    :   OUT   std_logic;  -- ufix1
        AXI4_Stream_Real_Master_TLAST     :   OUT   std_logic;  -- ufix1
        AXI4_Stream_Real_Master_TUSER     :   OUT   std_logic  -- ufix1
        );
END mw_window_axi4_stream_real_master;


ARCHITECTURE rtl OF mw_window_axi4_stream_real_master IS

  -- Component Declarations
  COMPONENT mw_window_fifo_data_OUT
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          Empty                           :   OUT   std_logic;  -- ufix1
          AFull                           :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT mw_window_fifo_TLAST_OUT
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;  -- ufix1
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT mw_window_fifo_TUSER_OUT
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;  -- ufix1
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : mw_window_fifo_data_OUT
    USE ENTITY work.mw_window_fifo_data_OUT(rtl);

  FOR ALL : mw_window_fifo_TLAST_OUT
    USE ENTITY work.mw_window_fifo_TLAST_OUT(rtl);

  FOR ALL : mw_window_fifo_TUSER_OUT
    USE ENTITY work.mw_window_fifo_TUSER_OUT(rtl);

  -- Signals
  SIGNAL AXI4_Stream_Real_Master_TDATA_tmp : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL fifo_empty_data                  : std_logic;  -- ufix1
  SIGNAL fifo_afull_data                  : std_logic;  -- ufix1

BEGIN
  u_mw_window_fifo_data_OUT_inst : mw_window_fifo_data_OUT
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              In_rsvd => user_data,  -- ufix16
              Push => user_valid,  -- ufix1
              Pop => AXI4_Stream_Real_Master_TREADY,  -- ufix1
              Out_rsvd => AXI4_Stream_Real_Master_TDATA_tmp,  -- ufix16
              Empty => fifo_empty_data,  -- ufix1
              AFull => fifo_afull_data  -- ufix1
              );

  u_mw_window_fifo_TLAST_OUT_inst : mw_window_fifo_TLAST_OUT
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              In_rsvd => user_TLAST,  -- ufix1
              Push => user_valid,  -- ufix1
              Pop => AXI4_Stream_Real_Master_TREADY,  -- ufix1
              Out_rsvd => AXI4_Stream_Real_Master_TLAST  -- ufix1
              );

  u_mw_window_fifo_TUSER_OUT_inst : mw_window_fifo_TUSER_OUT
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              In_rsvd => user_TUSER,  -- ufix1
              Push => user_valid,  -- ufix1
              Pop => AXI4_Stream_Real_Master_TREADY,  -- ufix1
              Out_rsvd => AXI4_Stream_Real_Master_TUSER  -- ufix1
              );

  AXI4_Stream_Real_Master_TVALID <=  NOT fifo_empty_data;

  AXI4_Stream_Real_Master_TDATA <= AXI4_Stream_Real_Master_TDATA_tmp;

END rtl;

