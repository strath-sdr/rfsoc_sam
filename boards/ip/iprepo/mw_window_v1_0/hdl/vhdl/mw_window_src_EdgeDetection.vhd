-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_window\mw_window_src_EdgeDetection.vhd
-- Created: 2020-12-24 09:34:16
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_window_src_EdgeDetection
-- Source Path: mw_window/mw_window/Direct Memory Access/EdgeDetection
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mw_window_src_EdgeDetection IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        In1                               :   IN    std_logic;  -- ufix1
        Out1                              :   OUT   std_logic
        );
END mw_window_src_EdgeDetection;


ARCHITECTURE rtl OF mw_window_src_EdgeDetection IS

  -- Signals
  SIGNAL Delay_out1                       : std_logic;  -- ufix1
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;

BEGIN
  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay_out1 <= In1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Logical_Operator1_out1 <=  NOT Delay_out1;

  Logical_Operator_out1 <= Logical_Operator1_out1 AND In1;

  Out1 <= Logical_Operator_out1;

END rtl;
