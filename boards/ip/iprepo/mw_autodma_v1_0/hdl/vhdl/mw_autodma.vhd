-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_autodma\mw_autodma.vhd
-- Created: 2020-12-24 09:17:20
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_autodma
-- Source Path: mw_autodma
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mw_autodma IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        AXI4_Stream_Slave_TDATA           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Stream_Slave_TVALID          :   IN    std_logic;  -- ufix1
        AXI4_Stream_Slave_TLAST           :   IN    std_logic;  -- ufix1
        AXI4_Stream_Slave_TUSER           :   IN    std_logic;  -- ufix1
        AXI4_Master_Rd_RDATA              :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Master_Rd_RLAST              :   IN    std_logic;  -- ufix1
        AXI4_Master_Rd_RVALID             :   IN    std_logic;  -- ufix1
        AXI4_Master_Rd_RID                :   IN    std_logic;  -- ufix1
        AXI4_Master_Rd_RRESP              :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Master_Rd_ARREADY            :   IN    std_logic;  -- ufix1
        AXI4_Master_Wr_AWREADY            :   IN    std_logic;  -- ufix1
        AXI4_Master_Wr_WREADY             :   IN    std_logic;  -- ufix1
        AXI4_Master_Wr_BID                :   IN    std_logic;  -- ufix1
        AXI4_Master_Wr_BRESP              :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Master_Wr_BVALID             :   IN    std_logic;  -- ufix1
        AXI4_Lite_ACLK                    :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARESETN                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_AWADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_AWVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_WDATA                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_WSTRB                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_Lite_WVALID                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_BREADY                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_ARVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_RREADY                  :   IN    std_logic;  -- ufix1
        AXI4_Stream_Slave_TREADY          :   OUT   std_logic;  -- ufix1
        AXI4_Master_Rd_ARID               :   OUT   std_logic;  -- ufix1
        AXI4_Master_Rd_ARADDR             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Master_Rd_ARLEN              :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        AXI4_Master_Rd_ARSIZE             :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
        AXI4_Master_Rd_ARBURST            :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Master_Rd_ARLOCK             :   OUT   std_logic;  -- ufix1
        AXI4_Master_Rd_ARCACHE            :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_Master_Rd_ARPROT             :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
        AXI4_Master_Rd_ARVALID            :   OUT   std_logic;  -- ufix1
        AXI4_Master_Rd_RREADY             :   OUT   std_logic;  -- ufix1
        AXI4_Master_Wr_AWID               :   OUT   std_logic;  -- ufix1
        AXI4_Master_Wr_AWADDR             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Master_Wr_AWLEN              :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        AXI4_Master_Wr_AWSIZE             :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
        AXI4_Master_Wr_AWBURST            :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Master_Wr_AWLOCK             :   OUT   std_logic;  -- ufix1
        AXI4_Master_Wr_AWCACHE            :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_Master_Wr_AWPROT             :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
        AXI4_Master_Wr_AWVALID            :   OUT   std_logic;  -- ufix1
        AXI4_Master_Wr_WDATA              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Master_Wr_WSTRB              :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_Master_Wr_WLAST              :   OUT   std_logic;  -- ufix1
        AXI4_Master_Wr_WVALID             :   OUT   std_logic;  -- ufix1
        AXI4_Master_Wr_BREADY             :   OUT   std_logic;  -- ufix1
        AXI4_Lite_AWREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_WREADY                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_BRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_BVALID                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_ARREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_RDATA                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_RRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_RVALID                  :   OUT   std_logic  -- ufix1
        );
END mw_autodma;


