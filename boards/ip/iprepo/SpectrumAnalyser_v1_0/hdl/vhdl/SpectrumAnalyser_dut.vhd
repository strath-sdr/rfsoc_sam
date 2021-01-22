-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_dut.vhd
-- Created: 2021-01-22 11:44:36
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_dut
-- Source Path: SpectrumAnalyser/SpectrumAnalyser_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        Packet_Size                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        SSR_Mode                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Units_rsvd                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Type_rsvd                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Vrms                              :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Type_Scale                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Power_Scale                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Selector                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        WLength                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        WAddress                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        WEnable                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Length                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Buffer_Address_1                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Buffer_Address_2                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Buffer_Address_3                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Enable                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Count                             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Valid_Real                        :   IN    std_logic;  -- ufix1
        Valid_Imag                        :   IN    std_logic;  -- ufix1
        Data_Real                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        Data_Imag                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        axim_rd_s2m_rd_aready             :   IN    std_logic;  -- ufix1
        axim_rd_s2m_rd_dvalid             :   IN    std_logic;  -- ufix1
        axim_rd_data                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        axim_wr_s2m_wr_ready              :   IN    std_logic;  -- ufix1
        axim_wr_s2m_wr_complete           :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        WReady                            :   OUT   std_logic;  -- ufix1
        Buffer_Pointer                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        DMA_Status                        :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
        axim_rd_m2s_rd_addr               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        axim_rd_m2s_rd_len                :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        axim_rd_m2s_rd_avalid             :   OUT   std_logic;  -- ufix1
        axim_wr_m2s_wr_addr               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        axim_wr_m2s_wr_len                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        axim_wr_m2s_wr_valid              :   OUT   std_logic;  -- ufix1
        axim_wr_data                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        debug_valid_des                   :   OUT   std_logic;  -- ufix1
        debug_data_des                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        debug_sof_des                     :   OUT   std_logic;  -- ufix1
        debug_eol_des                     :   OUT   std_logic;  -- ufix1
        debug_valid_pgen                  :   OUT   std_logic;  -- ufix1
        debug_data_pgen                   :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        debug_sof_pgen                    :   OUT   std_logic;  -- ufix1
        debug_eol_pgen                    :   OUT   std_logic;  -- ufix1
        debug_valid_ser                   :   OUT   std_logic;  -- ufix1
        debug_data_ser                    :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
        );
END SpectrumAnalyser_dut;


