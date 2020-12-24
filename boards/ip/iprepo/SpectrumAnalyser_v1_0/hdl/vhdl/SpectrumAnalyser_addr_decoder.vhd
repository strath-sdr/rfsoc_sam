-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_addr_decoder.vhd
-- Created: 2020-12-24 11:44:01
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_addr_decoder
-- Source Path: SpectrumAnalyser/SpectrumAnalyser_axi_lite/SpectrumAnalyser_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_WReady                       :   IN    std_logic;  -- ufix1
        read_Buffer_Pointer               :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        read_DMA_Status                   :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_AXI4_Master_Rd_base_address :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_AXI4_Master_Wr_base_address :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Packet_Size                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_SSR_Mode                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Units                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Type                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Vrms                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Type_Scale                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Power_Scale                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Selector                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_WLength                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_WAddress                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_WEnable                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Length                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Buffer_Address_1            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Buffer_Address_2            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Buffer_Address_3            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Enable                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Count                       :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END SpectrumAnalyser_addr_decoder;


ARCHITECTURE rtl OF SpectrumAnalyser_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_WReady_1_1            : std_logic;  -- ufix1
  SIGNAL decode_sel_Count_1_1             : std_logic;  -- ufix1
  SIGNAL decode_sel_Enable_1_1            : std_logic;  -- ufix1
  SIGNAL decode_sel_Buffer_Address_3_1_1  : std_logic;  -- ufix1
  SIGNAL decode_sel_Buffer_Address_2_1_1  : std_logic;  -- ufix1
  SIGNAL decode_sel_Buffer_Address_1_1_1  : std_logic;  -- ufix1
  SIGNAL decode_sel_Length_1_1            : std_logic;  -- ufix1
  SIGNAL decode_sel_WEnable_1_1           : std_logic;  -- ufix1
  SIGNAL decode_sel_WAddress_1_1          : std_logic;  -- ufix1
  SIGNAL decode_sel_WLength_1_1           : std_logic;  -- ufix1
  SIGNAL decode_sel_Selector_1_1          : std_logic;  -- ufix1
  SIGNAL decode_sel_Power_Scale_1_1       : std_logic;  -- ufix1
  SIGNAL decode_sel_Type_Scale_1_1        : std_logic;  -- ufix1
  SIGNAL decode_sel_Vrms_1_1              : std_logic;  -- ufix1
  SIGNAL decode_sel_Type_1_1              : std_logic;  -- ufix1
  SIGNAL decode_sel_Units_1_1             : std_logic;  -- ufix1
  SIGNAL decode_sel_SSR_Mode_1_1          : std_logic;  -- ufix1
  SIGNAL decode_sel_Packet_Size_1_1       : std_logic;  -- ufix1
  SIGNAL decode_sel_ip_timestamp_1_1      : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI4_Master_Wr_base_address_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_AXI4_Master_Rd_base_address_1_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_axi_enable_1_1        : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_axi_enable_1_1           : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL const_1_1                        : std_logic;  -- ufix1
  SIGNAL data_reg_axi_enable_1_1          : std_logic;  -- ufix1
  SIGNAL write_concats_axi_enable_1       : std_logic;  -- ufix1
  SIGNAL data_slice_axi_enable_1          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_axi_enable_1_1         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_AXI4_Master_Rd_base_address_1_1 : std_logic;  -- ufix1
  SIGNAL data_reg_AXI4_Master_Rd_base_address_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI4_Master_Rd_base_address_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_AXI4_Master_Wr_base_address_1_1 : std_logic;  -- ufix1
  SIGNAL data_reg_AXI4_Master_Wr_base_address_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ip_timestamp_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_AXI4_Master_Wr_base_address_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ip_timestamp            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ip_timestamp_1_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Packet_Size_1_1          : std_logic;  -- ufix1
  SIGNAL data_reg_Packet_Size_1_1         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Packet_Size_1_1        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_SSR_Mode_1_1             : std_logic;  -- ufix1
  SIGNAL data_reg_SSR_Mode_1_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_SSR_Mode_1_1           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Units_1_1                : std_logic;  -- ufix1
  SIGNAL data_reg_Units_1_1               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Units_1_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Type_1_1                 : std_logic;  -- ufix1
  SIGNAL data_reg_Type_1_1                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Type_1_1               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Vrms_1_1                 : std_logic;  -- ufix1
  SIGNAL data_reg_Vrms_1_1                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Vrms_1_1               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Type_Scale_1_1           : std_logic;  -- ufix1
  SIGNAL data_reg_Type_Scale_1_1          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Type_Scale_1_1         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Power_Scale_1_1          : std_logic;  -- ufix1
  SIGNAL data_reg_Power_Scale_1_1         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Power_Scale_1_1        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Selector_1_1             : std_logic;  -- ufix1
  SIGNAL data_reg_Selector_1_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Selector_1_1           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_WLength_1_1              : std_logic;  -- ufix1
  SIGNAL data_reg_WLength_1_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_WLength_1_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_WAddress_1_1             : std_logic;  -- ufix1
  SIGNAL data_reg_WAddress_1_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_WAddress_1_1           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_WEnable_1_1              : std_logic;  -- ufix1
  SIGNAL data_reg_WEnable_1_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_WEnable_1_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Length_1_1               : std_logic;  -- ufix1
  SIGNAL data_reg_Length_1_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Length_1_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Buffer_Address_1_1_1     : std_logic;  -- ufix1
  SIGNAL data_reg_Buffer_Address_1_1_1    : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Buffer_Address_1_1_1   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Buffer_Address_2_1_1     : std_logic;  -- ufix1
  SIGNAL data_reg_Buffer_Address_2_1_1    : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Buffer_Address_2_1_1   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Buffer_Address_3_1_1     : std_logic;  -- ufix1
  SIGNAL data_reg_Buffer_Address_3_1_1    : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Buffer_Address_3_1_1   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Enable_1_1               : std_logic;  -- ufix1
  SIGNAL data_reg_Enable_1_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Enable_1_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Count_1_1                : std_logic;  -- ufix1
  SIGNAL data_reg_Count_1_1               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_Buffer_Pointer_unsigned     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL read_DMA_Status_unsigned         : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL decode_sel_DMA_Status_1_1        : std_logic;  -- ufix1
  SIGNAL decode_sel_Buffer_Pointer_1_1    : std_logic;  -- ufix1
  SIGNAL decode_rd_Count_1_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_WReady                  : std_logic;  -- ufix1
  SIGNAL data_slice_WReady_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_WReady_1_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_Buffer_Pointer          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_slice_Buffer_Pointer_1      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Buffer_Pointer_1_1     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_DMA_Status              : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL data_slice_DMA_Status_1          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_DMA_Status_1_1         : unsigned(31 DOWNTO 0);  -- ufix32

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_WReady_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0051#, 14) ELSE
      '0';

  
  decode_sel_Count_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0050#, 14) ELSE
      '0';

  
  decode_sel_Enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004F#, 14) ELSE
      '0';

  
  decode_sel_Buffer_Address_3_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004E#, 14) ELSE
      '0';

  
  decode_sel_Buffer_Address_2_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004D#, 14) ELSE
      '0';

  
  decode_sel_Buffer_Address_1_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004C#, 14) ELSE
      '0';

  
  decode_sel_Length_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004B#, 14) ELSE
      '0';

  
  decode_sel_WEnable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004A#, 14) ELSE
      '0';

  
  decode_sel_WAddress_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0049#, 14) ELSE
      '0';

  
  decode_sel_WLength_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0048#, 14) ELSE
      '0';

  
  decode_sel_Selector_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0047#, 14) ELSE
      '0';

  
  decode_sel_Power_Scale_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0046#, 14) ELSE
      '0';

  
  decode_sel_Type_Scale_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0045#, 14) ELSE
      '0';

  
  decode_sel_Vrms_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0044#, 14) ELSE
      '0';

  
  decode_sel_Type_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0043#, 14) ELSE
      '0';

  
  decode_sel_Units_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  
  decode_sel_SSR_Mode_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  
  decode_sel_Packet_Size_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  
  decode_sel_ip_timestamp_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0004#, 14) ELSE
      '0';

  
  decode_sel_AXI4_Master_Wr_base_address_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0003#, 14) ELSE
      '0';

  
  decode_sel_AXI4_Master_Rd_base_address_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0002#, 14) ELSE
      '0';

  
  decode_sel_axi_enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0001#, 14) ELSE
      '0';

  const_0 <= to_unsigned(0, 32);

  reg_enb_axi_enable_1_1 <= decode_sel_axi_enable_1_1 AND wr_enb;

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  const_1_1 <= '1';

  enb <= const_1_1;

  reg_axi_enable_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_axi_enable_1_1 <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_axi_enable_1_1 = '1' THEN
        data_reg_axi_enable_1_1 <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_1_1_process;


  write_concats_axi_enable_1 <= data_reg_axi_enable_1_1;

  data_slice_axi_enable_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & write_concats_axi_enable_1;

  
  decode_rd_axi_enable_1_1 <= const_0 WHEN decode_sel_axi_enable_1_1 = '0' ELSE
      data_slice_axi_enable_1;

  reg_enb_AXI4_Master_Rd_base_address_1_1 <= decode_sel_AXI4_Master_Rd_base_address_1_1 AND wr_enb;

  reg_AXI4_Master_Rd_base_address_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_AXI4_Master_Rd_base_address_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_AXI4_Master_Rd_base_address_1_1 = '1' THEN
        data_reg_AXI4_Master_Rd_base_address_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI4_Master_Rd_base_address_1_1_process;


  
  decode_rd_AXI4_Master_Rd_base_address_1_1 <= decode_rd_axi_enable_1_1 WHEN decode_sel_AXI4_Master_Rd_base_address_1_1 = '0' ELSE
      data_reg_AXI4_Master_Rd_base_address_1_1;

  reg_enb_AXI4_Master_Wr_base_address_1_1 <= decode_sel_AXI4_Master_Wr_base_address_1_1 AND wr_enb;

  reg_AXI4_Master_Wr_base_address_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_AXI4_Master_Wr_base_address_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_AXI4_Master_Wr_base_address_1_1 = '1' THEN
        data_reg_AXI4_Master_Wr_base_address_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_AXI4_Master_Wr_base_address_1_1_process;


  read_ip_timestamp_unsigned <= unsigned(read_ip_timestamp);

  
  decode_rd_AXI4_Master_Wr_base_address_1_1 <= decode_rd_AXI4_Master_Rd_base_address_1_1 WHEN decode_sel_AXI4_Master_Wr_base_address_1_1 = '0' ELSE
      data_reg_AXI4_Master_Wr_base_address_1_1;

  reg_ip_timestamp_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_ip_timestamp <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ip_timestamp <= read_ip_timestamp_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ip_timestamp_process;


  
  decode_rd_ip_timestamp_1_1 <= decode_rd_AXI4_Master_Wr_base_address_1_1 WHEN decode_sel_ip_timestamp_1_1 = '0' ELSE
      read_reg_ip_timestamp;

  reg_enb_Packet_Size_1_1 <= decode_sel_Packet_Size_1_1 AND wr_enb;

  reg_Packet_Size_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Packet_Size_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Packet_Size_1_1 = '1' THEN
        data_reg_Packet_Size_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Packet_Size_1_1_process;


  
  decode_rd_Packet_Size_1_1 <= decode_rd_ip_timestamp_1_1 WHEN decode_sel_Packet_Size_1_1 = '0' ELSE
      data_reg_Packet_Size_1_1;

  reg_enb_SSR_Mode_1_1 <= decode_sel_SSR_Mode_1_1 AND wr_enb;

  reg_SSR_Mode_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_SSR_Mode_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_SSR_Mode_1_1 = '1' THEN
        data_reg_SSR_Mode_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_SSR_Mode_1_1_process;


  
  decode_rd_SSR_Mode_1_1 <= decode_rd_Packet_Size_1_1 WHEN decode_sel_SSR_Mode_1_1 = '0' ELSE
      data_reg_SSR_Mode_1_1;

  reg_enb_Units_1_1 <= decode_sel_Units_1_1 AND wr_enb;

  reg_Units_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Units_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Units_1_1 = '1' THEN
        data_reg_Units_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Units_1_1_process;


  
  decode_rd_Units_1_1 <= decode_rd_SSR_Mode_1_1 WHEN decode_sel_Units_1_1 = '0' ELSE
      data_reg_Units_1_1;

  reg_enb_Type_1_1 <= decode_sel_Type_1_1 AND wr_enb;

  reg_Type_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Type_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Type_1_1 = '1' THEN
        data_reg_Type_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Type_1_1_process;


  
  decode_rd_Type_1_1 <= decode_rd_Units_1_1 WHEN decode_sel_Type_1_1 = '0' ELSE
      data_reg_Type_1_1;

  reg_enb_Vrms_1_1 <= decode_sel_Vrms_1_1 AND wr_enb;

  reg_Vrms_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Vrms_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Vrms_1_1 = '1' THEN
        data_reg_Vrms_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Vrms_1_1_process;


  
  decode_rd_Vrms_1_1 <= decode_rd_Type_1_1 WHEN decode_sel_Vrms_1_1 = '0' ELSE
      data_reg_Vrms_1_1;

  reg_enb_Type_Scale_1_1 <= decode_sel_Type_Scale_1_1 AND wr_enb;

  reg_Type_Scale_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Type_Scale_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Type_Scale_1_1 = '1' THEN
        data_reg_Type_Scale_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Type_Scale_1_1_process;


  
  decode_rd_Type_Scale_1_1 <= decode_rd_Vrms_1_1 WHEN decode_sel_Type_Scale_1_1 = '0' ELSE
      data_reg_Type_Scale_1_1;

  reg_enb_Power_Scale_1_1 <= decode_sel_Power_Scale_1_1 AND wr_enb;

  reg_Power_Scale_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Power_Scale_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Power_Scale_1_1 = '1' THEN
        data_reg_Power_Scale_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Power_Scale_1_1_process;


  
  decode_rd_Power_Scale_1_1 <= decode_rd_Type_Scale_1_1 WHEN decode_sel_Power_Scale_1_1 = '0' ELSE
      data_reg_Power_Scale_1_1;

  reg_enb_Selector_1_1 <= decode_sel_Selector_1_1 AND wr_enb;

  reg_Selector_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Selector_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Selector_1_1 = '1' THEN
        data_reg_Selector_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Selector_1_1_process;


  
  decode_rd_Selector_1_1 <= decode_rd_Power_Scale_1_1 WHEN decode_sel_Selector_1_1 = '0' ELSE
      data_reg_Selector_1_1;

  reg_enb_WLength_1_1 <= decode_sel_WLength_1_1 AND wr_enb;

  reg_WLength_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_WLength_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_WLength_1_1 = '1' THEN
        data_reg_WLength_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_WLength_1_1_process;


  
  decode_rd_WLength_1_1 <= decode_rd_Selector_1_1 WHEN decode_sel_WLength_1_1 = '0' ELSE
      data_reg_WLength_1_1;

  reg_enb_WAddress_1_1 <= decode_sel_WAddress_1_1 AND wr_enb;

  reg_WAddress_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_WAddress_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_WAddress_1_1 = '1' THEN
        data_reg_WAddress_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_WAddress_1_1_process;


  
  decode_rd_WAddress_1_1 <= decode_rd_WLength_1_1 WHEN decode_sel_WAddress_1_1 = '0' ELSE
      data_reg_WAddress_1_1;

  reg_enb_WEnable_1_1 <= decode_sel_WEnable_1_1 AND wr_enb;

  reg_WEnable_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_WEnable_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_WEnable_1_1 = '1' THEN
        data_reg_WEnable_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_WEnable_1_1_process;


  
  decode_rd_WEnable_1_1 <= decode_rd_WAddress_1_1 WHEN decode_sel_WEnable_1_1 = '0' ELSE
      data_reg_WEnable_1_1;

  reg_enb_Length_1_1 <= decode_sel_Length_1_1 AND wr_enb;

  reg_Length_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Length_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Length_1_1 = '1' THEN
        data_reg_Length_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Length_1_1_process;


  
  decode_rd_Length_1_1 <= decode_rd_WEnable_1_1 WHEN decode_sel_Length_1_1 = '0' ELSE
      data_reg_Length_1_1;

  reg_enb_Buffer_Address_1_1_1 <= decode_sel_Buffer_Address_1_1_1 AND wr_enb;

  reg_Buffer_Address_1_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Buffer_Address_1_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Buffer_Address_1_1_1 = '1' THEN
        data_reg_Buffer_Address_1_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Buffer_Address_1_1_1_process;


  
  decode_rd_Buffer_Address_1_1_1 <= decode_rd_Length_1_1 WHEN decode_sel_Buffer_Address_1_1_1 = '0' ELSE
      data_reg_Buffer_Address_1_1_1;

  reg_enb_Buffer_Address_2_1_1 <= decode_sel_Buffer_Address_2_1_1 AND wr_enb;

  reg_Buffer_Address_2_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Buffer_Address_2_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Buffer_Address_2_1_1 = '1' THEN
        data_reg_Buffer_Address_2_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Buffer_Address_2_1_1_process;


  
  decode_rd_Buffer_Address_2_1_1 <= decode_rd_Buffer_Address_1_1_1 WHEN decode_sel_Buffer_Address_2_1_1 = '0' ELSE
      data_reg_Buffer_Address_2_1_1;

  reg_enb_Buffer_Address_3_1_1 <= decode_sel_Buffer_Address_3_1_1 AND wr_enb;

  reg_Buffer_Address_3_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Buffer_Address_3_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Buffer_Address_3_1_1 = '1' THEN
        data_reg_Buffer_Address_3_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Buffer_Address_3_1_1_process;


  
  decode_rd_Buffer_Address_3_1_1 <= decode_rd_Buffer_Address_2_1_1 WHEN decode_sel_Buffer_Address_3_1_1 = '0' ELSE
      data_reg_Buffer_Address_3_1_1;

  reg_enb_Enable_1_1 <= decode_sel_Enable_1_1 AND wr_enb;

  reg_Enable_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Enable_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Enable_1_1 = '1' THEN
        data_reg_Enable_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Enable_1_1_process;


  
  decode_rd_Enable_1_1 <= decode_rd_Buffer_Address_3_1_1 WHEN decode_sel_Enable_1_1 = '0' ELSE
      data_reg_Enable_1_1;

  reg_enb_Count_1_1 <= decode_sel_Count_1_1 AND wr_enb;

  reg_Count_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Count_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Count_1_1 = '1' THEN
        data_reg_Count_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Count_1_1_process;


  read_Buffer_Pointer_unsigned <= unsigned(read_Buffer_Pointer);

  read_DMA_Status_unsigned <= unsigned(read_DMA_Status);

  
  decode_sel_DMA_Status_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0053#, 14) ELSE
      '0';

  
  decode_sel_Buffer_Pointer_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0052#, 14) ELSE
      '0';

  
  decode_rd_Count_1_1 <= decode_rd_Enable_1_1 WHEN decode_sel_Count_1_1 = '0' ELSE
      data_reg_Count_1_1;

  reg_WReady_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_WReady <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_WReady <= read_WReady;
      END IF;
    END IF;
  END PROCESS reg_WReady_process;


  data_slice_WReady_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_WReady;

  
  decode_rd_WReady_1_1 <= decode_rd_Count_1_1 WHEN decode_sel_WReady_1_1 = '0' ELSE
      data_slice_WReady_1;

  reg_Buffer_Pointer_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_Buffer_Pointer <= to_unsigned(16#0#, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_Buffer_Pointer <= read_Buffer_Pointer_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Buffer_Pointer_process;


  data_slice_Buffer_Pointer_1 <= resize(read_reg_Buffer_Pointer, 32);

  
  decode_rd_Buffer_Pointer_1_1 <= decode_rd_WReady_1_1 WHEN decode_sel_Buffer_Pointer_1_1 = '0' ELSE
      data_slice_Buffer_Pointer_1;

  reg_DMA_Status_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_DMA_Status <= to_unsigned(16#00#, 6);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_DMA_Status <= read_DMA_Status_unsigned;
      END IF;
    END IF;
  END PROCESS reg_DMA_Status_process;


  data_slice_DMA_Status_1 <= resize(read_reg_DMA_Status, 32);

  
  decode_rd_DMA_Status_1_1 <= decode_rd_Buffer_Pointer_1_1 WHEN decode_sel_DMA_Status_1_1 = '0' ELSE
      data_slice_DMA_Status_1;

  data_read <= std_logic_vector(decode_rd_DMA_Status_1_1);

  write_axi_enable <= write_concats_axi_enable_1;

  write_AXI4_Master_Rd_base_address <= std_logic_vector(data_reg_AXI4_Master_Rd_base_address_1_1);

  write_AXI4_Master_Wr_base_address <= std_logic_vector(data_reg_AXI4_Master_Wr_base_address_1_1);

  write_Packet_Size <= std_logic_vector(data_reg_Packet_Size_1_1);

  write_SSR_Mode <= std_logic_vector(data_reg_SSR_Mode_1_1);

  write_Units <= std_logic_vector(data_reg_Units_1_1);

  write_Type <= std_logic_vector(data_reg_Type_1_1);

  write_Vrms <= std_logic_vector(data_reg_Vrms_1_1);

  write_Type_Scale <= std_logic_vector(data_reg_Type_Scale_1_1);

  write_Power_Scale <= std_logic_vector(data_reg_Power_Scale_1_1);

  write_Selector <= std_logic_vector(data_reg_Selector_1_1);

  write_WLength <= std_logic_vector(data_reg_WLength_1_1);

  write_WAddress <= std_logic_vector(data_reg_WAddress_1_1);

  write_WEnable <= std_logic_vector(data_reg_WEnable_1_1);

  write_Length <= std_logic_vector(data_reg_Length_1_1);

  write_Buffer_Address_1 <= std_logic_vector(data_reg_Buffer_Address_1_1_1);

  write_Buffer_Address_2 <= std_logic_vector(data_reg_Buffer_Address_2_1_1);

  write_Buffer_Address_3 <= std_logic_vector(data_reg_Buffer_Address_3_1_1);

  write_Enable <= std_logic_vector(data_reg_Enable_1_1);

  write_Count <= std_logic_vector(data_reg_Count_1_1);

END rtl;