ARCHITECTURE rtl OF mw_autodma IS

  -- Component Declarations
  COMPONENT mw_autodma_axi4_master_wr
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          AXI4_Master_Wr_AWREADY          :   IN    std_logic;  -- ufix1
          AXI4_Master_Wr_WREADY           :   IN    std_logic;  -- ufix1
          AXI4_Master_Wr_BID              :   IN    std_logic;  -- ufix1
          AXI4_Master_Wr_BRESP            :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Master_Wr_BVALID           :   IN    std_logic;  -- ufix1
          user_data                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          user_wr_addr                    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          user_wr_len                     :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          user_wr_valid                   :   IN    std_logic;  -- ufix1
          write_AXI4_Master_Wr_base_address :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          soft_reset_pending              :   IN    std_logic;  -- ufix1
          AXI4_Master_Wr_AWID             :   OUT   std_logic;  -- ufix1
          AXI4_Master_Wr_AWADDR           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Master_Wr_AWLEN            :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          AXI4_Master_Wr_AWSIZE           :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          AXI4_Master_Wr_AWBURST          :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Master_Wr_AWLOCK           :   OUT   std_logic;  -- ufix1
          AXI4_Master_Wr_AWCACHE          :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_Master_Wr_AWPROT           :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          AXI4_Master_Wr_AWVALID          :   OUT   std_logic;  -- ufix1
          AXI4_Master_Wr_WDATA            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Master_Wr_WSTRB            :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_Master_Wr_WLAST            :   OUT   std_logic;  -- ufix1
          AXI4_Master_Wr_WVALID           :   OUT   std_logic;  -- ufix1
          AXI4_Master_Wr_BREADY           :   OUT   std_logic;  -- ufix1
          user_wr_ready                   :   OUT   std_logic;  -- ufix1
          user_wr_complete                :   OUT   std_logic;  -- ufix1
          in_burst_axi4_master_wr         :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT mw_autodma_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          Length                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Buffer_Address_1                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Buffer_Address_2                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Buffer_Address_3                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Enable                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Count                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          s_axis_tvalid                   :   IN    std_logic;  -- ufix1
          s_axis_tdata                    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          s_axis_tuser                    :   IN    std_logic;  -- ufix1
          s_axis_tlast                    :   IN    std_logic;  -- ufix1
          wr_s2m_wr_ready                 :   IN    std_logic;  -- ufix1
          wr_s2m_wr_complete              :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          Buffer_Pointer                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          DMA_Status                      :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
          wr_m2s_wr_addr                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          wr_m2s_wr_len                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          wr_m2s_wr_valid                 :   OUT   std_logic;  -- ufix1
          wr_data                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  COMPONENT mw_autodma_axi_lite
    PORT( reset                           :   IN    std_logic;
          AXI4_Lite_ACLK                  :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARESETN               :   IN    std_logic;  -- ufix1
          AXI4_Lite_AWADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_AWVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_WDATA                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_WSTRB                 :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_Lite_WVALID                :   IN    std_logic;  -- ufix1
          AXI4_Lite_BREADY                :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_ARVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_RREADY                :   IN    std_logic;  -- ufix1
          read_ip_timestamp               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_Buffer_Pointer             :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          read_DMA_Status                 :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          in_burst_axi4_master_wr         :   IN    std_logic;  -- ufix1
          AXI4_Lite_AWREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_WREADY                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_BRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_BVALID                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_ARREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_RDATA                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_RRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_RVALID                :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_AXI4_Master_Wr_base_address :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_Length                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_Buffer_Address_1          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_Buffer_Address_2          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_Buffer_Address_3          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_Enable                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_Count                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          soft_reset_pending              :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT mw_autodma_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT mw_autodma_axi4_stream_slave
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          AXI4_Stream_Slave_TDATA         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Stream_Slave_TVALID        :   IN    std_logic;  -- ufix1
          AXI4_Stream_Slave_TLAST         :   IN    std_logic;  -- ufix1
          AXI4_Stream_Slave_TUSER         :   IN    std_logic;  -- ufix1
          AXI4_Stream_Slave_TREADY        :   OUT   std_logic;  -- ufix1
          user_data                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          user_valid                      :   OUT   std_logic;  -- ufix1
          user_TLAST                      :   OUT   std_logic;  -- ufix1
          user_TUSER                      :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT mw_autodma_axi4_master_rd
    PORT( AXI4_Master_Rd_RDATA            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Master_Rd_RLAST            :   IN    std_logic;  -- ufix1
          AXI4_Master_Rd_RVALID           :   IN    std_logic;  -- ufix1
          AXI4_Master_Rd_RID              :   IN    std_logic;  -- ufix1
          AXI4_Master_Rd_RRESP            :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Master_Rd_ARREADY          :   IN    std_logic;  -- ufix1
          AXI4_Master_Rd_ARID             :   OUT   std_logic;  -- ufix1
          AXI4_Master_Rd_ARADDR           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Master_Rd_ARLEN            :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          AXI4_Master_Rd_ARSIZE           :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          AXI4_Master_Rd_ARBURST          :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Master_Rd_ARLOCK           :   OUT   std_logic;  -- ufix1
          AXI4_Master_Rd_ARCACHE          :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_Master_Rd_ARPROT           :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          AXI4_Master_Rd_ARVALID          :   OUT   std_logic;  -- ufix1
          AXI4_Master_Rd_RREADY           :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : mw_autodma_axi4_master_wr
    USE ENTITY work.mw_autodma_axi4_master_wr(rtl);

  FOR ALL : mw_autodma_dut
    USE ENTITY work.mw_autodma_dut(rtl);

  FOR ALL : mw_autodma_axi_lite
    USE ENTITY work.mw_autodma_axi_lite(rtl);

  FOR ALL : mw_autodma_reset_sync
    USE ENTITY work.mw_autodma_reset_sync(rtl);

  FOR ALL : mw_autodma_axi4_stream_slave
    USE ENTITY work.mw_autodma_axi4_stream_slave(rtl);

  FOR ALL : mw_autodma_axi4_master_rd
    USE ENTITY work.mw_autodma_axi4_master_rd(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL ip_timestamp                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL top_user_wr_complete             : std_logic;  -- ufix1
  SIGNAL wr_s2m_wr_complete_sig           : std_logic;  -- ufix1
  SIGNAL wr_m2s_wr_valid_sig              : std_logic;  -- ufix1
  SIGNAL top_user_wr_valid                : std_logic;  -- ufix1
  SIGNAL wr_data_sig                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL wr_m2s_wr_addr_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL wr_m2s_wr_len_sig                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_AXI4_Master_Wr_base_address : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL soft_reset_pending               : std_logic;  -- ufix1
  SIGNAL AXI4_Master_Wr_AWADDR_tmp        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Master_Wr_AWLEN_tmp         : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL AXI4_Master_Wr_AWSIZE_tmp        : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL AXI4_Master_Wr_AWBURST_tmp       : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Master_Wr_AWCACHE_tmp       : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL AXI4_Master_Wr_AWPROT_tmp        : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL AXI4_Master_Wr_WDATA_tmp         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Master_Wr_WSTRB_tmp         : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL top_user_wr_ready                : std_logic;  -- ufix1
  SIGNAL in_burst_axi4_master_wr          : std_logic;  -- ufix1
  SIGNAL wr_s2m_wr_ready_sig              : std_logic;  -- ufix1
  SIGNAL write_axi_enable                 : std_logic;  -- ufix1
  SIGNAL write_Length                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_Buffer_Address_1           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_Buffer_Address_2           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_Buffer_Address_3           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_Enable                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_Count                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL top_user_valid                   : std_logic;  -- ufix1
  SIGNAL top_user_data                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL top_user_TUSER                   : std_logic;  -- ufix1
  SIGNAL top_user_TLAST                   : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL Buffer_Pointer_sig               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL DMA_Status_sig                   : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL AXI4_Lite_BRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_RDATA_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_RRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL reset_before_sync                : std_logic;  -- ufix1
  SIGNAL AXI4_Master_Rd_ARADDR_tmp        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Master_Rd_ARLEN_tmp         : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL AXI4_Master_Rd_ARSIZE_tmp        : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL AXI4_Master_Rd_ARBURST_tmp       : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Master_Rd_ARCACHE_tmp       : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL AXI4_Master_Rd_ARPROT_tmp        : std_logic_vector(2 DOWNTO 0);  -- ufix3

BEGIN
  u_mw_autodma_axi4_master_wr_inst : mw_autodma_axi4_master_wr
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              AXI4_Master_Wr_AWREADY => AXI4_Master_Wr_AWREADY,  -- ufix1
              AXI4_Master_Wr_WREADY => AXI4_Master_Wr_WREADY,  -- ufix1
              AXI4_Master_Wr_BID => AXI4_Master_Wr_BID,  -- ufix1
              AXI4_Master_Wr_BRESP => AXI4_Master_Wr_BRESP,  -- ufix2
              AXI4_Master_Wr_BVALID => AXI4_Master_Wr_BVALID,  -- ufix1
              user_data => wr_data_sig,  -- ufix32
              user_wr_addr => wr_m2s_wr_addr_sig,  -- ufix32
              user_wr_len => wr_m2s_wr_len_sig,  -- ufix32
              user_wr_valid => top_user_wr_valid,  -- ufix1
              write_AXI4_Master_Wr_base_address => write_AXI4_Master_Wr_base_address,  -- ufix32
              soft_reset_pending => soft_reset_pending,  -- ufix1
              AXI4_Master_Wr_AWID => AXI4_Master_Wr_AWID,  -- ufix1
              AXI4_Master_Wr_AWADDR => AXI4_Master_Wr_AWADDR_tmp,  -- ufix32
              AXI4_Master_Wr_AWLEN => AXI4_Master_Wr_AWLEN_tmp,  -- ufix8
              AXI4_Master_Wr_AWSIZE => AXI4_Master_Wr_AWSIZE_tmp,  -- ufix3
              AXI4_Master_Wr_AWBURST => AXI4_Master_Wr_AWBURST_tmp,  -- ufix2
              AXI4_Master_Wr_AWLOCK => AXI4_Master_Wr_AWLOCK,  -- ufix1
              AXI4_Master_Wr_AWCACHE => AXI4_Master_Wr_AWCACHE_tmp,  -- ufix4
              AXI4_Master_Wr_AWPROT => AXI4_Master_Wr_AWPROT_tmp,  -- ufix3
              AXI4_Master_Wr_AWVALID => AXI4_Master_Wr_AWVALID,  -- ufix1
              AXI4_Master_Wr_WDATA => AXI4_Master_Wr_WDATA_tmp,  -- ufix32
              AXI4_Master_Wr_WSTRB => AXI4_Master_Wr_WSTRB_tmp,  -- ufix4
              AXI4_Master_Wr_WLAST => AXI4_Master_Wr_WLAST,  -- ufix1
              AXI4_Master_Wr_WVALID => AXI4_Master_Wr_WVALID,  -- ufix1
              AXI4_Master_Wr_BREADY => AXI4_Master_Wr_BREADY,  -- ufix1
              user_wr_ready => top_user_wr_ready,  -- ufix1
              user_wr_complete => top_user_wr_complete,  -- ufix1
              in_burst_axi4_master_wr => in_burst_axi4_master_wr  -- ufix1
              );

  u_mw_autodma_dut_inst : mw_autodma_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => write_axi_enable,  -- ufix1
              Length => write_Length,  -- ufix32
              Buffer_Address_1 => write_Buffer_Address_1,  -- ufix32
              Buffer_Address_2 => write_Buffer_Address_2,  -- ufix32
              Buffer_Address_3 => write_Buffer_Address_3,  -- ufix32
              Enable => write_Enable,  -- ufix32
              Count => write_Count,  -- ufix32
              s_axis_tvalid => top_user_valid,  -- ufix1
              s_axis_tdata => top_user_data,  -- ufix32
              s_axis_tuser => top_user_TUSER,  -- ufix1
              s_axis_tlast => top_user_TLAST,  -- ufix1
              wr_s2m_wr_ready => wr_s2m_wr_ready_sig,  -- ufix1
              wr_s2m_wr_complete => wr_s2m_wr_complete_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              Buffer_Pointer => Buffer_Pointer_sig,  -- ufix2
              DMA_Status => DMA_Status_sig,  -- ufix6
              wr_m2s_wr_addr => wr_m2s_wr_addr_sig,  -- ufix32
              wr_m2s_wr_len => wr_m2s_wr_len_sig,  -- ufix32
              wr_m2s_wr_valid => wr_m2s_wr_valid_sig,  -- ufix1
              wr_data => wr_data_sig  -- ufix32
              );

  u_mw_autodma_axi_lite_inst : mw_autodma_axi_lite
    PORT MAP( reset => reset,
              AXI4_Lite_ACLK => AXI4_Lite_ACLK,  -- ufix1
              AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,  -- ufix1
              AXI4_Lite_AWADDR => AXI4_Lite_AWADDR,  -- ufix16
              AXI4_Lite_AWVALID => AXI4_Lite_AWVALID,  -- ufix1
              AXI4_Lite_WDATA => AXI4_Lite_WDATA,  -- ufix32
              AXI4_Lite_WSTRB => AXI4_Lite_WSTRB,  -- ufix4
              AXI4_Lite_WVALID => AXI4_Lite_WVALID,  -- ufix1
              AXI4_Lite_BREADY => AXI4_Lite_BREADY,  -- ufix1
              AXI4_Lite_ARADDR => AXI4_Lite_ARADDR,  -- ufix16
              AXI4_Lite_ARVALID => AXI4_Lite_ARVALID,  -- ufix1
              AXI4_Lite_RREADY => AXI4_Lite_RREADY,  -- ufix1
              read_ip_timestamp => std_logic_vector(ip_timestamp),  -- ufix32
              read_Buffer_Pointer => Buffer_Pointer_sig,  -- ufix2
              read_DMA_Status => DMA_Status_sig,  -- ufix6
              in_burst_axi4_master_wr => in_burst_axi4_master_wr,  -- ufix1
              AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,  -- ufix1
              AXI4_Lite_WREADY => AXI4_Lite_WREADY,  -- ufix1
              AXI4_Lite_BRESP => AXI4_Lite_BRESP_tmp,  -- ufix2
              AXI4_Lite_BVALID => AXI4_Lite_BVALID,  -- ufix1
              AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,  -- ufix1
              AXI4_Lite_RDATA => AXI4_Lite_RDATA_tmp,  -- ufix32
              AXI4_Lite_RRESP => AXI4_Lite_RRESP_tmp,  -- ufix2
              AXI4_Lite_RVALID => AXI4_Lite_RVALID,  -- ufix1
              write_axi_enable => write_axi_enable,  -- ufix1
              write_AXI4_Master_Wr_base_address => write_AXI4_Master_Wr_base_address,  -- ufix32
              write_Length => write_Length,  -- ufix32
              write_Buffer_Address_1 => write_Buffer_Address_1,  -- ufix32
              write_Buffer_Address_2 => write_Buffer_Address_2,  -- ufix32
              write_Buffer_Address_3 => write_Buffer_Address_3,  -- ufix32
              write_Enable => write_Enable,  -- ufix32
              write_Count => write_Count,  -- ufix32
              soft_reset_pending => soft_reset_pending,  -- ufix1
              reset_internal => reset_internal  -- ufix1
              );

  u_mw_autodma_reset_sync_inst : mw_autodma_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_before_sync,  -- ufix1
              reset_out => reset
              );

  u_mw_autodma_axi4_stream_slave_inst : mw_autodma_axi4_stream_slave
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              enb => const_1,
              AXI4_Stream_Slave_TDATA => AXI4_Stream_Slave_TDATA,  -- ufix32
              AXI4_Stream_Slave_TVALID => AXI4_Stream_Slave_TVALID,  -- ufix1
              AXI4_Stream_Slave_TLAST => AXI4_Stream_Slave_TLAST,  -- ufix1
              AXI4_Stream_Slave_TUSER => AXI4_Stream_Slave_TUSER,  -- ufix1
              AXI4_Stream_Slave_TREADY => AXI4_Stream_Slave_TREADY,  -- ufix1
              user_data => top_user_data,  -- ufix32
              user_valid => top_user_valid,  -- ufix1
              user_TLAST => top_user_TLAST,  -- ufix1
              user_TUSER => top_user_TUSER  -- ufix1
              );

  u_mw_autodma_axi4_master_rd_inst : mw_autodma_axi4_master_rd
    PORT MAP( AXI4_Master_Rd_RDATA => AXI4_Master_Rd_RDATA,  -- ufix32
              AXI4_Master_Rd_RLAST => AXI4_Master_Rd_RLAST,  -- ufix1
              AXI4_Master_Rd_RVALID => AXI4_Master_Rd_RVALID,  -- ufix1
              AXI4_Master_Rd_RID => AXI4_Master_Rd_RID,  -- ufix1
              AXI4_Master_Rd_RRESP => AXI4_Master_Rd_RRESP,  -- ufix2
              AXI4_Master_Rd_ARREADY => AXI4_Master_Rd_ARREADY,  -- ufix1
              AXI4_Master_Rd_ARID => AXI4_Master_Rd_ARID,  -- ufix1
              AXI4_Master_Rd_ARADDR => AXI4_Master_Rd_ARADDR_tmp,  -- ufix32
              AXI4_Master_Rd_ARLEN => AXI4_Master_Rd_ARLEN_tmp,  -- ufix8
              AXI4_Master_Rd_ARSIZE => AXI4_Master_Rd_ARSIZE_tmp,  -- ufix3
              AXI4_Master_Rd_ARBURST => AXI4_Master_Rd_ARBURST_tmp,  -- ufix2
              AXI4_Master_Rd_ARLOCK => AXI4_Master_Rd_ARLOCK,  -- ufix1
              AXI4_Master_Rd_ARCACHE => AXI4_Master_Rd_ARCACHE_tmp,  -- ufix4
              AXI4_Master_Rd_ARPROT => AXI4_Master_Rd_ARPROT_tmp,  -- ufix3
              AXI4_Master_Rd_ARVALID => AXI4_Master_Rd_ARVALID,  -- ufix1
              AXI4_Master_Rd_RREADY => AXI4_Master_Rd_RREADY  -- ufix1
              );

  const_1 <= '1';

  reset_cm <=  NOT IPCORE_RESETN;

  ip_timestamp <= to_unsigned(2012240917, 32);

  wr_s2m_wr_complete_sig <= top_user_wr_complete;

  top_user_wr_valid <= wr_m2s_wr_valid_sig;

  wr_s2m_wr_ready_sig <= top_user_wr_ready;

  reset_before_sync <= reset_cm OR reset_internal;

  AXI4_Master_Rd_ARADDR <= AXI4_Master_Rd_ARADDR_tmp;

  AXI4_Master_Rd_ARLEN <= AXI4_Master_Rd_ARLEN_tmp;

  AXI4_Master_Rd_ARSIZE <= AXI4_Master_Rd_ARSIZE_tmp;

  AXI4_Master_Rd_ARBURST <= AXI4_Master_Rd_ARBURST_tmp;

  AXI4_Master_Rd_ARCACHE <= AXI4_Master_Rd_ARCACHE_tmp;

  AXI4_Master_Rd_ARPROT <= AXI4_Master_Rd_ARPROT_tmp;

  AXI4_Master_Wr_AWADDR <= AXI4_Master_Wr_AWADDR_tmp;

  AXI4_Master_Wr_AWLEN <= AXI4_Master_Wr_AWLEN_tmp;

  AXI4_Master_Wr_AWSIZE <= AXI4_Master_Wr_AWSIZE_tmp;

  AXI4_Master_Wr_AWBURST <= AXI4_Master_Wr_AWBURST_tmp;

  AXI4_Master_Wr_AWCACHE <= AXI4_Master_Wr_AWCACHE_tmp;

  AXI4_Master_Wr_AWPROT <= AXI4_Master_Wr_AWPROT_tmp;

  AXI4_Master_Wr_WDATA <= AXI4_Master_Wr_WDATA_tmp;

  AXI4_Master_Wr_WSTRB <= AXI4_Master_Wr_WSTRB_tmp;

  AXI4_Lite_BRESP <= AXI4_Lite_BRESP_tmp;

  AXI4_Lite_RDATA <= AXI4_Lite_RDATA_tmp;

  AXI4_Lite_RRESP <= AXI4_Lite_RRESP_tmp;

END rtl;
