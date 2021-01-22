-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_RADIX22FFT_SDF1_7_block.vhd
-- Created: 2021-01-22 11:44:21
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_RADIX22FFT_SDF1_7_block
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 128/RADIX22FFT_SDF1_
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_RADIX22FFT_SDF1_7_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        din_7_re_dly                      :   IN    std_logic_vector(21 DOWNTO 0);  -- sfix22_En15
        din_7_im_dly                      :   IN    std_logic_vector(21 DOWNTO 0);  -- sfix22_En15
        din_7_vld_dly                     :   IN    std_logic;
        rd_7_Addr                         :   IN    std_logic;
        rd_7_Enb_dly                      :   IN    std_logic;
        twdl_7_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_7_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_7_vld                        :   IN    std_logic;
        proc_7_enb                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_7_re                         :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
        dout_7_im                         :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
        dout_7_vld                        :   OUT   std_logic;
        dinXTwdl_7_vld                    :   OUT   std_logic
        );
END SpectrumAnalyser_src_RADIX22FFT_SDF1_7_block;


ARCHITECTURE rtl OF SpectrumAnalyser_src_RADIX22FFT_SDF1_7_block IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser_src_Complex4Multiply_block5
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          din_re                          :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          din_im                          :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          din_7_vld_dly                   :   IN    std_logic;
          twdl_7_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          twdl_7_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          softReset                       :   IN    std_logic;
          dinXTwdl_re                     :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          dinXTwdl_im                     :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          dinXTwdl_7_vld                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_src_SDFCommutator7_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          din_7_vld_dly                   :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          xf_im                           :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          xf_vld                          :   IN    std_logic;
          dinXTwdlf_re                    :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          dinXTwdlf_im                    :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          dinxTwdlf_vld                   :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          btf1_im                         :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          btf2_re                         :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          btf2_im                         :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          btf_vld                         :   IN    std_logic;
          softReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          wrData_im                       :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          wrAddr                          :   OUT   std_logic;  -- ufix1
          wrEnb                           :   OUT   std_logic;
          dout_7_re                       :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          dout_7_im                       :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
          dout_7_vld                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser_src_Complex4Multiply_block5
    USE ENTITY work.SpectrumAnalyser_src_Complex4Multiply_block5(rtl);

  FOR ALL : SpectrumAnalyser_src_SDFCommutator7_block
    USE ENTITY work.SpectrumAnalyser_src_SDFCommutator7_block(rtl);

  -- Signals
  SIGNAL din_7_re_dly_signed              : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL din_re                           : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL din_7_im_dly_signed              : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL din_im                           : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL dinXTwdl_re                      : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL dinXTwdl_im                      : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL dinXTwdl_7_vld_1                 : std_logic;
  SIGNAL dinXTwdl_re_signed               : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL dinXTwdl_im_signed               : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL x_vld                            : std_logic;
  SIGNAL btf2_im                          : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL btf2_re                          : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL btf1_im                          : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL btf1_re                          : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL dinXTwdlf_im                     : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL dinXTwdlf_re                     : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL xf_im                            : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL wrData_im                        : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL wrData_im_signed                 : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL wrData_re                        : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL wrData_re_signed                 : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL wrAddr                           : std_logic;  -- ufix1
  SIGNAL wrEnb                            : std_logic;
  SIGNAL twoLocationReg_0_MEM_re_0        : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL twoLocationReg_0_MEM_im_0        : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL twoLocationReg_0_MEM_re_1        : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL twoLocationReg_0_MEM_im_1        : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL twoLocationReg_0_dout_re_reg     : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL twoLocationReg_0_dout_im_reg     : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL twoLocationReg_0_MEM_re_0_next   : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL twoLocationReg_0_MEM_im_0_next   : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL twoLocationReg_0_MEM_re_1_next   : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL twoLocationReg_0_MEM_im_1_next   : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL twoLocationReg_0_dout_re_reg_next : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL twoLocationReg_0_dout_im_reg_next : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL x_re                             : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL x_im                             : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL Radix22ButterflyG1_btf1_re_reg   : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG1_btf1_im_reg   : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG1_btf2_re_reg   : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG1_btf2_im_reg   : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly1 : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly1 : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly2 : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly2 : signed(22 DOWNTO 0);  -- sfix23
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly2 : std_logic;
  SIGNAL Radix22ButterflyG1_btf1_re_reg_next : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_btf1_im_reg_next : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_btf2_re_reg_next : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_btf2_im_reg_next : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_add_cast      : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_add_cast_1    : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_sub_cast      : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_sub_cast_1    : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_add_cast_2    : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_add_cast_3    : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_sub_cast_2    : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL Radix22ButterflyG1_sub_cast_3    : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL xf_re                            : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinxTwdlf_vld                    : std_logic;
  SIGNAL btf_vld                          : std_logic;
  SIGNAL dout_7_re_tmp                    : std_logic_vector(22 DOWNTO 0);  -- ufix23
  SIGNAL dout_7_im_tmp                    : std_logic_vector(22 DOWNTO 0);  -- ufix23

