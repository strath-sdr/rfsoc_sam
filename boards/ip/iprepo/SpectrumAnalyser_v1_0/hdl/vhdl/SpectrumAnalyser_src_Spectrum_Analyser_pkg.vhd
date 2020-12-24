-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_Spectrum_Analyser_pkg.vhd
-- Created: 2020-12-24 11:43:48
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE SpectrumAnalyser_src_Spectrum_Analyser_pkg IS
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_signed18 IS ARRAY (NATURAL RANGE <>) OF signed(17 DOWNTO 0);
  TYPE vector_of_signed20 IS ARRAY (NATURAL RANGE <>) OF signed(19 DOWNTO 0);
  TYPE vector_of_signed22 IS ARRAY (NATURAL RANGE <>) OF signed(21 DOWNTO 0);
  TYPE vector_of_signed24 IS ARRAY (NATURAL RANGE <>) OF signed(23 DOWNTO 0);
  TYPE vector_of_signed26 IS ARRAY (NATURAL RANGE <>) OF signed(25 DOWNTO 0);
  TYPE vector_of_signed28 IS ARRAY (NATURAL RANGE <>) OF signed(27 DOWNTO 0);
  TYPE vector_of_unsigned31 IS ARRAY (NATURAL RANGE <>) OF unsigned(30 DOWNTO 0);
  TYPE vector_of_unsigned8 IS ARRAY (NATURAL RANGE <>) OF unsigned(7 DOWNTO 0);
  TYPE vector_of_unsigned23 IS ARRAY (NATURAL RANGE <>) OF unsigned(22 DOWNTO 0);
  TYPE vector_of_unsigned128 IS ARRAY (NATURAL RANGE <>) OF unsigned(127 DOWNTO 0);
  TYPE vector_of_signed11 IS ARRAY (NATURAL RANGE <>) OF signed(10 DOWNTO 0);
  TYPE vector_of_signed35 IS ARRAY (NATURAL RANGE <>) OF signed(34 DOWNTO 0);
  TYPE vector_of_signed50 IS ARRAY (NATURAL RANGE <>) OF signed(49 DOWNTO 0);
  TYPE vector_of_unsigned27 IS ARRAY (NATURAL RANGE <>) OF unsigned(26 DOWNTO 0);
  TYPE vector_of_signed8 IS ARRAY (NATURAL RANGE <>) OF signed(7 DOWNTO 0);
  TYPE vector_of_unsigned33 IS ARRAY (NATURAL RANGE <>) OF unsigned(32 DOWNTO 0);
  TYPE vector_of_signed10 IS ARRAY (NATURAL RANGE <>) OF signed(9 DOWNTO 0);
  TYPE vector_of_signed34 IS ARRAY (NATURAL RANGE <>) OF signed(33 DOWNTO 0);
  TYPE vector_of_signed21 IS ARRAY (NATURAL RANGE <>) OF signed(20 DOWNTO 0);
  TYPE vector_of_unsigned42 IS ARRAY (NATURAL RANGE <>) OF unsigned(41 DOWNTO 0);
  TYPE vector_of_unsigned26 IS ARRAY (NATURAL RANGE <>) OF unsigned(25 DOWNTO 0);
  TYPE vector_of_unsigned32 IS ARRAY (NATURAL RANGE <>) OF unsigned(31 DOWNTO 0);
  TYPE vector_of_std_logic_vector32 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(31 DOWNTO 0);
  TYPE vector_of_std_logic_vector16 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(15 DOWNTO 0);
  TYPE vector_of_unsigned16 IS ARRAY (NATURAL RANGE <>) OF unsigned(15 DOWNTO 0);
END SpectrumAnalyser_src_Spectrum_Analyser_pkg;