ARCHITECTURE rtl OF SpectrumAnalyser_dut IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser_src_Spectrum_Analyser
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          Packet_Size                     :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          SSR_Mode                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Units_rsvd                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Type_rsvd                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Vrms                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Type_Scale                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Power_Scale                     :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Selector                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          WLength                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          WAddress                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          WEnable                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Length                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Buffer_Address_1                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Buffer_Address_2                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Buffer_Address_3                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Enable                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Count                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Valid_Real                      :   IN    std_logic;  -- ufix1
          Valid_Imag                      :   IN    std_logic;  -- ufix1
          Data_Real                       :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          Data_Imag                       :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          axim_rd_s2m_rd_aready           :   IN    std_logic;  -- ufix1
          axim_rd_s2m_rd_dvalid           :   IN    std_logic;  -- ufix1
          axim_rd_data                    :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          axim_wr_s2m_wr_ready            :   IN    std_logic;  -- ufix1
          axim_wr_s2m_wr_complete         :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          WReady                          :   OUT   std_logic;  -- ufix1
          Buffer_Pointer                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          DMA_Status                      :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
          axim_rd_m2s_rd_addr             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          axim_rd_m2s_rd_len              :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          axim_rd_m2s_rd_avalid           :   OUT   std_logic;  -- ufix1
          axim_wr_m2s_wr_addr             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          axim_wr_m2s_wr_len              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          axim_wr_m2s_wr_valid            :   OUT   std_logic;  -- ufix1
          axim_wr_data                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          debug_valid_des                 :   OUT   std_logic;  -- ufix1
          debug_data_des                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          debug_sof_des                   :   OUT   std_logic;  -- ufix1
          debug_eol_des                   :   OUT   std_logic;  -- ufix1
          debug_valid_pgen                :   OUT   std_logic;  -- ufix1
          debug_data_pgen                 :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          debug_sof_pgen                  :   OUT   std_logic;  -- ufix1
          debug_eol_pgen                  :   OUT   std_logic;  -- ufix1
          debug_valid_ser                 :   OUT   std_logic;  -- ufix1
          debug_data_ser                  :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser_src_Spectrum_Analyser
    USE ENTITY work.SpectrumAnalyser_src_Spectrum_Analyser(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL WReady_sig                       : std_logic;  -- ufix1
  SIGNAL Buffer_Pointer_sig               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL DMA_Status_sig                   : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL axim_rd_m2s_rd_addr_sig          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axim_rd_m2s_rd_len_sig           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL axim_rd_m2s_rd_avalid_sig        : std_logic;  -- ufix1
  SIGNAL axim_wr_m2s_wr_addr_sig          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axim_wr_m2s_wr_len_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axim_wr_m2s_wr_valid_sig         : std_logic;  -- ufix1
  SIGNAL axim_wr_data_sig                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL debug_valid_des_sig              : std_logic;  -- ufix1
  SIGNAL debug_data_des_sig               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL debug_sof_des_sig                : std_logic;  -- ufix1
  SIGNAL debug_eol_des_sig                : std_logic;  -- ufix1
  SIGNAL debug_valid_pgen_sig             : std_logic;  -- ufix1
  SIGNAL debug_data_pgen_sig              : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL debug_sof_pgen_sig               : std_logic;  -- ufix1
  SIGNAL debug_eol_pgen_sig               : std_logic;  -- ufix1
  SIGNAL debug_valid_ser_sig              : std_logic;  -- ufix1
  SIGNAL debug_data_ser_sig               : std_logic_vector(127 DOWNTO 0);  -- ufix128

BEGIN
  u_SpectrumAnalyser_src_Spectrum_Analyser : SpectrumAnalyser_src_Spectrum_Analyser
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              Packet_Size => Packet_Size,  -- ufix32
              SSR_Mode => SSR_Mode,  -- ufix32
              Units_rsvd => Units_rsvd,  -- ufix32
              Type_rsvd => Type_rsvd,  -- ufix32
              Vrms => Vrms,  -- ufix32
              Type_Scale => Type_Scale,  -- ufix32
              Power_Scale => Power_Scale,  -- ufix32
              Selector => Selector,  -- ufix32
              WLength => WLength,  -- ufix32
              WAddress => WAddress,  -- ufix32
              WEnable => WEnable,  -- ufix32
              Length => Length,  -- ufix32
              Buffer_Address_1 => Buffer_Address_1,  -- ufix32
              Buffer_Address_2 => Buffer_Address_2,  -- ufix32
              Buffer_Address_3 => Buffer_Address_3,  -- ufix32
              Enable => Enable,  -- ufix32
              Count => Count,  -- ufix32
              Valid_Real => Valid_Real,  -- ufix1
              Valid_Imag => Valid_Imag,  -- ufix1
              Data_Real => Data_Real,  -- ufix128
              Data_Imag => Data_Imag,  -- ufix128
              axim_rd_s2m_rd_aready => axim_rd_s2m_rd_aready,  -- ufix1
              axim_rd_s2m_rd_dvalid => axim_rd_s2m_rd_dvalid,  -- ufix1
              axim_rd_data => axim_rd_data,  -- ufix16
              axim_wr_s2m_wr_ready => axim_wr_s2m_wr_ready,  -- ufix1
              axim_wr_s2m_wr_complete => axim_wr_s2m_wr_complete,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              WReady => WReady_sig,  -- ufix1
              Buffer_Pointer => Buffer_Pointer_sig,  -- ufix2
              DMA_Status => DMA_Status_sig,  -- ufix6
              axim_rd_m2s_rd_addr => axim_rd_m2s_rd_addr_sig,  -- ufix32
              axim_rd_m2s_rd_len => axim_rd_m2s_rd_len_sig,  -- ufix16
              axim_rd_m2s_rd_avalid => axim_rd_m2s_rd_avalid_sig,  -- ufix1
              axim_wr_m2s_wr_addr => axim_wr_m2s_wr_addr_sig,  -- ufix32
              axim_wr_m2s_wr_len => axim_wr_m2s_wr_len_sig,  -- ufix32
              axim_wr_m2s_wr_valid => axim_wr_m2s_wr_valid_sig,  -- ufix1
              axim_wr_data => axim_wr_data_sig,  -- ufix32
              debug_valid_des => debug_valid_des_sig,  -- ufix1
              debug_data_des => debug_data_des_sig,  -- ufix16
              debug_sof_des => debug_sof_des_sig,  -- ufix1
              debug_eol_des => debug_eol_des_sig,  -- ufix1
              debug_valid_pgen => debug_valid_pgen_sig,  -- ufix1
              debug_data_pgen => debug_data_pgen_sig,  -- ufix128
              debug_sof_pgen => debug_sof_pgen_sig,  -- ufix1
              debug_eol_pgen => debug_eol_pgen_sig,  -- ufix1
              debug_valid_ser => debug_valid_ser_sig,  -- ufix1
              debug_data_ser => debug_data_ser_sig  -- ufix128
              );

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  WReady <= WReady_sig;

  axim_rd_m2s_rd_avalid <= axim_rd_m2s_rd_avalid_sig;

  axim_wr_m2s_wr_valid <= axim_wr_m2s_wr_valid_sig;

  debug_valid_des <= debug_valid_des_sig;

  debug_sof_des <= debug_sof_des_sig;

  debug_eol_des <= debug_eol_des_sig;

  debug_valid_pgen <= debug_valid_pgen_sig;

  debug_sof_pgen <= debug_sof_pgen_sig;

  debug_eol_pgen <= debug_eol_pgen_sig;

  debug_valid_ser <= debug_valid_ser_sig;

  Buffer_Pointer <= Buffer_Pointer_sig;

  DMA_Status <= DMA_Status_sig;

  axim_rd_m2s_rd_addr <= axim_rd_m2s_rd_addr_sig;

  axim_rd_m2s_rd_len <= axim_rd_m2s_rd_len_sig;

  axim_wr_m2s_wr_addr <= axim_wr_m2s_wr_addr_sig;

  axim_wr_m2s_wr_len <= axim_wr_m2s_wr_len_sig;

  axim_wr_data <= axim_wr_data_sig;

  debug_data_des <= debug_data_des_sig;

  debug_data_pgen <= debug_data_pgen_sig;

  debug_data_ser <= debug_data_ser_sig;

END rtl;