BEGIN
  u_MUL4 : SpectrumAnalyser_src_Complex4Multiply_block5
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              din_re => std_logic_vector(din_re),  -- sfix23_En15
              din_im => std_logic_vector(din_im),  -- sfix23_En15
              din_7_vld_dly => din_7_vld_dly,
              twdl_7_re => twdl_7_re,  -- sfix16_En14
              twdl_7_im => twdl_7_im,  -- sfix16_En14
              softReset => softReset,
              dinXTwdl_re => dinXTwdl_re,  -- sfix23_En15
              dinXTwdl_im => dinXTwdl_im,  -- sfix23_En15
              dinXTwdl_7_vld => dinXTwdl_7_vld_1
              );

  u_SDFCOMMUTATOR_7 : SpectrumAnalyser_src_SDFCommutator7_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              din_7_vld_dly => din_7_vld_dly,
              xf_re => std_logic_vector(xf_re),  -- sfix23_En15
              xf_im => std_logic_vector(xf_im),  -- sfix23_En15
              xf_vld => xf_vld,
              dinXTwdlf_re => std_logic_vector(dinXTwdlf_re),  -- sfix23_En15
              dinXTwdlf_im => std_logic_vector(dinXTwdlf_im),  -- sfix23_En15
              dinxTwdlf_vld => dinxTwdlf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix23_En15
              btf1_im => std_logic_vector(btf1_im),  -- sfix23_En15
              btf2_re => std_logic_vector(btf2_re),  -- sfix23_En15
              btf2_im => std_logic_vector(btf2_im),  -- sfix23_En15
              btf_vld => btf_vld,
              softReset => softReset,
              wrData_re => wrData_re,  -- sfix23_En15
              wrData_im => wrData_im,  -- sfix23_En15
              wrAddr => wrAddr,  -- ufix1
              wrEnb => wrEnb,
              dout_7_re => dout_7_re_tmp,  -- sfix23_En15
              dout_7_im => dout_7_im_tmp,  -- sfix23_En15
              dout_7_vld => dout_7_vld
              );

  din_7_re_dly_signed <= signed(din_7_re_dly);

  din_re <= resize(din_7_re_dly_signed, 23);

  din_7_im_dly_signed <= signed(din_7_im_dly);

  din_im <= resize(din_7_im_dly_signed, 23);

  dinXTwdl_re_signed <= signed(dinXTwdl_re);

  dinXTwdl_im_signed <= signed(dinXTwdl_im);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        x_vld <= rd_7_Enb_dly;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  wrData_im_signed <= signed(wrData_im);

  wrData_re_signed <= signed(wrData_re);

  -- twoLocationReg_0
  twoLocationReg_0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twoLocationReg_0_MEM_re_0 <= to_signed(16#000000#, 23);
      twoLocationReg_0_MEM_im_0 <= to_signed(16#000000#, 23);
      twoLocationReg_0_MEM_re_1 <= to_signed(16#000000#, 23);
      twoLocationReg_0_MEM_im_1 <= to_signed(16#000000#, 23);
      twoLocationReg_0_dout_re_reg <= to_signed(16#000000#, 23);
      twoLocationReg_0_dout_im_reg <= to_signed(16#000000#, 23);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twoLocationReg_0_MEM_re_0 <= twoLocationReg_0_MEM_re_0_next;
        twoLocationReg_0_MEM_im_0 <= twoLocationReg_0_MEM_im_0_next;
        twoLocationReg_0_MEM_re_1 <= twoLocationReg_0_MEM_re_1_next;
        twoLocationReg_0_MEM_im_1 <= twoLocationReg_0_MEM_im_1_next;
        twoLocationReg_0_dout_re_reg <= twoLocationReg_0_dout_re_reg_next;
        twoLocationReg_0_dout_im_reg <= twoLocationReg_0_dout_im_reg_next;
      END IF;
    END IF;
  END PROCESS twoLocationReg_0_process;

  twoLocationReg_0_output : PROCESS (rd_7_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
       twoLocationReg_0_MEM_re_0, twoLocationReg_0_MEM_re_1,
       twoLocationReg_0_dout_im_reg, twoLocationReg_0_dout_re_reg, wrAddr,
       wrData_im_signed, wrData_re_signed, wrEnb)
  BEGIN
    twoLocationReg_0_MEM_re_0_next <= twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next <= twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next <= twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next <= twoLocationReg_0_MEM_im_1;
    twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_dout_re_reg;
    twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_dout_im_reg;
    IF rd_7_Addr = '1' THEN 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_1;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_1;
    ELSE 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_0;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_0;
    END IF;
    IF wrEnb = '1' THEN 
      IF wrAddr = '1' THEN 
        twoLocationReg_0_MEM_re_1_next <= wrData_re_signed;
        twoLocationReg_0_MEM_im_1_next <= wrData_im_signed;
      ELSE 
        twoLocationReg_0_MEM_re_0_next <= wrData_re_signed;
        twoLocationReg_0_MEM_im_0_next <= wrData_im_signed;
      END IF;
    END IF;
    x_re <= twoLocationReg_0_dout_re_reg;
    x_im <= twoLocationReg_0_dout_im_reg;
  END PROCESS twoLocationReg_0_output;


  -- Radix22ButterflyG1
  Radix22ButterflyG1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG1_btf1_re_reg <= to_signed(16#000000#, 24);
      Radix22ButterflyG1_btf1_im_reg <= to_signed(16#000000#, 24);
      Radix22ButterflyG1_btf2_re_reg <= to_signed(16#000000#, 24);
      Radix22ButterflyG1_btf2_im_reg <= to_signed(16#000000#, 24);
      xf_re <= to_signed(16#000000#, 23);
      xf_im <= to_signed(16#000000#, 23);
      xf_vld <= '0';
      Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(16#000000#, 23);
      Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(16#000000#, 23);
      Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(16#000000#, 23);
      Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(16#000000#, 23);
      Radix22ButterflyG1_dinXtwdl_vld_dly1 <= '0';
      Radix22ButterflyG1_dinXtwdl_vld_dly2 <= '0';
      btf_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
        Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
        Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
        Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
        btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re_signed;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im_signed;
        xf_re <= x_re;
        xf_im <= x_im;
        xf_vld <= x_vld;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_7_enb AND dinXTwdl_7_vld_1;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_process;

  dinxTwdlf_vld <= ( NOT proc_7_enb) AND dinXTwdl_7_vld_1;
  Radix22ButterflyG1_add_cast <= resize(x_re, 24);
  Radix22ButterflyG1_add_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 24);
  Radix22ButterflyG1_btf1_re_reg_next <= Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  Radix22ButterflyG1_sub_cast <= resize(x_re, 24);
  Radix22ButterflyG1_sub_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 24);
  Radix22ButterflyG1_btf2_re_reg_next <= Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  Radix22ButterflyG1_add_cast_2 <= resize(x_im, 24);
  Radix22ButterflyG1_add_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 24);
  Radix22ButterflyG1_btf1_im_reg_next <= Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  Radix22ButterflyG1_sub_cast_2 <= resize(x_im, 24);
  Radix22ButterflyG1_sub_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 24);
  Radix22ButterflyG1_btf2_im_reg_next <= Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  dinXTwdlf_re <= dinXTwdl_re_signed;
  dinXTwdlf_im <= dinXTwdl_im_signed;
  btf1_re <= Radix22ButterflyG1_btf1_re_reg(22 DOWNTO 0);
  btf1_im <= Radix22ButterflyG1_btf1_im_reg(22 DOWNTO 0);
  btf2_re <= Radix22ButterflyG1_btf2_re_reg(22 DOWNTO 0);
  btf2_im <= Radix22ButterflyG1_btf2_im_reg(22 DOWNTO 0);

  dout_7_re <= dout_7_re_tmp;

  dout_7_im <= dout_7_im_tmp;

  dinXTwdl_7_vld <= dinXTwdl_7_vld_1;

END rtl;

