-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_Frame_Dropper.vhd
-- Created: 2020-12-24 11:43:48
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_Frame_Dropper
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Packet Generator Imag/Frame Droppe
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_Frame_Dropper IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Valid_In                          :   IN    std_logic;
        Data_In                           :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        SoF_In                            :   IN    std_logic;
        EoF_In                            :   IN    std_logic;
        Frame_Drop                        :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        Valid_Out                         :   OUT   std_logic;
        Data_Out                          :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        SoF_Out                           :   OUT   std_logic;
        EoF_Out                           :   OUT   std_logic
        );
END SpectrumAnalyser_src_Frame_Dropper;


ARCHITECTURE rtl OF SpectrumAnalyser_src_Frame_Dropper IS

  -- Signals
  SIGNAL Constant1_out1                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Frame_Drop_unsigned              : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Shift_Arithmetic_out1            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Constant_out1                    : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Multiport_Switch_out1            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Compare_To_Zero_out1             : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL AND2_out1                        : std_logic;
  SIGNAL AND1_out1                        : std_logic;

BEGIN
  Constant1_out1 <= to_unsigned(16#1#, 4);

  Frame_Drop_unsigned <= unsigned(Frame_Drop);

  Shift_Arithmetic_out1 <= Constant1_out1 sll to_integer(Frame_Drop_unsigned);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 7
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#0#, 4);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        IF Relational_Operator_relop1 = '1' THEN 
          HDL_Counter_out1 <= to_unsigned(16#0#, 4);
        ELSIF EoF_In = '1' THEN 
          IF HDL_Counter_out1 >= to_unsigned(16#7#, 4) THEN 
            HDL_Counter_out1 <= to_unsigned(16#0#, 4);
          ELSE 
            HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#1#, 4);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  Relational_Operator_relop1 <= '1' WHEN Shift_Arithmetic_out1 <= HDL_Counter_out1 ELSE
      '0';

  Constant_out1 <= to_unsigned(16#0#, 4);

  
  Multiport_Switch_out1 <= HDL_Counter_out1 WHEN Relational_Operator_relop1 = '0' ELSE
      Constant_out1;

  
  Compare_To_Zero_out1 <= '1' WHEN Multiport_Switch_out1 = to_unsigned(16#0#, 4) ELSE
      '0';

  AND_out1 <= Valid_In AND Compare_To_Zero_out1;

  Valid_Out <= AND_out1;

  AND2_out1 <= Compare_To_Zero_out1 AND SoF_In;

  SoF_Out <= AND2_out1;

  AND1_out1 <= Compare_To_Zero_out1 AND EoF_In;

  EoF_Out <= AND1_out1;

  Data_Out <= Data_In;

END rtl;

