-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_autodma\mw_autodma_reset_hold.vhd
-- Created: 2020-12-24 09:17:20
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_autodma_reset_hold
-- Source Path: mw_autodma/mw_autodma_axi_lite/mw_autodma_axi_lite_module/mw_autodma_reset_hold
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mw_autodma_reset_hold IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        reset_in                          :   IN    std_logic;  -- ufix1
        in_burst                          :   IN    std_logic;  -- ufix1
        reset_out                         :   OUT   std_logic;  -- ufix1
        reset_pending                     :   OUT   std_logic  -- ufix1
        );
END mw_autodma_reset_hold;


ARCHITECTURE rtl OF mw_autodma_reset_hold IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL reset_hold_module_hstate         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL reset_hold_module_reset_out_reg  : std_logic;
  SIGNAL reset_hold_module_reset_pending_reg : std_logic;
  SIGNAL reset_hold_module_hstate_next    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL reset_hold_module_reset_out_reg_next : std_logic;
  SIGNAL reset_hold_module_reset_pending_reg_next : std_logic;

BEGIN
  const_1 <= '1';

  enb <= const_1;

  reset_hold_module_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reset_hold_module_hstate <= to_unsigned(16#00#, 8);
      reset_hold_module_reset_out_reg <= '0';
      reset_hold_module_reset_pending_reg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        reset_hold_module_hstate <= reset_hold_module_hstate_next;
        reset_hold_module_reset_out_reg <= reset_hold_module_reset_out_reg_next;
        reset_hold_module_reset_pending_reg <= reset_hold_module_reset_pending_reg_next;
      END IF;
    END IF;
  END PROCESS reset_hold_module_process;

  reset_hold_module_output : PROCESS (in_burst, reset_hold_module_hstate, reset_hold_module_reset_out_reg,
       reset_hold_module_reset_pending_reg, reset_in)
    VARIABLE reset_in1 : std_logic;
    VARIABLE in_burst1 : std_logic;
  BEGIN
    reset_hold_module_hstate_next <= reset_hold_module_hstate;
    reset_hold_module_reset_out_reg_next <= reset_hold_module_reset_out_reg;
    reset_hold_module_reset_pending_reg_next <= reset_hold_module_reset_pending_reg;
    IF reset_in /= '0' THEN 
      reset_in1 := '1';
    ELSE 
      reset_in1 := '0';
    END IF;
    IF in_burst /= '0' THEN 
      in_burst1 := '1';
    ELSE 
      in_burst1 := '0';
    END IF;
    CASE reset_hold_module_hstate IS
      WHEN "00000000" =>
        IF in_burst1 = '1' THEN 
          reset_hold_module_reset_out_reg_next <= '0';
          IF reset_in1 = '1' THEN 
            reset_hold_module_reset_pending_reg_next <= '1';
            reset_hold_module_hstate_next <= to_unsigned(16#02#, 8);
          ELSE 
            reset_hold_module_reset_pending_reg_next <= '0';
            reset_hold_module_hstate_next <= to_unsigned(16#01#, 8);
          END IF;
        ELSE 
          reset_hold_module_reset_out_reg_next <= reset_in1;
          reset_hold_module_reset_pending_reg_next <= '0';
        END IF;
      WHEN "00000001" =>
        IF ( NOT in_burst1) = '1' THEN 
          reset_hold_module_reset_out_reg_next <= reset_in1;
          reset_hold_module_reset_pending_reg_next <= '0';
          reset_hold_module_hstate_next <= to_unsigned(16#00#, 8);
        ELSIF reset_in1 = '1' THEN 
          reset_hold_module_reset_out_reg_next <= '0';
          reset_hold_module_reset_pending_reg_next <= '1';
          reset_hold_module_hstate_next <= to_unsigned(16#02#, 8);
        ELSE 
          reset_hold_module_reset_out_reg_next <= '0';
          reset_hold_module_reset_pending_reg_next <= '0';
        END IF;
      WHEN "00000010" =>
        reset_hold_module_reset_out_reg_next <= '0';
        reset_hold_module_reset_pending_reg_next <= '1';
        IF ( NOT in_burst1) = '1' THEN 
          reset_hold_module_hstate_next <= to_unsigned(16#03#, 8);
        END IF;
      WHEN "00000011" =>
        reset_hold_module_reset_out_reg_next <= '1';
        reset_hold_module_reset_pending_reg_next <= '1';
        reset_hold_module_hstate_next <= to_unsigned(16#00#, 8);
      WHEN OTHERS => 
        reset_hold_module_hstate_next <= to_unsigned(16#00#, 8);
    END CASE;
    reset_out <= reset_hold_module_reset_out_reg;
    reset_pending <= reset_hold_module_reset_pending_reg;
  END PROCESS reset_hold_module_output;


END rtl;

