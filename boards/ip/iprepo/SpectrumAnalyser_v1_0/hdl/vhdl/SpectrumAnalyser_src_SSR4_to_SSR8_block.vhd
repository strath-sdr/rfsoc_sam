-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_SSR4_to_SSR8_block.vhd
-- Created: 2021-01-04 00:54:55
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_SSR4_to_SSR8_block
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Serializer Real/SSR4 to SSR
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.SpectrumAnalyser_src_Spectrum_Analyser_pkg.ALL;

ENTITY SpectrumAnalyser_src_SSR4_to_SSR8_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Data_In                           :   IN    vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
        Index                             :   IN    std_logic;  -- ufix1
        Data_Out                          :   OUT   vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
        Valid_Out                         :   OUT   std_logic
        );
END SpectrumAnalyser_src_SSR4_to_SSR8_block;


ARCHITECTURE rtl OF SpectrumAnalyser_src_SSR4_to_SSR8_block IS

  -- Signals
  SIGNAL Data_In_unsigned                 : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL Compare_To_Constant12_out1       : std_logic;
  SIGNAL Selector13_out1                  : vector_of_std_logic_vector16(0 TO 3);  -- ufix16 [4]
  SIGNAL Selector13_out1_1                : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Unit_Delay_Enabled_Synchronous1_out1 : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Unit_Delay_Enabled_Synchronous1_ectrl : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Compare_To_Constant13_out1       : std_logic;
  SIGNAL Selector14_out1                  : vector_of_std_logic_vector16(0 TO 3);  -- ufix16 [4]
  SIGNAL Selector14_out1_1                : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Unit_Delay_Enabled_Synchronous_ectrl : vector_of_unsigned16(0 TO 3);  -- uint16 [4]
  SIGNAL Vector_Concatenate_out1          : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL Unit_Delay_out1                  : std_logic;

BEGIN
  Data_In_unsigned <= Data_In;

  
  Compare_To_Constant12_out1 <= '1' WHEN Index = '0' ELSE
      '0';

  Selector13_out1(0) <= Data_In_unsigned(0);
  Selector13_out1(1) <= Data_In_unsigned(1);
  Selector13_out1(2) <= Data_In_unsigned(2);
  Selector13_out1(3) <= Data_In_unsigned(3);

  outputgen2: FOR k IN 0 TO 3 GENERATE
    Selector13_out1_1(k) <= unsigned(Selector13_out1(k));
  END GENERATE;

  
  Unit_Delay_Enabled_Synchronous1_ectrl(0) <= Unit_Delay_Enabled_Synchronous1_out1(0) WHEN Compare_To_Constant12_out1 = '0' ELSE
      Selector13_out1_1(0);
  
  Unit_Delay_Enabled_Synchronous1_ectrl(1) <= Unit_Delay_Enabled_Synchronous1_out1(1) WHEN Compare_To_Constant12_out1 = '0' ELSE
      Selector13_out1_1(1);
  
  Unit_Delay_Enabled_Synchronous1_ectrl(2) <= Unit_Delay_Enabled_Synchronous1_out1(2) WHEN Compare_To_Constant12_out1 = '0' ELSE
      Selector13_out1_1(2);
  
  Unit_Delay_Enabled_Synchronous1_ectrl(3) <= Unit_Delay_Enabled_Synchronous1_out1(3) WHEN Compare_To_Constant12_out1 = '0' ELSE
      Selector13_out1_1(3);

  Unit_Delay_Enabled_Synchronous1_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous1_out1(0) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous1_out1(1) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous1_out1(2) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous1_out1(3) <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous1_out1(0) <= Unit_Delay_Enabled_Synchronous1_ectrl(0);
        Unit_Delay_Enabled_Synchronous1_out1(1) <= Unit_Delay_Enabled_Synchronous1_ectrl(1);
        Unit_Delay_Enabled_Synchronous1_out1(2) <= Unit_Delay_Enabled_Synchronous1_ectrl(2);
        Unit_Delay_Enabled_Synchronous1_out1(3) <= Unit_Delay_Enabled_Synchronous1_ectrl(3);
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous1_lowered_process;


  
  Compare_To_Constant13_out1 <= '1' WHEN Index = '1' ELSE
      '0';

  Selector14_out1(0) <= Data_In_unsigned(0);
  Selector14_out1(1) <= Data_In_unsigned(1);
  Selector14_out1(2) <= Data_In_unsigned(2);
  Selector14_out1(3) <= Data_In_unsigned(3);

  outputgen1: FOR k IN 0 TO 3 GENERATE
    Selector14_out1_1(k) <= unsigned(Selector14_out1(k));
  END GENERATE;

  
  Unit_Delay_Enabled_Synchronous_ectrl(0) <= Unit_Delay_Enabled_Synchronous_out1(0) WHEN Compare_To_Constant13_out1 = '0' ELSE
      Selector14_out1_1(0);
  
  Unit_Delay_Enabled_Synchronous_ectrl(1) <= Unit_Delay_Enabled_Synchronous_out1(1) WHEN Compare_To_Constant13_out1 = '0' ELSE
      Selector14_out1_1(1);
  
  Unit_Delay_Enabled_Synchronous_ectrl(2) <= Unit_Delay_Enabled_Synchronous_out1(2) WHEN Compare_To_Constant13_out1 = '0' ELSE
      Selector14_out1_1(2);
  
  Unit_Delay_Enabled_Synchronous_ectrl(3) <= Unit_Delay_Enabled_Synchronous_out1(3) WHEN Compare_To_Constant13_out1 = '0' ELSE
      Selector14_out1_1(3);

  Unit_Delay_Enabled_Synchronous_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous_out1(0) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(1) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(2) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(3) <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1(0) <= Unit_Delay_Enabled_Synchronous_ectrl(0);
        Unit_Delay_Enabled_Synchronous_out1(1) <= Unit_Delay_Enabled_Synchronous_ectrl(1);
        Unit_Delay_Enabled_Synchronous_out1(2) <= Unit_Delay_Enabled_Synchronous_ectrl(2);
        Unit_Delay_Enabled_Synchronous_out1(3) <= Unit_Delay_Enabled_Synchronous_ectrl(3);
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_lowered_process;


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
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_out1 <= Compare_To_Constant13_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  Valid_Out <= Unit_Delay_out1;

END rtl;

