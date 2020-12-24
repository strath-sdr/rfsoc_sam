-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_spectrumanalyser\mw_spectrumanalyser_src_SDFCommutator3_block3.vhd
-- Created: 2020-12-24 09:22:43
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_spectrumanalyser_src_SDFCommutator3_block3
-- Source Path: mw_spectrumanalyser/Spectrum Analyser/FFT Core/FFT HDL Optimized 4096/RADIX22FFT_SDF1_3/SDFCommutator3
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mw_spectrumanalyser_src_SDFCommutator3_block3 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        din_3_vld_dly                     :   IN    std_logic;
        xf_re                             :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        xf_im                             :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        xf_vld                            :   IN    std_logic;
        dinXTwdlf_re                      :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        dinXTwdlf_im                      :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        dinxTwdlf_vld                     :   IN    std_logic;
        btf1_re                           :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        btf1_im                           :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        btf2_re                           :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        btf2_im                           :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        btf_vld                           :   IN    std_logic;
        softReset                         :   IN    std_logic;
        wrData_re                         :   OUT   std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        wrData_im                         :   OUT   std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        wrAddr                            :   OUT   std_logic_vector(8 DOWNTO 0);  -- ufix9
        wrEnb                             :   OUT   std_logic;
        dout_3_1_re                       :   OUT   std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        dout_3_1_im                       :   OUT   std_logic_vector(18 DOWNTO 0);  -- sfix19_En15
        dout_3_1_vld                      :   OUT   std_logic
        );
END mw_spectrumanalyser_src_SDFCommutator3_block3;


ARCHITECTURE rtl OF mw_spectrumanalyser_src_SDFCommutator3_block3 IS

  -- Component Declarations
  COMPONENT mw_spectrumanalyser_src_SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : mw_spectrumanalyser_src_SimpleDualPortRAM_generic
    USE ENTITY work.mw_spectrumanalyser_src_SimpleDualPortRAM_generic(rtl);

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL xf_re_signed                     : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL xf_im_signed                     : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL dinXTwdlf_re_signed              : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL dinXTwdlf_im_signed              : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL btf1_re_signed                   : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL btf1_im_signed                   : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL btf2_re_signed                   : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL btf2_im_signed                   : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFCummutator_out_re             : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL SDFCummutator_out_im             : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL SDFCummutator_out_vld            : std_logic;
  SIGNAL SDFCummutator_wrAddr_reg         : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL SDFCummutator_wrState            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_mem_btf_switch     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFCummutator_rdCnt              : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL SDFCummutator_wrData_re_reg      : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL SDFCummutator_wrData_im_reg      : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL SDFCummutator_wrEnb_reg          : std_logic;
  SIGNAL SDFCummutator_wrXData_re_reg     : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL SDFCummutator_wrXData_im_reg     : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL SDFCummutator_xWrAddr            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_wrxEnb_reg         : std_logic;
  SIGNAL SDFCummutator_xRdAddr            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_XState             : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_rdEnb_xmem         : std_logic;
  SIGNAL SDFCummutator_wrEnb_xmem         : std_logic;
  SIGNAL SDFCummutator_xX_vld_reg         : std_logic;
  SIGNAL SDFCummutator_out_re_next        : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFCummutator_out_im_next        : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFCummutator_out_vld_next       : std_logic;
  SIGNAL SDFCummutator_wrAddr_reg_next    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL SDFCummutator_wrState_next       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_mem_btf_switch_next : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFCummutator_rdCnt_next         : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL SDFCummutator_wrData_re_reg_next : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFCummutator_wrData_im_reg_next : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFCummutator_wrEnb_reg_next     : std_logic;
  SIGNAL SDFCummutator_wrXData_re_reg_next : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFCummutator_wrXData_im_reg_next : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFCummutator_xWrAddr_next       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_wrxEnb_reg_next    : std_logic;
  SIGNAL SDFCummutator_xRdAddr_next       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_XState_next        : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_rdEnb_xmem_next    : std_logic;
  SIGNAL SDFCummutator_wrEnb_xmem_next    : std_logic;
  SIGNAL SDFCummutator_xX_vld_reg_next    : std_logic;
  SIGNAL wrData_re_tmp                    : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL wrData_im_tmp                    : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL wrAddr_tmp                       : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL xData_re                         : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL xData_im                         : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL wrXAddr                          : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL wrXEnb                           : std_logic;
  SIGNAL rdXAddr                          : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL xX_vld                           : std_logic;
  SIGNAL dout0_re                         : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL dout0_im                         : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL dout0_vld                        : std_logic;
  SIGNAL xX_re                            : std_logic_vector(18 DOWNTO 0);  -- ufix19
  SIGNAL xX_re_signed                     : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL xX_im                            : std_logic_vector(18 DOWNTO 0);  -- ufix19
  SIGNAL xX_im_signed                     : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFOutmux_btf2Pipe_re            : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL SDFOutmux_btf2Pipe_im            : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL SDFOutmux_btfPipe_vld            : std_logic;
  SIGNAL SDFOutmux_btf2Pipe_re_next       : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFOutmux_btf2Pipe_im_next       : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL SDFOutmux_btfPipe_vld_next       : std_logic;
  SIGNAL dout_3_1_re_tmp                  : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL dout_3_1_im_tmp                  : signed(18 DOWNTO 0);  -- sfix19_En15

