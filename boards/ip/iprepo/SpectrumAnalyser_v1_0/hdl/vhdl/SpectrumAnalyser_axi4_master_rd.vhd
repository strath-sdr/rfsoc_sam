-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_axi4_master_rd.vhd
-- Created: 2020-12-24 11:44:01
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_axi4_master_rd
-- Source Path: SpectrumAnalyser/SpectrumAnalyser_axi4_master_rd
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_axi4_master_rd IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        AXI4_Master_Rd_RDATA              :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Master_Rd_RLAST              :   IN    std_logic;  -- ufix1
        AXI4_Master_Rd_RVALID             :   IN    std_logic;  -- ufix1
        AXI4_Master_Rd_RID                :   IN    std_logic;  -- ufix1
        AXI4_Master_Rd_RRESP              :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Master_Rd_ARREADY            :   IN    std_logic;  -- ufix1
        user_rd_addr                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        user_rd_len                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        user_rd_avalid                    :   IN    std_logic;  -- ufix1
        write_AXI4_Master_Rd_base_address :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        soft_reset_pending                :   IN    std_logic;  -- ufix1
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
        user_data                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        user_rd_aready                    :   OUT   std_logic;  -- ufix1
        user_rd_dvalid                    :   OUT   std_logic;  -- ufix1
        in_burst_axi4_master_rd           :   OUT   std_logic  -- ufix1
        );
END SpectrumAnalyser_axi4_master_rd;


