-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_nfp_wire_single.vhd
-- Created: 2021-01-04 00:54:55
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_nfp_wire_single
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/Spectrum 
-- Options/nfp_wire_singl
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_nfp_wire_single IS
  PORT( nfp_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_out                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END SpectrumAnalyser_src_nfp_wire_single;


ARCHITECTURE rtl OF SpectrumAnalyser_src_nfp_wire_single IS

BEGIN
  nfp_out <= nfp_in;

END rtl;

