-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_window\mw_window_src_Direct_Memory_Access.vhd
-- Created: 2020-12-24 09:34:16
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_window_src_Direct_Memory_Access
-- Source Path: mw_window/mw_window/Direct Memory Access
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mw_window_src_Direct_Memory_Access IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        axim_rd_s2m_rd_aready             :   IN    std_logic;
        axim_rd_s2m_rd_dvalid             :   IN    std_logic;
        axim_rd_data                      :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        Length                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Address                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Enable_DMA                        :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        ram_wr_data                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        ram_wr_addr                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        ram_wren                          :   OUT   std_logic;
        dma_read_ready                    :   OUT   std_logic;
        axim_rd_m2s_rd_addr               :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        axim_rd_m2s_rd_len                :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        axim_rd_m2s_rd_avalid             :   OUT   std_logic
        );
END mw_window_src_Direct_Memory_Access;


ARCHITECTURE rtl OF mw_window_src_Direct_Memory_Access IS

  -- Component Declarations
  COMPONENT mw_window_src_EdgeDetection
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In1                             :   IN    std_logic;  -- ufix1
          Out1                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT mw_window_src_DDR_Read_Controller
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          length_in                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          address                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          start                           :   IN    std_logic;
          rd_aready                       :   IN    std_logic;
          rd_dvalid                       :   IN    std_logic;
          valid_out                       :   OUT   std_logic;
          count_out                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          ready_out                       :   OUT   std_logic;
          rd_addr                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          rd_len                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          rd_avalid                       :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : mw_window_src_EdgeDetection
    USE ENTITY work.mw_window_src_EdgeDetection(rtl);

  FOR ALL : mw_window_src_DDR_Read_Controller
    USE ENTITY work.mw_window_src_DDR_Read_Controller(rtl);

  -- Signals
  SIGNAL Enable_DMA_unsigned              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Bit_Slice_out1                   : std_logic;  -- ufix1
  SIGNAL EdgeDetection_out1               : std_logic;
  SIGNAL rd_aready                        : std_logic;
  SIGNAL rd_dvalid                        : std_logic;
  SIGNAL valid_out                        : std_logic;
  SIGNAL count_out                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL ready_out                        : std_logic;
  SIGNAL rd_addr                          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_len                           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL rd_avalid                        : std_logic;

BEGIN
  u_EdgeDetection : mw_window_src_EdgeDetection
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              In1 => Bit_Slice_out1,  -- ufix1
              Out1 => EdgeDetection_out1
              );

  u_DDR_Read_Controller : mw_window_src_DDR_Read_Controller
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              length_in => Length,  -- uint32
              address => Address,  -- uint32
              start => EdgeDetection_out1,
              rd_aready => rd_aready,
              rd_dvalid => rd_dvalid,
              valid_out => valid_out,
              count_out => count_out,  -- uint16
              ready_out => ready_out,
              rd_addr => rd_addr,  -- uint32
              rd_len => rd_len,  -- uint16
              rd_avalid => rd_avalid
              );

  Enable_DMA_unsigned <= unsigned(Enable_DMA);

  Bit_Slice_out1 <= Enable_DMA_unsigned(0);

  rd_aready <= axim_rd_s2m_rd_aready;

  rd_dvalid <= axim_rd_s2m_rd_dvalid;

  ram_wr_data <= axim_rd_data;

  ram_wr_addr <= count_out;

  ram_wren <= valid_out;

  dma_read_ready <= ready_out;

  axim_rd_m2s_rd_addr <= rd_addr;

  axim_rd_m2s_rd_len <= rd_len;

  axim_rd_m2s_rd_avalid <= rd_avalid;

END rtl;

