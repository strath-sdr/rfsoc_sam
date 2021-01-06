-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_SSR_to_Vector_block2.vhd
-- Created: 2021-01-04 00:54:55
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_SSR_to_Vector_block2
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Serializer Real/SSR to Vecto
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.SpectrumAnalyser_src_Spectrum_Analyser_pkg.ALL;

ENTITY SpectrumAnalyser_src_SSR_to_Vector_block2 IS
  PORT( SSR                               :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        Vector                            :   OUT   vector_of_std_logic_vector16(0 TO 7)  -- uint16 [8]
        );
END SpectrumAnalyser_src_SSR_to_Vector_block2;


ARCHITECTURE rtl OF SpectrumAnalyser_src_SSR_to_Vector_block2 IS

  -- Signals
  SIGNAL SSR_unsigned                     : unsigned(127 DOWNTO 0);  -- ufix128
  SIGNAL Bit_Slice0_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Slice1_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Slice2_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Slice3_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Slice4_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Slice5_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Slice6_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Slice7_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Matrix_Concatenate_out1          : vector_of_unsigned16(0 TO 7);  -- uint16 [8]

BEGIN
  SSR_unsigned <= unsigned(SSR);

  Bit_Slice0_out1 <= SSR_unsigned(15 DOWNTO 0);

  Bit_Slice1_out1 <= SSR_unsigned(31 DOWNTO 16);

  Bit_Slice2_out1 <= SSR_unsigned(47 DOWNTO 32);

  Bit_Slice3_out1 <= SSR_unsigned(63 DOWNTO 48);

  Bit_Slice4_out1 <= SSR_unsigned(79 DOWNTO 64);

  Bit_Slice5_out1 <= SSR_unsigned(95 DOWNTO 80);

  Bit_Slice6_out1 <= SSR_unsigned(111 DOWNTO 96);

  Bit_Slice7_out1 <= SSR_unsigned(127 DOWNTO 112);

  Matrix_Concatenate_out1(0) <= Bit_Slice0_out1;
  Matrix_Concatenate_out1(1) <= Bit_Slice1_out1;
  Matrix_Concatenate_out1(2) <= Bit_Slice2_out1;
  Matrix_Concatenate_out1(3) <= Bit_Slice3_out1;
  Matrix_Concatenate_out1(4) <= Bit_Slice4_out1;
  Matrix_Concatenate_out1(5) <= Bit_Slice5_out1;
  Matrix_Concatenate_out1(6) <= Bit_Slice6_out1;
  Matrix_Concatenate_out1(7) <= Bit_Slice7_out1;

  outputgen: FOR k IN 0 TO 7 GENERATE
    Vector(k) <= std_logic_vector(Matrix_Concatenate_out1(k));
  END GENERATE;

END rtl;
