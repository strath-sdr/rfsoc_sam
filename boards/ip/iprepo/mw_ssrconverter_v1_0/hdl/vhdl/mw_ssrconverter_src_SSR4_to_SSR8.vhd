-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_ssrconverter\mw_ssrconverter_src_SSR4_to_SSR8.vhd
-- Created: 2020-12-22 10:57:15
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_ssrconverter_src_SSR4_to_SSR8
-- Source Path: mw_ssrconverter/SSR Subset Converter/SSR Serializer Imag/SSR4 to SSR8
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.mw_ssrconverter_src_SSR_Subset_Converter_pkg.ALL;

ENTITY mw_ssrconverter_src_SSR4_to_SSR8 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Data_In                           :   IN    vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
        Index                             :   IN    std_logic;  -- ufix1
        Data_Out                          :   OUT   vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
        Valid_Out                         :   OUT   std_logic
        );
END mw_ssrconverter_src_SSR4_to_SSR8;


ARCHITECTURE rtl OF mw_ssrconverter_src_SSR4_to_SSR8 IS

  -- Signals
  SIGNAL Compare_To_Constant12_out1       : std_logic;
  SIGNAL Selector13_out1                  : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Unit_Delay_Enabled_Synchronous1_out1 : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Compare_To_Constant13_out1       : std_logic;
  SIGNAL Selector14_out1                  : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Vector_Concatenate_out1          : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL Unit_Delay_out1                  : std_logic;

BEGIN
  
  Compare_To_Constant12_out1 <= '1' WHEN Index = '0' ELSE
      '0';

  Selector13_out1(0) <= unsigned(Data_In(0));
  Selector13_out1(1) <= unsigned(Data_In(1));
  Selector13_out1(2) <= unsigned(Data_In(2));
  Selector13_out1(3) <= unsigned(Data_In(3));

  Unit_Delay_Enabled_Synchronous1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous1_out1 <= (OTHERS => to_unsigned(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND Compare_To_Constant12_out1 = '1' THEN
        Unit_Delay_Enabled_Synchronous1_out1 <= Selector13_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous1_process;


  
  Compare_To_Constant13_out1 <= '1' WHEN Index = '1' ELSE
      '0';

  Selector14_out1(0) <= unsigned(Data_In(0));
  Selector14_out1(1) <= unsigned(Data_In(1));
  Selector14_out1(2) <= unsigned(Data_In(2));
  Selector14_out1(3) <= unsigned(Data_In(3));

  Unit_Delay_Enabled_Synchronous_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous_out1 <= (OTHERS => to_unsigned(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND Compare_To_Constant13_out1 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= Selector14_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_process;


  Vector_Concatenate_out1(0) <= Unit_Delay_Enabled_Synchronous1_out1(0);
  Vector_Concatenate_out1(1) <= Unit_Delay_Enabled_Synchronous1_out1(1);
  Vector_Concatenate_out1(2) <= Unit_Delay_Enabled_Synchronous1_out1(2);
  Vector_Concatenate_out1(3) <= Unit_Delay_Enabled_Synchronous1_out1(3);
  Vector_Concatenate_out1(4) <= Unit_Delay_Enabled_Synchronous_out1(0);
  Vector_Concatenate_out1(5) <= Unit_Delay_Enabled_Synchronous_out1(1);
  Vector_Concatenate_out1(6) <= Unit_Delay_Enabled_Synchronous_out1(2);
  Vector_Concatenate_out1(7) <= Unit_Delay_Enabled_Synchronous_out1(3);

  outputgen: FOR k IN 0 TO 7 GENERATE
    Data_Out(k) <= std_logic_vector(Vector_Concatenate_out1(k));
  END GENERATE;

  Unit_Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay_out1 <= Compare_To_Constant13_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  Valid_Out <= Unit_Delay_out1;

END rtl;
