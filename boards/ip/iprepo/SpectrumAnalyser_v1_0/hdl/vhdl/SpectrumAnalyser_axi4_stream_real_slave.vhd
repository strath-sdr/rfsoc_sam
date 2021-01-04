-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_axi4_stream_real_slave.vhd
-- Created: 2021-01-04 00:55:10
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_axi4_stream_real_slave
-- Source Path: SpectrumAnalyser/SpectrumAnalyser_axi4_stream_real_slave
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_axi4_stream_real_slave IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        AXI4_Stream_Real_Slave_TDATA      :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        AXI4_Stream_Real_Slave_TVALID     :   IN    std_logic;  -- ufix1
        AXI4_Stream_Real_Slave_TREADY     :   OUT   std_logic;  -- ufix1
        user_data                         :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        user_valid                        :   OUT   std_logic  -- ufix1
        );
END SpectrumAnalyser_axi4_stream_real_slave;


ARCHITECTURE rtl OF SpectrumAnalyser_axi4_stream_real_slave IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser_fifo_data
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          Empty                           :   OUT   std_logic;  -- ufix1
          Full                            :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser_fifo_data
    USE ENTITY work.SpectrumAnalyser_fifo_data(rtl);

  -- Signals
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL fifo_rd_ack                      : std_logic;  -- ufix1
  SIGNAL stream_in_user_data              : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL fifo_empty                       : std_logic;  -- ufix1
  SIGNAL fifo_full                        : std_logic;  -- ufix1
  SIGNAL fifo_empty_neg                   : std_logic;  -- ufix1
  SIGNAL stream_in_user_valid             : std_logic;  -- ufix1

BEGIN
  u_SpectrumAnalyser_fifo_data_inst : SpectrumAnalyser_fifo_data
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              In_rsvd => AXI4_Stream_Real_Slave_TDATA,  -- ufix128
              Push => AXI4_Stream_Real_Slave_TVALID,  -- ufix1
              Pop => fifo_rd_ack,  -- ufix1
              Out_rsvd => stream_in_user_data,  -- ufix128
              Empty => fifo_empty,  -- ufix1
              Full => fifo_full  -- ufix1
              );

  const_1 <= '1';

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      fifo_rd_ack <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        fifo_rd_ack <= const_1;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  AXI4_Stream_Real_Slave_TREADY <=  NOT fifo_full;

  fifo_empty_neg <=  NOT fifo_empty;

  stream_in_user_valid <= fifo_empty_neg AND fifo_rd_ack;

  user_valid <= stream_in_user_valid;

  user_data <= stream_in_user_data;

END rtl;