ARCHITECTURE rtl OF SpectrumAnalyser_axi4_master_rd IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser_rd_addr_fifo
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          Empty                           :   OUT   std_logic;  -- ufix1
          AFull                           :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_rd_len_fifo
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_rdata_fifo
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          Empty                           :   OUT   std_logic;  -- ufix1
          Full                            :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser_rd_addr_fifo
    USE ENTITY work.SpectrumAnalyser_rd_addr_fifo(rtl);

  FOR ALL : SpectrumAnalyser_rd_len_fifo
    USE ENTITY work.SpectrumAnalyser_rd_len_fifo(rtl);

  FOR ALL : SpectrumAnalyser_rdata_fifo
    USE ENTITY work.SpectrumAnalyser_rdata_fifo(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL const_0_1                        : std_logic;  -- ufix1
  SIGNAL user_rd_len_unsigned             : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL const_len_dec                    : std_logic;  -- ufix1
  SIGNAL len_decrement_sub_cast           : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL len_decrement_sub_cast_1         : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL len_decrement_sub_cast_2         : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL len_decrement_sub_temp           : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL len_val                          : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL const_1_1                        : std_logic;  -- ufix1
  SIGNAL user_rd_addr_unsigned            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL write_AXI4_Master_Rd_base_address_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL full_addr                        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_fifo_addr                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_fifo_addr_unsigned            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_fifo_ack                      : std_logic;  -- ufix1
  SIGNAL rd_fifo_empty                    : std_logic;  -- ufix1
  SIGNAL rd_fifo_afull                    : std_logic;  -- ufix1
  SIGNAL rd_valid_internal                : std_logic;  -- ufix1
  SIGNAL rd_fifo_len                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL rd_fifo_len_unsigned             : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL axi4_master_rd_rd_state          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL axi4_master_rd_rd_len            : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL axi4_master_rd_rd_addr           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL axi4_master_rd_last_burst        : std_logic;
  SIGNAL axi4_master_rd_arvalid_reg       : std_logic;
  SIGNAL axi4_master_rd_araddr_reg        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL axi4_master_rd_arlen_reg         : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL axi4_master_rd_rd_state_next     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL axi4_master_rd_rd_len_next       : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL axi4_master_rd_rd_addr_next      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL axi4_master_rd_last_burst_next   : std_logic;
  SIGNAL axi4_master_rd_arvalid_reg_next  : std_logic;
  SIGNAL axi4_master_rd_araddr_reg_next   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL axi4_master_rd_arlen_reg_next    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL AXI4_Master_Rd_ARVALID_1         : std_logic;  -- ufix1
  SIGNAL AXI4_Master_Rd_ARADDR_tmp        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Master_Rd_ARLEN_tmp         : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL const_arsize                     : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL const_1_2                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL const_3_4                        : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL const_0_3                        : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL AXI4_Master_Rd_RDATA_unsigned    : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL out_fifo_data                    : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL user_data_tmp                    : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL rdata_fifo_empty                 : std_logic;  -- ufix1
  SIGNAL rdata_fifo_full                  : std_logic;  -- ufix1
  SIGNAL AXI4_Master_Rd_RREADY_1          : std_logic;  -- ufix1
  SIGNAL rdata_fifo_valid                 : std_logic;  -- ufix1
  SIGNAL rd_dvalid                        : std_logic;  -- ufix1
  SIGNAL ar_transfer                      : std_logic;  -- ufix1
  SIGNAL const_0_9                        : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL const_1_9                        : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL arlen_plusone                    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL ar_transfer_len                  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL r_transfer                       : std_logic;  -- ufix1
  SIGNAL r_transfer_len                   : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL accum_value                      : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL accum_arlen_adder_add_cast       : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL accum_ar_len                     : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL accum_rlen_adder_sub_cast        : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL accum_ar_len_1                   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL in_burst_axi4_master_rd_1        : std_logic;  -- ufix1

BEGIN
  u_SpectrumAnalyser_rd_addr_fifo_inst : SpectrumAnalyser_rd_addr_fifo
    PORT MAP( clk => clk,
              reset => reset,
              enb => const_1_1,
              In_rsvd => std_logic_vector(full_addr),  -- ufix32
              Push => user_rd_avalid,  -- ufix1
              Pop => rd_fifo_ack,  -- ufix1
              Out_rsvd => rd_fifo_addr,  -- ufix32
              Empty => rd_fifo_empty,  -- ufix1
              AFull => rd_fifo_afull  -- ufix1
              );

  u_SpectrumAnalyser_rd_len_fifo_inst : SpectrumAnalyser_rd_len_fifo
    PORT MAP( clk => clk,
              reset => reset,
              enb => const_1_1,
              In_rsvd => std_logic_vector(len_val),  -- ufix16
              Push => user_rd_avalid,  -- ufix1
              Pop => rd_fifo_ack,  -- ufix1
              Out_rsvd => rd_fifo_len  -- ufix16
              );

  u_SpectrumAnalyser_rdata_fifo_inst : SpectrumAnalyser_rdata_fifo
    PORT MAP( clk => clk,
              reset => reset,
              enb => const_1_1,
              In_rsvd => std_logic_vector(out_fifo_data),  -- ufix16
              Push => AXI4_Master_Rd_RVALID,  -- ufix1
              Pop => const_1_1,  -- ufix1
              Out_rsvd => user_data_tmp,  -- ufix16
              Empty => rdata_fifo_empty,  -- ufix1
              Full => rdata_fifo_full  -- ufix1
              );

  const_0_1 <= '0';

  AXI4_Master_Rd_ARID <= const_0_1;

  user_rd_len_unsigned <= unsigned(user_rd_len);

  const_len_dec <= '1';

  len_decrement_sub_cast <= signed(resize(user_rd_len_unsigned, 17));
  len_decrement_sub_cast_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & const_len_dec;
  len_decrement_sub_cast_2 <= signed(resize(len_decrement_sub_cast_1, 17));
  len_decrement_sub_temp <= len_decrement_sub_cast - len_decrement_sub_cast_2;
  
  len_val <= X"0000" WHEN len_decrement_sub_temp(16) = '1' ELSE
      unsigned(len_decrement_sub_temp(15 DOWNTO 0));

  const_1_1 <= '1';

  user_rd_addr_unsigned <= unsigned(user_rd_addr);

  write_AXI4_Master_Rd_base_address_unsigned <= unsigned(write_AXI4_Master_Rd_base_address);

  full_addr <= user_rd_addr_unsigned + write_AXI4_Master_Rd_base_address_unsigned;

  enb <= const_1_1;

  rd_fifo_addr_unsigned <= unsigned(rd_fifo_addr);

  rd_valid_internal <=  NOT rd_fifo_empty;

  rd_fifo_len_unsigned <= unsigned(rd_fifo_len);

  axi4_master_rd_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      axi4_master_rd_rd_state <= to_unsigned(16#00#, 8);
      axi4_master_rd_rd_len <= to_unsigned(16#0000#, 16);
      axi4_master_rd_rd_addr <= to_unsigned(0, 32);
      axi4_master_rd_arlen_reg <= to_unsigned(16#00#, 8);
      axi4_master_rd_arvalid_reg <= '0';
      axi4_master_rd_araddr_reg <= to_unsigned(0, 32);
      axi4_master_rd_last_burst <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        axi4_master_rd_rd_state <= axi4_master_rd_rd_state_next;
        axi4_master_rd_rd_len <= axi4_master_rd_rd_len_next;
        axi4_master_rd_rd_addr <= axi4_master_rd_rd_addr_next;
        axi4_master_rd_last_burst <= axi4_master_rd_last_burst_next;
        axi4_master_rd_arvalid_reg <= axi4_master_rd_arvalid_reg_next;
        axi4_master_rd_araddr_reg <= axi4_master_rd_araddr_reg_next;
        axi4_master_rd_arlen_reg <= axi4_master_rd_arlen_reg_next;
      END IF;
    END IF;
  END PROCESS axi4_master_rd_process;

  axi4_master_rd_output : PROCESS (AXI4_Master_Rd_ARREADY, axi4_master_rd_araddr_reg, axi4_master_rd_arlen_reg,
       axi4_master_rd_arvalid_reg, axi4_master_rd_last_burst,
       axi4_master_rd_rd_addr, axi4_master_rd_rd_len, axi4_master_rd_rd_state,
       rd_fifo_addr_unsigned, rd_fifo_len_unsigned, rd_valid_internal,
       soft_reset_pending)
  BEGIN
    axi4_master_rd_rd_state_next <= axi4_master_rd_rd_state;
    axi4_master_rd_rd_len_next <= axi4_master_rd_rd_len;
    axi4_master_rd_rd_addr_next <= axi4_master_rd_rd_addr;
    axi4_master_rd_last_burst_next <= axi4_master_rd_last_burst;
    axi4_master_rd_arvalid_reg_next <= axi4_master_rd_arvalid_reg;
    axi4_master_rd_araddr_reg_next <= axi4_master_rd_araddr_reg;
    axi4_master_rd_arlen_reg_next <= axi4_master_rd_arlen_reg;
    rd_fifo_ack <= '0';
    CASE axi4_master_rd_rd_state IS
      WHEN "00000000" =>
        rd_fifo_ack <= '1';
        IF (rd_valid_internal /= '0') AND ( NOT (soft_reset_pending /= '0')) THEN 
          axi4_master_rd_rd_state_next <= to_unsigned(16#01#, 8);
        END IF;
        axi4_master_rd_arvalid_reg_next <= '0';
        axi4_master_rd_last_burst_next <= '0';
        axi4_master_rd_rd_len_next <= rd_fifo_len_unsigned;
        axi4_master_rd_rd_addr_next <= rd_fifo_addr_unsigned;
      WHEN "00000001" =>
        IF (AXI4_Master_Rd_ARREADY AND axi4_master_rd_arvalid_reg) = '1' THEN 
          axi4_master_rd_arvalid_reg_next <= '0';
          IF axi4_master_rd_last_burst = '1' THEN 
            axi4_master_rd_rd_state_next <= to_unsigned(16#00#, 8);
          ELSE 
            axi4_master_rd_rd_state_next <= to_unsigned(16#02#, 8);
          END IF;
        ELSE 
          axi4_master_rd_arvalid_reg_next <= '1';
        END IF;
        axi4_master_rd_araddr_reg_next <= axi4_master_rd_rd_addr;
        IF axi4_master_rd_rd_len > to_unsigned(16#00FF#, 16) THEN 
          axi4_master_rd_arlen_reg_next <= to_unsigned(16#FF#, 8);
          axi4_master_rd_last_burst_next <= '0';
        ELSE 
          axi4_master_rd_arlen_reg_next <= axi4_master_rd_rd_len(7 DOWNTO 0);
          axi4_master_rd_last_burst_next <= '1';
        END IF;
      WHEN "00000010" =>
        axi4_master_rd_rd_len_next <= axi4_master_rd_rd_len - to_unsigned(16#0100#, 16);
        axi4_master_rd_rd_addr_next <= axi4_master_rd_rd_addr + to_unsigned(1024, 32);
        axi4_master_rd_rd_state_next <= to_unsigned(16#01#, 8);
      WHEN OTHERS => 
        axi4_master_rd_rd_state_next <= to_unsigned(16#00#, 8);
    END CASE;
    AXI4_Master_Rd_ARVALID_1 <= axi4_master_rd_arvalid_reg;
    AXI4_Master_Rd_ARADDR_tmp <= axi4_master_rd_araddr_reg;
    AXI4_Master_Rd_ARLEN_tmp <= axi4_master_rd_arlen_reg;
  END PROCESS axi4_master_rd_output;


  AXI4_Master_Rd_ARADDR <= std_logic_vector(AXI4_Master_Rd_ARADDR_tmp);

  AXI4_Master_Rd_ARLEN <= std_logic_vector(AXI4_Master_Rd_ARLEN_tmp);

  const_arsize <= to_unsigned(16#2#, 3);

  AXI4_Master_Rd_ARSIZE <= std_logic_vector(const_arsize);

  const_1_2 <= to_unsigned(16#1#, 2);

  AXI4_Master_Rd_ARBURST <= std_logic_vector(const_1_2);

  AXI4_Master_Rd_ARLOCK <= const_0_1;

  const_3_4 <= to_unsigned(16#3#, 4);

  AXI4_Master_Rd_ARCACHE <= std_logic_vector(const_3_4);

  const_0_3 <= to_unsigned(16#0#, 3);

  AXI4_Master_Rd_ARPROT <= std_logic_vector(const_0_3);

  AXI4_Master_Rd_RDATA_unsigned <= unsigned(AXI4_Master_Rd_RDATA);

  out_fifo_data <= AXI4_Master_Rd_RDATA_unsigned(15 DOWNTO 0);

  AXI4_Master_Rd_RREADY_1 <=  NOT rdata_fifo_full;

  user_rd_aready <=  NOT rd_fifo_afull;

  rdata_fifo_valid <=  NOT rdata_fifo_empty;

  rd_dvalid <= rdata_fifo_valid AND const_1_1;

  user_rd_dvalid <= rd_dvalid;

  ar_transfer <= AXI4_Master_Rd_ARREADY AND AXI4_Master_Rd_ARVALID_1;

  const_0_9 <= to_unsigned(16#000#, 9);

  const_1_9 <= to_unsigned(16#001#, 9);

  arlen_plusone <= resize(AXI4_Master_Rd_ARLEN_tmp, 9) + const_1_9;

  
  ar_transfer_len <= const_0_9 WHEN ar_transfer = '0' ELSE
      arlen_plusone;

  r_transfer <= AXI4_Master_Rd_RREADY_1 AND AXI4_Master_Rd_RVALID;

  
  r_transfer_len <= const_0_9 WHEN r_transfer = '0' ELSE
      const_1_9;

  accum_arlen_adder_add_cast <= signed(resize(ar_transfer_len, 32));
  accum_ar_len <= accum_arlen_adder_add_cast + accum_value;

  accum_rlen_adder_sub_cast <= signed(resize(r_transfer_len, 32));
  accum_ar_len_1 <= accum_ar_len - accum_rlen_adder_sub_cast;

  reg_accum_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      accum_value <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        accum_value <= accum_ar_len_1;
      END IF;
    END IF;
  END PROCESS reg_accum_process;


  
  in_burst_axi4_master_rd_1 <= '1' WHEN accum_value > to_signed(0, 32) ELSE
      '0';

  in_burst_axi4_master_rd <= in_burst_axi4_master_rd_1;

  AXI4_Master_Rd_ARVALID <= AXI4_Master_Rd_ARVALID_1;

  AXI4_Master_Rd_RREADY <= AXI4_Master_Rd_RREADY_1;

  user_data <= user_data_tmp;

END rtl;