BEGIN
  u_dataXMEM_re_0_3 : mw_spectrumanalyser_src_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 3,
                 DataWidth => 19
                 )
    PORT MAP( clk => clk,
              enb_1_16_0 => enb_1_16_0,
              wr_din => std_logic_vector(xData_re),
              wr_addr => std_logic_vector(wrXAddr),
              wr_en => wrXEnb,
              rd_addr => std_logic_vector(rdXAddr),
              rd_dout => xX_re
              );

  u_dataXMEM_im_0_3 : mw_spectrumanalyser_src_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 3,
                 DataWidth => 19
                 )
    PORT MAP( clk => clk,
              enb_1_16_0 => enb_1_16_0,
              wr_din => std_logic_vector(xData_im),
              wr_addr => std_logic_vector(wrXAddr),
              wr_en => wrXEnb,
              rd_addr => std_logic_vector(rdXAddr),
              rd_dout => xX_im
              );

  xf_re_signed <= signed(xf_re);

  xf_im_signed <= signed(xf_im);

  dinXTwdlf_re_signed <= signed(dinXTwdlf_re);

  dinXTwdlf_im_signed <= signed(dinXTwdlf_im);

  btf1_re_signed <= signed(btf1_re);

  btf1_im_signed <= signed(btf1_im);

  btf2_re_signed <= signed(btf2_re);

  btf2_im_signed <= signed(btf2_im);

  -- SDFCummutator
  SDFCummutator_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      SDFCummutator_out_re <= to_signed(16#00000#, 19);
      SDFCummutator_out_im <= to_signed(16#00000#, 19);
      SDFCummutator_wrData_re_reg <= to_signed(16#00000#, 19);
      SDFCummutator_wrData_im_reg <= to_signed(16#00000#, 19);
      SDFCummutator_wrEnb_reg <= '0';
      SDFCummutator_out_vld <= '0';
      SDFCummutator_wrState <= to_unsigned(16#0#, 3);
      SDFCummutator_mem_btf_switch <= to_unsigned(16#0#, 2);
      SDFCummutator_wrAddr_reg <= to_unsigned(16#000#, 9);
      SDFCummutator_rdCnt <= to_unsigned(16#000#, 9);
      SDFCummutator_wrXData_re_reg <= to_signed(16#00000#, 19);
      SDFCummutator_wrXData_im_reg <= to_signed(16#00000#, 19);
      SDFCummutator_xWrAddr <= to_unsigned(16#0#, 3);
      SDFCummutator_wrxEnb_reg <= '0';
      SDFCummutator_xRdAddr <= to_unsigned(16#0#, 3);
      SDFCummutator_XState <= to_unsigned(16#0#, 3);
      SDFCummutator_rdEnb_xmem <= '0';
      SDFCummutator_wrEnb_xmem <= '0';
      SDFCummutator_xX_vld_reg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        SDFCummutator_out_re <= SDFCummutator_out_re_next;
        SDFCummutator_out_im <= SDFCummutator_out_im_next;
        SDFCummutator_out_vld <= SDFCummutator_out_vld_next;
        SDFCummutator_wrAddr_reg <= SDFCummutator_wrAddr_reg_next;
        SDFCummutator_wrState <= SDFCummutator_wrState_next;
        SDFCummutator_mem_btf_switch <= SDFCummutator_mem_btf_switch_next;
        SDFCummutator_rdCnt <= SDFCummutator_rdCnt_next;
        SDFCummutator_wrData_re_reg <= SDFCummutator_wrData_re_reg_next;
        SDFCummutator_wrData_im_reg <= SDFCummutator_wrData_im_reg_next;
        SDFCummutator_wrEnb_reg <= SDFCummutator_wrEnb_reg_next;
        SDFCummutator_wrXData_re_reg <= SDFCummutator_wrXData_re_reg_next;
        SDFCummutator_wrXData_im_reg <= SDFCummutator_wrXData_im_reg_next;
        SDFCummutator_xWrAddr <= SDFCummutator_xWrAddr_next;
        SDFCummutator_wrxEnb_reg <= SDFCummutator_wrxEnb_reg_next;
        SDFCummutator_xRdAddr <= SDFCummutator_xRdAddr_next;
        SDFCummutator_XState <= SDFCummutator_XState_next;
        SDFCummutator_rdEnb_xmem <= SDFCummutator_rdEnb_xmem_next;
        SDFCummutator_wrEnb_xmem <= SDFCummutator_wrEnb_xmem_next;
        SDFCummutator_xX_vld_reg <= SDFCummutator_xX_vld_reg_next;
      END IF;
    END IF;
  END PROCESS SDFCummutator_process;

  SDFCummutator_output : PROCESS (SDFCummutator_XState, SDFCummutator_mem_btf_switch, SDFCummutator_out_im,
       SDFCummutator_out_re, SDFCummutator_out_vld, SDFCummutator_rdCnt,
       SDFCummutator_rdEnb_xmem, SDFCummutator_wrAddr_reg,
       SDFCummutator_wrData_im_reg, SDFCummutator_wrData_re_reg,
       SDFCummutator_wrEnb_reg, SDFCummutator_wrEnb_xmem, SDFCummutator_wrState,
       SDFCummutator_wrXData_im_reg, SDFCummutator_wrXData_re_reg,
       SDFCummutator_wrxEnb_reg, SDFCummutator_xRdAddr, SDFCummutator_xWrAddr,
       SDFCummutator_xX_vld_reg, btf1_im_signed, btf1_re_signed, btf2_im_signed,
       btf2_re_signed, btf_vld, dinXTwdlf_im_signed, dinXTwdlf_re_signed,
       dinxTwdlf_vld, xf_im_signed, xf_re_signed, xf_vld)
  BEGIN
    SDFCummutator_out_re_next <= SDFCummutator_out_re;
    SDFCummutator_out_im_next <= SDFCummutator_out_im;
    SDFCummutator_out_vld_next <= SDFCummutator_out_vld;
    SDFCummutator_wrAddr_reg_next <= SDFCummutator_wrAddr_reg;
    SDFCummutator_wrState_next <= SDFCummutator_wrState;
    SDFCummutator_mem_btf_switch_next <= SDFCummutator_mem_btf_switch;
    SDFCummutator_rdCnt_next <= SDFCummutator_rdCnt;
    SDFCummutator_wrData_re_reg_next <= SDFCummutator_wrData_re_reg;
    SDFCummutator_wrData_im_reg_next <= SDFCummutator_wrData_im_reg;
    SDFCummutator_wrEnb_reg_next <= SDFCummutator_wrEnb_reg;
    SDFCummutator_wrXData_re_reg_next <= SDFCummutator_wrXData_re_reg;
    SDFCummutator_wrXData_im_reg_next <= SDFCummutator_wrXData_im_reg;
    SDFCummutator_xWrAddr_next <= SDFCummutator_xWrAddr;
    SDFCummutator_wrxEnb_reg_next <= SDFCummutator_wrxEnb_reg;
    SDFCummutator_xRdAddr_next <= SDFCummutator_xRdAddr;
    SDFCummutator_XState_next <= SDFCummutator_XState;
    SDFCummutator_rdEnb_xmem_next <= SDFCummutator_rdEnb_xmem;
    SDFCummutator_wrEnb_xmem_next <= SDFCummutator_wrEnb_xmem;
    SDFCummutator_xX_vld_reg_next <= SDFCummutator_xX_vld_reg;
    CASE SDFCummutator_XState IS
      WHEN "000" =>
        SDFCummutator_wrXData_re_reg_next <= to_signed(16#00000#, 19);
        SDFCummutator_wrXData_im_reg_next <= to_signed(16#00000#, 19);
        SDFCummutator_xWrAddr_next <= to_unsigned(16#0#, 3);
        SDFCummutator_xRdAddr_next <= to_unsigned(16#0#, 3);
        SDFCummutator_wrxEnb_reg_next <= '0';
        SDFCummutator_xX_vld_reg_next <= '0';
        SDFCummutator_XState_next <= to_unsigned(16#0#, 3);
        IF ((SDFCummutator_wrEnb_xmem AND hdlcoder_to_stdlogic(SDFCummutator_wrAddr_reg = to_unsigned(16#1F7#, 9))) AND SDFCummutator_wrEnb_reg) = '1' THEN 
          SDFCummutator_wrXData_re_reg_next <= btf2_re_signed;
          SDFCummutator_wrXData_im_reg_next <= btf2_im_signed;
          SDFCummutator_xWrAddr_next <= to_unsigned(16#0#, 3);
          IF btf_vld = '1' THEN 
            SDFCummutator_wrxEnb_reg_next <= '1';
            SDFCummutator_XState_next <= to_unsigned(16#2#, 3);
          ELSE 
            SDFCummutator_wrxEnb_reg_next <= '0';
            SDFCummutator_XState_next <= to_unsigned(16#1#, 3);
          END IF;
        END IF;
      WHEN "001" =>
        SDFCummutator_XState_next <= to_unsigned(16#1#, 3);
        SDFCummutator_xX_vld_reg_next <= '0';
        IF btf_vld = '1' THEN 
          SDFCummutator_wrXData_re_reg_next <= btf2_re_signed;
          SDFCummutator_wrXData_im_reg_next <= btf2_im_signed;
          SDFCummutator_xWrAddr_next <= to_unsigned(16#0#, 3);
          SDFCummutator_wrxEnb_reg_next <= '1';
          SDFCummutator_XState_next <= to_unsigned(16#2#, 3);
        END IF;
      WHEN "010" =>
        SDFCummutator_wrXData_re_reg_next <= btf2_re_signed;
        SDFCummutator_wrXData_im_reg_next <= btf2_im_signed;
        SDFCummutator_xX_vld_reg_next <= '0';
        IF SDFCummutator_xWrAddr = to_unsigned(16#7#, 3) THEN 
          SDFCummutator_wrxEnb_reg_next <= '0';
          IF SDFCummutator_rdEnb_xmem = '1' THEN 
            SDFCummutator_XState_next <= to_unsigned(16#4#, 3);
            SDFCummutator_xX_vld_reg_next <= '1';
            SDFCummutator_xRdAddr_next <= to_unsigned(16#1#, 3);
          ELSE 
            SDFCummutator_XState_next <= to_unsigned(16#3#, 3);
          END IF;
          SDFCummutator_xWrAddr_next <= to_unsigned(16#0#, 3);
        ELSIF btf_vld = '1' THEN 
          SDFCummutator_XState_next <= to_unsigned(16#2#, 3);
          SDFCummutator_wrxEnb_reg_next <= '1';
          SDFCummutator_xWrAddr_next <= SDFCummutator_xWrAddr + to_unsigned(16#1#, 3);
        ELSE 
          SDFCummutator_XState_next <= to_unsigned(16#2#, 3);
          SDFCummutator_wrxEnb_reg_next <= '0';
        END IF;
      WHEN "011" =>
        IF SDFCummutator_rdEnb_xmem = '1' THEN 
          SDFCummutator_XState_next <= to_unsigned(16#4#, 3);
          SDFCummutator_xX_vld_reg_next <= '1';
          SDFCummutator_xRdAddr_next <= to_unsigned(16#1#, 3);
        END IF;
      WHEN "100" =>
        IF SDFCummutator_xRdAddr = to_unsigned(16#7#, 3) THEN 
          SDFCummutator_xX_vld_reg_next <= '1';
          SDFCummutator_xWrAddr_next <= to_unsigned(16#0#, 3);
          SDFCummutator_xRdAddr_next <= to_unsigned(16#0#, 3);
          IF SDFCummutator_wrEnb_xmem = '1' THEN 
            SDFCummutator_wrXData_re_reg_next <= btf2_re_signed;
            SDFCummutator_wrXData_im_reg_next <= btf2_im_signed;
            IF btf_vld = '1' THEN 
              SDFCummutator_wrxEnb_reg_next <= '1';
              SDFCummutator_XState_next <= to_unsigned(16#2#, 3);
            ELSE 
              SDFCummutator_wrxEnb_reg_next <= '0';
              SDFCummutator_XState_next <= to_unsigned(16#1#, 3);
            END IF;
          ELSE 
            SDFCummutator_XState_next <= to_unsigned(16#0#, 3);
            SDFCummutator_wrxEnb_reg_next <= '0';
            SDFCummutator_wrXData_re_reg_next <= to_signed(16#00000#, 19);
            SDFCummutator_wrXData_im_reg_next <= to_signed(16#00000#, 19);
          END IF;
        ELSE 
          SDFCummutator_xRdAddr_next <= SDFCummutator_xRdAddr + to_unsigned(16#1#, 3);
        END IF;
      WHEN OTHERS => 
        SDFCummutator_wrXData_re_reg_next <= to_signed(16#00000#, 19);
        SDFCummutator_wrXData_im_reg_next <= to_signed(16#00000#, 19);
        SDFCummutator_xWrAddr_next <= to_unsigned(16#0#, 3);
        SDFCummutator_xRdAddr_next <= to_unsigned(16#0#, 3);
        SDFCummutator_wrxEnb_reg_next <= '0';
        SDFCummutator_XState_next <= to_unsigned(16#0#, 3);
    END CASE;
    CASE SDFCummutator_mem_btf_switch IS
      WHEN "00" =>
        SDFCummutator_mem_btf_switch_next <= to_unsigned(16#0#, 2);
        SDFCummutator_rdCnt_next <= to_unsigned(16#000#, 9);
        SDFCummutator_out_re_next <= xf_re_signed;
        SDFCummutator_out_im_next <= xf_im_signed;
        SDFCummutator_out_vld_next <= '0';
        SDFCummutator_rdEnb_xmem_next <= '0';
        IF dinxTwdlf_vld = '1' THEN 
          SDFCummutator_mem_btf_switch_next <= to_unsigned(16#1#, 2);
          SDFCummutator_rdCnt_next <= to_unsigned(16#000#, 9);
        END IF;
      WHEN "01" =>
        SDFCummutator_mem_btf_switch_next <= to_unsigned(16#1#, 2);
        SDFCummutator_rdEnb_xmem_next <= '0';
        IF (hdlcoder_to_stdlogic(SDFCummutator_rdCnt = to_unsigned(16#1FF#, 9)) AND btf_vld) = '1' THEN 
          SDFCummutator_mem_btf_switch_next <= to_unsigned(16#2#, 2);
        END IF;
        IF btf_vld = '1' THEN 
          SDFCummutator_rdCnt_next <= SDFCummutator_rdCnt + to_unsigned(16#001#, 9);
        END IF;
        SDFCummutator_out_re_next <= btf1_re_signed;
        SDFCummutator_out_im_next <= btf1_im_signed;
        SDFCummutator_out_vld_next <= btf_vld;
      WHEN "10" =>
        SDFCummutator_mem_btf_switch_next <= to_unsigned(16#2#, 2);
        IF (hdlcoder_to_stdlogic(SDFCummutator_rdCnt = to_unsigned(16#1F7#, 9)) AND xf_vld) = '1' THEN 
          SDFCummutator_mem_btf_switch_next <= to_unsigned(16#1#, 2);
          SDFCummutator_rdEnb_xmem_next <= '1';
        END IF;
        IF xf_vld = '1' THEN 
          IF SDFCummutator_rdCnt = to_unsigned(16#1F7#, 9) THEN 
            SDFCummutator_rdCnt_next <= to_unsigned(16#000#, 9);
          ELSE 
            SDFCummutator_rdCnt_next <= SDFCummutator_rdCnt + to_unsigned(16#001#, 9);
          END IF;
        END IF;
        SDFCummutator_out_re_next <= xf_re_signed;
        SDFCummutator_out_im_next <= xf_im_signed;
        SDFCummutator_out_vld_next <= xf_vld;
      WHEN OTHERS => 
        SDFCummutator_mem_btf_switch_next <= to_unsigned(16#0#, 2);
        SDFCummutator_rdCnt_next <= to_unsigned(16#000#, 9);
        SDFCummutator_out_re_next <= xf_re_signed;
        SDFCummutator_out_im_next <= xf_im_signed;
        SDFCummutator_out_vld_next <= xf_vld;
    END CASE;
    CASE SDFCummutator_wrState IS
      WHEN "000" =>
        SDFCummutator_wrState_next <= to_unsigned(16#0#, 3);
        SDFCummutator_wrEnb_xmem_next <= '0';
        SDFCummutator_wrAddr_reg_next <= to_unsigned(16#000#, 9);
        SDFCummutator_wrData_re_reg_next <= dinXTwdlf_re_signed;
        SDFCummutator_wrData_im_reg_next <= dinXTwdlf_im_signed;
        IF dinxTwdlf_vld = '1' THEN 
          SDFCummutator_wrState_next <= to_unsigned(16#1#, 3);
          SDFCummutator_wrAddr_reg_next <= to_unsigned(16#000#, 9);
          SDFCummutator_wrEnb_reg_next <= '1';
        END IF;
      WHEN "001" =>
        SDFCummutator_wrState_next <= to_unsigned(16#1#, 3);
        SDFCummutator_wrEnb_reg_next <= '0';
        SDFCummutator_wrEnb_xmem_next <= '0';
        IF SDFCummutator_wrAddr_reg = to_unsigned(16#1FF#, 9) THEN 
          IF btf_vld = '1' THEN 
            SDFCummutator_wrState_next <= to_unsigned(16#2#, 3);
          ELSE 
            SDFCummutator_wrState_next <= to_unsigned(16#4#, 3);
          END IF;
          SDFCummutator_wrAddr_reg_next <= to_unsigned(16#000#, 9);
          SDFCummutator_wrEnb_reg_next <= btf_vld;
          SDFCummutator_wrData_re_reg_next <= btf2_re_signed;
          SDFCummutator_wrData_im_reg_next <= btf2_im_signed;
        ELSIF dinxTwdlf_vld = '1' THEN 
          SDFCummutator_wrState_next <= to_unsigned(16#1#, 3);
          SDFCummutator_wrAddr_reg_next <= SDFCummutator_wrAddr_reg + to_unsigned(16#001#, 9);
          SDFCummutator_wrEnb_reg_next <= '1';
          SDFCummutator_wrData_re_reg_next <= dinXTwdlf_re_signed;
          SDFCummutator_wrData_im_reg_next <= dinXTwdlf_im_signed;
        END IF;
      WHEN "010" =>
        SDFCummutator_wrState_next <= to_unsigned(16#2#, 3);
        SDFCummutator_wrEnb_reg_next <= '0';
        SDFCummutator_wrEnb_xmem_next <= '0';
        IF SDFCummutator_wrAddr_reg = to_unsigned(16#1F6#, 9) THEN 
          SDFCummutator_wrEnb_xmem_next <= '1';
        END IF;
        IF SDFCummutator_wrAddr_reg = to_unsigned(16#1F7#, 9) THEN 
          SDFCummutator_wrAddr_reg_next <= SDFCummutator_wrAddr_reg + to_unsigned(16#001#, 9);
          SDFCummutator_wrState_next <= to_unsigned(16#3#, 3);
          SDFCummutator_wrEnb_reg_next <= '0';
          SDFCummutator_wrData_re_reg_next <= dinXTwdlf_re_signed;
          SDFCummutator_wrData_im_reg_next <= dinXTwdlf_im_signed;
        ELSIF btf_vld = '1' THEN 
          SDFCummutator_wrState_next <= to_unsigned(16#2#, 3);
          SDFCummutator_wrAddr_reg_next <= SDFCummutator_wrAddr_reg + to_unsigned(16#001#, 9);
          SDFCummutator_wrEnb_reg_next <= '1';
          SDFCummutator_wrData_re_reg_next <= btf2_re_signed;
          SDFCummutator_wrData_im_reg_next <= btf2_im_signed;
        END IF;
      WHEN "011" =>
        SDFCummutator_wrAddr_reg_next <= to_unsigned(16#000#, 9);
        SDFCummutator_wrEnb_reg_next <= dinxTwdlf_vld;
        SDFCummutator_wrData_re_reg_next <= dinXTwdlf_re_signed;
        SDFCummutator_wrData_im_reg_next <= dinXTwdlf_im_signed;
        SDFCummutator_wrEnb_xmem_next <= '0';
        IF dinxTwdlf_vld = '1' THEN 
          SDFCummutator_wrState_next <= to_unsigned(16#1#, 3);
        ELSE 
          SDFCummutator_wrState_next <= to_unsigned(16#0#, 3);
        END IF;
      WHEN "100" =>
        SDFCummutator_wrState_next <= to_unsigned(16#4#, 3);
        SDFCummutator_wrEnb_reg_next <= '0';
        SDFCummutator_wrEnb_xmem_next <= '0';
        IF btf_vld = '1' THEN 
          SDFCummutator_wrState_next <= to_unsigned(16#2#, 3);
          SDFCummutator_wrAddr_reg_next <= to_unsigned(16#000#, 9);
          SDFCummutator_wrEnb_reg_next <= '1';
          SDFCummutator_wrData_re_reg_next <= btf2_re_signed;
          SDFCummutator_wrData_im_reg_next <= btf2_im_signed;
        END IF;
      WHEN OTHERS => 
        SDFCummutator_wrState_next <= to_unsigned(16#0#, 3);
        SDFCummutator_wrAddr_reg_next <= to_unsigned(16#000#, 9);
        SDFCummutator_wrEnb_reg_next <= dinxTwdlf_vld;
        SDFCummutator_wrData_re_reg_next <= dinXTwdlf_re_signed;
        SDFCummutator_wrData_im_reg_next <= dinXTwdlf_im_signed;
    END CASE;
    wrData_re_tmp <= SDFCummutator_wrData_re_reg;
    wrData_im_tmp <= SDFCummutator_wrData_im_reg;
    wrAddr_tmp <= SDFCummutator_wrAddr_reg;
    wrEnb <= SDFCummutator_wrEnb_reg;
    xData_re <= SDFCummutator_wrXData_re_reg;
    xData_im <= SDFCummutator_wrXData_im_reg;
    wrXAddr <= SDFCummutator_xWrAddr;
    wrXEnb <= SDFCummutator_wrxEnb_reg;
    rdXAddr <= SDFCummutator_xRdAddr;
    xX_vld <= SDFCummutator_xX_vld_reg;
    dout0_re <= SDFCummutator_out_re;
    dout0_im <= SDFCummutator_out_im;
    dout0_vld <= SDFCummutator_out_vld;
  END PROCESS SDFCummutator_output;


  wrData_re <= std_logic_vector(wrData_re_tmp);

  wrData_im <= std_logic_vector(wrData_im_tmp);

  wrAddr <= std_logic_vector(wrAddr_tmp);

  xX_re_signed <= signed(xX_re);

  xX_im_signed <= signed(xX_im);

  -- SDFOutmux
  SDFOutmux_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      SDFOutmux_btf2Pipe_re <= to_signed(16#00000#, 19);
      SDFOutmux_btf2Pipe_im <= to_signed(16#00000#, 19);
      SDFOutmux_btfPipe_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        SDFOutmux_btf2Pipe_re <= SDFOutmux_btf2Pipe_re_next;
        SDFOutmux_btf2Pipe_im <= SDFOutmux_btf2Pipe_im_next;
        SDFOutmux_btfPipe_vld <= SDFOutmux_btfPipe_vld_next;
      END IF;
    END IF;
  END PROCESS SDFOutmux_process;

  SDFOutmux_output : PROCESS (SDFOutmux_btf2Pipe_im, SDFOutmux_btf2Pipe_re, SDFOutmux_btfPipe_vld, dout0_im,
       dout0_re, dout0_vld, xX_im_signed, xX_re_signed, xX_vld)
  BEGIN
    SDFOutmux_btf2Pipe_re_next <= SDFOutmux_btf2Pipe_re;
    SDFOutmux_btf2Pipe_im_next <= SDFOutmux_btf2Pipe_im;
    SDFOutmux_btfPipe_vld_next <= SDFOutmux_btfPipe_vld;
    IF dout0_vld = '1' THEN 
      SDFOutmux_btf2Pipe_re_next <= dout0_re;
      SDFOutmux_btf2Pipe_im_next <= dout0_im;
      SDFOutmux_btfPipe_vld_next <= '1';
    ELSIF xX_vld = '1' THEN 
      SDFOutmux_btf2Pipe_re_next <= xX_re_signed;
      SDFOutmux_btf2Pipe_im_next <= xX_im_signed;
      SDFOutmux_btfPipe_vld_next <= '1';
    ELSE 
      SDFOutmux_btfPipe_vld_next <= '0';
    END IF;
    dout_3_1_re_tmp <= SDFOutmux_btf2Pipe_re;
    dout_3_1_im_tmp <= SDFOutmux_btf2Pipe_im;
    dout_3_1_vld <= SDFOutmux_btfPipe_vld;
  END PROCESS SDFOutmux_output;


  dout_3_1_re <= std_logic_vector(dout_3_1_re_tmp);

  dout_3_1_im <= std_logic_vector(dout_3_1_im_tmp);

END rtl;

