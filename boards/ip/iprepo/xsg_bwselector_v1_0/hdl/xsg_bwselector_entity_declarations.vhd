-------------------------------------------------------------------
-- System Generator version 2020.1 VHDL source file.
--
-- Copyright(C) 2020 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2020 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xlregister.vhd
--
--  Description   : VHDL description of an arbitrary wide register.
--                  Unlike the delay block, an initial value is
--                  specified and is considered valid at the start
--                  of simulation.  The register is only one word
--                  deep.
--
--  Mod. History  : Removed valid bit logic from wrapper.
--                : Changed VHDL to use a bit_vector generic for its
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity xsg_bwselector_xlregister is

   generic (d_width          : integer := 5;          -- Width of d input
            init_value       : bit_vector := b"00");  -- Binary init value string

   port (d   : in std_logic_vector (d_width-1 downto 0);
         rst : in std_logic_vector(0 downto 0) := "0";
         en  : in std_logic_vector(0 downto 0) := "1";
         ce  : in std_logic;
         clk : in std_logic;
         q   : out std_logic_vector (d_width-1 downto 0));

end xsg_bwselector_xlregister;

architecture behavior of xsg_bwselector_xlregister is

   component synth_reg_w_init
      generic (width      : integer;
               init_index : integer;
               init_value : bit_vector;
               latency    : integer);
      port (i   : in std_logic_vector(width-1 downto 0);
            ce  : in std_logic;
            clr : in std_logic;
            clk : in std_logic;
            o   : out std_logic_vector(width-1 downto 0));
   end component; -- end synth_reg_w_init

   -- synthesis translate_off
   signal real_d, real_q           : real;    -- For debugging info ports
   -- synthesis translate_on
   signal internal_clr             : std_logic;
   signal internal_ce              : std_logic;

begin

   internal_clr <= rst(0) and ce;
   internal_ce  <= en(0) and ce;

   -- Synthesizable behavioral model
   synth_reg_inst : synth_reg_w_init
      generic map (width      => d_width,
                   init_index => 2,
                   init_value => init_value,
                   latency    => 1)
      port map (i   => d,
                ce  => internal_ce,
                clr => internal_clr,
                clk => clk,
                o   => q);

end architecture behavior;


library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_861c8eb41f is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_861c8eb41f;
architecture behavior of sysgen_constant_861c8eb41f
is
begin
  op <= "1";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xlslice.vhd
--
--  Description   : VHDL description of a block that sets the output to a
--                  specified range of the input bits. The output is always
--                  set to an unsigned type with it's binary point at zero.
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity xsg_bwselector_xlslice is
    generic (
        new_msb      : integer := 9;           -- position of new msb
        new_lsb      : integer := 1;           -- position of new lsb
        x_width      : integer := 16;          -- Width of x input
        y_width      : integer := 8);          -- Width of y output
    port (
        x : in std_logic_vector (x_width-1 downto 0);
        y : out std_logic_vector (y_width-1 downto 0));
end xsg_bwselector_xlslice;

architecture behavior of xsg_bwselector_xlslice is
begin
    y <= x(new_msb downto new_lsb);
end  behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_439aa46949 is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_439aa46949;
architecture behavior of sysgen_reinterpret_439aa46949
is
  signal input_port_1_40: unsigned((16 - 1) downto 0);
  signal output_port_5_5_force: signed((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_b25c9b5505 is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_b25c9b5505;
architecture behavior of sysgen_constant_b25c9b5505
is
begin
  op <= "000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_3caec802ba is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((3 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_3caec802ba;
architecture behavior of sysgen_relational_3caec802ba
is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((3 - 1) downto 0);
  signal cast_18_16: unsigned((32 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_18_16 <= u2u_cast(b_1_34, 0, 32, 0);
  result_18_3_rel <= a_1_31 > cast_18_16;
  op <= boolean_to_vector(result_18_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_abffce7db1 is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_abffce7db1;
architecture behavior of sysgen_constant_abffce7db1
is
begin
  op <= "111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_824b1345db is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((3 - 1) downto 0);
    d1 : in std_logic_vector((3 - 1) downto 0);
    y : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_824b1345db;
architecture behavior of sysgen_mux_824b1345db
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((3 - 1) downto 0);
  signal d1_1_27: std_logic_vector((3 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((3 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

--$Header: /devl/xcs/repo/env/Jobs/sysgen/src/xbs/blocks/xlconvert/hdl/xlconvert.vhd,v 1.1 2004/11/22 00:17:30 rosty Exp $
---------------------------------------------------------------------
--
--  Filename      : xlconvert.vhd
--
--  Description   : VHDL description of a fixed point converter block that
--                  converts the input to a new output type.

--
---------------------------------------------------------------------


---------------------------------------------------------------------
--
--  Entity        : xlconvert
--
--  Architecture  : behavior
--
--  Description   : Top level VHDL description of fixed point conver block.
--
---------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity convert_func_call_xsg_bwselector_xlconvert is
    generic (
        din_width    : integer := 16;            -- Width of input
        din_bin_pt   : integer := 4;             -- Binary point of input
        din_arith    : integer := xlUnsigned;    -- Type of arith of input
        dout_width   : integer := 8;             -- Width of output
        dout_bin_pt  : integer := 2;             -- Binary point of output
        dout_arith   : integer := xlUnsigned;    -- Type of arith of output
        quantization : integer := xlTruncate;    -- xlRound or xlTruncate
        overflow     : integer := xlWrap);       -- xlSaturate or xlWrap
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        result : out std_logic_vector (dout_width-1 downto 0));
end convert_func_call_xsg_bwselector_xlconvert ;

architecture behavior of convert_func_call_xsg_bwselector_xlconvert is
begin
    -- Convert to output type and do saturation arith.
    result <= convert_type(din, din_width, din_bin_pt, din_arith,
                           dout_width, dout_bin_pt, dout_arith,
                           quantization, overflow);
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity xsg_bwselector_xlconvert  is
    generic (
        din_width    : integer := 16;            -- Width of input
        din_bin_pt   : integer := 4;             -- Binary point of input
        din_arith    : integer := xlUnsigned;    -- Type of arith of input
        dout_width   : integer := 8;             -- Width of output
        dout_bin_pt  : integer := 2;             -- Binary point of output
        dout_arith   : integer := xlUnsigned;    -- Type of arith of output
        en_width     : integer := 1;
        en_bin_pt    : integer := 0;
        en_arith     : integer := xlUnsigned;
        bool_conversion : integer :=0;           -- if one, convert ufix_1_0 to
                                                 -- bool
        latency      : integer := 0;             -- Ouput delay clk cycles
        quantization : integer := xlTruncate;    -- xlRound or xlTruncate
        overflow     : integer := xlWrap);       -- xlSaturate or xlWrap
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        en  : in std_logic_vector (en_width-1 downto 0);
        ce  : in std_logic;
        clr : in std_logic;
        clk : in std_logic;
        dout : out std_logic_vector (dout_width-1 downto 0));

end xsg_bwselector_xlconvert ;

architecture behavior of xsg_bwselector_xlconvert  is

    component synth_reg
        generic (width       : integer;
                 latency     : integer);
        port (i       : in std_logic_vector(width-1 downto 0);
              ce      : in std_logic;
              clr     : in std_logic;
              clk     : in std_logic;
              o       : out std_logic_vector(width-1 downto 0));
    end component;

    component convert_func_call_xsg_bwselector_xlconvert 
        generic (
            din_width    : integer := 16;            -- Width of input
            din_bin_pt   : integer := 4;             -- Binary point of input
            din_arith    : integer := xlUnsigned;    -- Type of arith of input
            dout_width   : integer := 8;             -- Width of output
            dout_bin_pt  : integer := 2;             -- Binary point of output
            dout_arith   : integer := xlUnsigned;    -- Type of arith of output
            quantization : integer := xlTruncate;    -- xlRound or xlTruncate
            overflow     : integer := xlWrap);       -- xlSaturate or xlWrap
        port (
            din : in std_logic_vector (din_width-1 downto 0);
            result : out std_logic_vector (dout_width-1 downto 0));
    end component;


    -- synthesis translate_off
--    signal real_din, real_dout : real;    -- For debugging info ports
    -- synthesis translate_on
    signal result : std_logic_vector(dout_width-1 downto 0);
    signal internal_ce : std_logic;

begin

    -- Debugging info for internal full precision variables
    -- synthesis translate_off
--     real_din <= to_real(din, din_bin_pt, din_arith);
--     real_dout <= to_real(dout, dout_bin_pt, dout_arith);
    -- synthesis translate_on

    internal_ce <= ce and en(0);

    bool_conversion_generate : if (bool_conversion = 1)
    generate
      result <= din;
    end generate; --bool_conversion_generate

    std_conversion_generate : if (bool_conversion = 0)
    generate
      -- Workaround for XST bug
      convert : convert_func_call_xsg_bwselector_xlconvert 
        generic map (
          din_width   => din_width,
          din_bin_pt  => din_bin_pt,
          din_arith   => din_arith,
          dout_width  => dout_width,
          dout_bin_pt => dout_bin_pt,
          dout_arith  => dout_arith,
          quantization => quantization,
          overflow     => overflow)
        port map (
          din => din,
          result => result);
    end generate; --std_conversion_generate

    latency_test : if (latency > 0) generate
        reg : synth_reg
            generic map (
              width => dout_width,
              latency => latency
            )
            port map (
              i => result,
              ce => internal_ce,
              clr => clr,
              clk => clk,
              o => dout
            );
    end generate;

    latency0 : if (latency = 0)
    generate
        dout <= result;
    end generate latency0;

end  behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_3f7a2a62b5 is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_3f7a2a62b5;
architecture behavior of sysgen_reinterpret_3f7a2a62b5
is
  signal input_port_1_40: signed((16 - 1) downto 0);
  signal output_port_5_5_force: unsigned((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_6e01873e37 is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    in2 : in std_logic_vector((16 - 1) downto 0);
    in3 : in std_logic_vector((16 - 1) downto 0);
    in4 : in std_logic_vector((16 - 1) downto 0);
    in5 : in std_logic_vector((16 - 1) downto 0);
    in6 : in std_logic_vector((16 - 1) downto 0);
    in7 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((128 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_6e01873e37;
architecture behavior of sysgen_concat_6e01873e37
is
  signal in0_1_23: unsigned((16 - 1) downto 0);
  signal in1_1_27: unsigned((16 - 1) downto 0);
  signal in2_1_31: unsigned((16 - 1) downto 0);
  signal in3_1_35: unsigned((16 - 1) downto 0);
  signal in4_1_39: unsigned((16 - 1) downto 0);
  signal in5_1_43: unsigned((16 - 1) downto 0);
  signal in6_1_47: unsigned((16 - 1) downto 0);
  signal in7_1_51: unsigned((16 - 1) downto 0);
  signal y_2_1_concat: unsigned((128 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= std_logic_vector_to_unsigned(in4);
  in5_1_43 <= std_logic_vector_to_unsigned(in5);
  in6_1_47 <= std_logic_vector_to_unsigned(in6);
  in7_1_51 <= std_logic_vector_to_unsigned(in7);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & unsigned_to_std_logic_vector(in4_1_39) & unsigned_to_std_logic_vector(in5_1_43) & unsigned_to_std_logic_vector(in6_1_47) & unsigned_to_std_logic_vector(in7_1_51));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_5f04d3dc0f is
  port (
    in0 : in std_logic_vector((64 - 1) downto 0);
    in1 : in std_logic_vector((64 - 1) downto 0);
    y : out std_logic_vector((128 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_5f04d3dc0f;
architecture behavior of sysgen_concat_5f04d3dc0f
is
  signal in0_1_23: unsigned((64 - 1) downto 0);
  signal in1_1_27: unsigned((64 - 1) downto 0);
  signal y_2_1_concat: unsigned((128 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_9f319455c1 is
  port (
    op : out std_logic_vector((64 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_9f319455c1;
architecture behavior of sysgen_constant_9f319455c1
is
begin
  op <= "0000000000000000000000000000000000000000000000000000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_471aabf868 is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    in2 : in std_logic_vector((16 - 1) downto 0);
    in3 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((64 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_471aabf868;
architecture behavior of sysgen_concat_471aabf868
is
  signal in0_1_23: unsigned((16 - 1) downto 0);
  signal in1_1_27: unsigned((16 - 1) downto 0);
  signal in2_1_31: unsigned((16 - 1) downto 0);
  signal in3_1_35: unsigned((16 - 1) downto 0);
  signal y_2_1_concat: unsigned((64 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_b51ed76204 is
  port (
    in0 : in std_logic_vector((96 - 1) downto 0);
    in1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((128 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_b51ed76204;
architecture behavior of sysgen_concat_b51ed76204
is
  signal in0_1_23: unsigned((96 - 1) downto 0);
  signal in1_1_27: unsigned((32 - 1) downto 0);
  signal y_2_1_concat: unsigned((128 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_d468de54d8 is
  port (
    op : out std_logic_vector((96 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_d468de54d8;
architecture behavior of sysgen_constant_d468de54d8
is
begin
  op <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_154c3345c3 is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_154c3345c3;
architecture behavior of sysgen_concat_154c3345c3
is
  signal in0_1_23: unsigned((16 - 1) downto 0);
  signal in1_1_27: unsigned((16 - 1) downto 0);
  signal y_2_1_concat: unsigned((32 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_6973bfb62e is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((128 - 1) downto 0);
    d1 : in std_logic_vector((128 - 1) downto 0);
    d2 : in std_logic_vector((128 - 1) downto 0);
    d3 : in std_logic_vector((128 - 1) downto 0);
    y : out std_logic_vector((128 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_6973bfb62e;
architecture behavior of sysgen_mux_6973bfb62e
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((128 - 1) downto 0);
  signal d1_1_27: std_logic_vector((128 - 1) downto 0);
  signal d2_1_30: std_logic_vector((128 - 1) downto 0);
  signal d3_1_33: std_logic_vector((128 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((128 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
  signal pipe_20_22_front_din: std_logic_vector((128 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((128 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((128 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_769ff47f4a is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    d3 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_769ff47f4a;
architecture behavior of sysgen_mux_769ff47f4a
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  signal d3_1_33: std_logic;
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic;
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => '0');
  signal pipe_20_22_front_din: std_logic;
  signal pipe_20_22_back: std_logic;
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  d3_1_33 <= d3(0);
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(pipe_20_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_cbd80afd9a is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_cbd80afd9a;
architecture behavior of sysgen_logical_cbd80afd9a
is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal d2_1_30: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  fully_2_1_bit <= d0_1_24 or d1_1_27 or d2_1_30;
  y <= fully_2_1_bit;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_e7b2cf931e is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_e7b2cf931e;
architecture behavior of sysgen_logical_e7b2cf931e
is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= fully_2_1_bit;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_5cfc090c81 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_5cfc090c81;
architecture behavior of sysgen_mux_5cfc090c81
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_94065815e7 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_94065815e7;
architecture behavior of sysgen_mux_94065815e7
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= std_logic_to_vector(unregy_join_6_1);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_b05fc24dc2 is
  port (
    in0 : in std_logic_vector((112 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((128 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_b05fc24dc2;
architecture behavior of sysgen_concat_b05fc24dc2
is
  signal in0_1_23: unsigned((112 - 1) downto 0);
  signal in1_1_27: unsigned((16 - 1) downto 0);
  signal y_2_1_concat: unsigned((128 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_1ff53682d3 is
  port (
    op : out std_logic_vector((112 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_1ff53682d3;
architecture behavior of sysgen_constant_1ff53682d3
is
begin
  op <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_1a4ba3d9a5 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_1a4ba3d9a5;
architecture behavior of sysgen_mux_1a4ba3d9a5
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic;
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => '0');
  signal pipe_16_22_front_din: std_logic;
  signal pipe_16_22_back: std_logic;
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(pipe_16_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_e03597c965 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((128 - 1) downto 0);
    d1 : in std_logic_vector((128 - 1) downto 0);
    y : out std_logic_vector((128 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_e03597c965;
architecture behavior of sysgen_mux_e03597c965
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((128 - 1) downto 0);
  signal d1_1_27: std_logic_vector((128 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((128 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((128 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((128 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((128 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= pipe_16_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity xsg_bwselector_axi_lite_interface is 
    port(
        s_axi_decimation : out std_logic_vector(31 downto 0);
        clk : out std_logic;
        xsg_bwselector_aclk : in std_logic;
        xsg_bwselector_aresetn : in std_logic;
        xsg_bwselector_s_axi_awaddr : in std_logic;
        xsg_bwselector_s_axi_awvalid : in std_logic;
        xsg_bwselector_s_axi_awready : out std_logic;
        xsg_bwselector_s_axi_wdata : in std_logic_vector(32-1 downto 0);
        xsg_bwselector_s_axi_wstrb : in std_logic_vector(32/8-1 downto 0);
        xsg_bwselector_s_axi_wvalid : in std_logic;
        xsg_bwselector_s_axi_wready : out std_logic;
        xsg_bwselector_s_axi_bresp : out std_logic_vector(1 downto 0);
        xsg_bwselector_s_axi_bvalid : out std_logic;
        xsg_bwselector_s_axi_bready : in std_logic;
        xsg_bwselector_s_axi_araddr : in std_logic;
        xsg_bwselector_s_axi_arvalid : in std_logic;
        xsg_bwselector_s_axi_arready : out std_logic;
        xsg_bwselector_s_axi_rdata : out std_logic_vector(32-1 downto 0);
        xsg_bwselector_s_axi_rresp : out std_logic_vector(1 downto 0);
        xsg_bwselector_s_axi_rvalid : out std_logic;
        xsg_bwselector_s_axi_rready : in std_logic
    );
end xsg_bwselector_axi_lite_interface;
architecture structural of xsg_bwselector_axi_lite_interface is 
component xsg_bwselector_axi_lite_interface_verilog is
    port(
        s_axi_decimation : out std_logic_vector(31 downto 0);
        clk : out std_logic;
        xsg_bwselector_aclk : in std_logic;
        xsg_bwselector_aresetn : in std_logic;
        xsg_bwselector_s_axi_awaddr : in std_logic;
        xsg_bwselector_s_axi_awvalid : in std_logic;
        xsg_bwselector_s_axi_awready : out std_logic;
        xsg_bwselector_s_axi_wdata : in std_logic_vector(32-1 downto 0);
        xsg_bwselector_s_axi_wstrb : in std_logic_vector(32/8-1 downto 0);
        xsg_bwselector_s_axi_wvalid : in std_logic;
        xsg_bwselector_s_axi_wready : out std_logic;
        xsg_bwselector_s_axi_bresp : out std_logic_vector(1 downto 0);
        xsg_bwselector_s_axi_bvalid : out std_logic;
        xsg_bwselector_s_axi_bready : in std_logic;
        xsg_bwselector_s_axi_araddr : in std_logic;
        xsg_bwselector_s_axi_arvalid : in std_logic;
        xsg_bwselector_s_axi_arready : out std_logic;
        xsg_bwselector_s_axi_rdata : out std_logic_vector(32-1 downto 0);
        xsg_bwselector_s_axi_rresp : out std_logic_vector(1 downto 0);
        xsg_bwselector_s_axi_rvalid : out std_logic;
        xsg_bwselector_s_axi_rready : in std_logic
    );
end component;
begin
inst : xsg_bwselector_axi_lite_interface_verilog
    port map(
    s_axi_decimation => s_axi_decimation,
    clk => clk,
    xsg_bwselector_aclk => xsg_bwselector_aclk,
    xsg_bwselector_aresetn => xsg_bwselector_aresetn,
    xsg_bwselector_s_axi_awaddr => xsg_bwselector_s_axi_awaddr,
    xsg_bwselector_s_axi_awvalid => xsg_bwselector_s_axi_awvalid,
    xsg_bwselector_s_axi_awready => xsg_bwselector_s_axi_awready,
    xsg_bwselector_s_axi_wdata => xsg_bwselector_s_axi_wdata,
    xsg_bwselector_s_axi_wstrb => xsg_bwselector_s_axi_wstrb,
    xsg_bwselector_s_axi_wvalid => xsg_bwselector_s_axi_wvalid,
    xsg_bwselector_s_axi_wready => xsg_bwselector_s_axi_wready,
    xsg_bwselector_s_axi_bresp => xsg_bwselector_s_axi_bresp,
    xsg_bwselector_s_axi_bvalid => xsg_bwselector_s_axi_bvalid,
    xsg_bwselector_s_axi_bready => xsg_bwselector_s_axi_bready,
    xsg_bwselector_s_axi_araddr => xsg_bwselector_s_axi_araddr,
    xsg_bwselector_s_axi_arvalid => xsg_bwselector_s_axi_arvalid,
    xsg_bwselector_s_axi_arready => xsg_bwselector_s_axi_arready,
    xsg_bwselector_s_axi_rdata => xsg_bwselector_s_axi_rdata,
    xsg_bwselector_s_axi_rresp => xsg_bwselector_s_axi_rresp,
    xsg_bwselector_s_axi_rvalid => xsg_bwselector_s_axi_rvalid,
    xsg_bwselector_s_axi_rready => xsg_bwselector_s_axi_rready
);
end structural;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_77585be71a3fcdcbdad3183d582a337c is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_data_tdata_vect0:out std_logic_vector(31 downto 0);
    m_axis_data_tdata_vect1:out std_logic_vector(31 downto 0);
    m_axis_data_tdata_vect2:out std_logic_vector(31 downto 0);
    m_axis_data_tdata_vect3:out std_logic_vector(31 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_vect0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect1:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect2:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect3:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect4:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect5:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect6:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect7:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tvalid:in std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_77585be71a3fcdcbdad3183d582a337c; 

architecture behavior of xlfir_compiler_77585be71a3fcdcbdad3183d582a337c  is
  component xsg_bwselector_fir_compiler_v7_2_i0
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(127 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(127 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(127 downto 0) := (others=>'0');
signal s_axis_data_tdata_net: std_logic_vector(127 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_vect3 <= m_axis_data_tdata_net(127 downto 96);
  m_axis_data_tdata_vect2 <= m_axis_data_tdata_net(95 downto 64);
  m_axis_data_tdata_vect1 <= m_axis_data_tdata_net(63 downto 32);
  m_axis_data_tdata_vect0 <= m_axis_data_tdata_net(31 downto 0);
  s_axis_data_tdata_net(127 downto 112) <= s_axis_data_tdata_vect7;
  s_axis_data_tdata_net(111 downto 96) <= s_axis_data_tdata_vect6;
  s_axis_data_tdata_net(95 downto 80) <= s_axis_data_tdata_vect5;
  s_axis_data_tdata_net(79 downto 64) <= s_axis_data_tdata_vect4;
  s_axis_data_tdata_net(63 downto 48) <= s_axis_data_tdata_vect3;
  s_axis_data_tdata_net(47 downto 32) <= s_axis_data_tdata_vect2;
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_vect1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_vect0;
  xsg_bwselector_fir_compiler_v7_2_i0_instance : xsg_bwselector_fir_compiler_v7_2_i0
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>s_axis_data_tvalid
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_b2a36ee9c093246bbf53aedb97dcea8e is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_data_tdata_vect0:out std_logic_vector(31 downto 0);
    m_axis_data_tdata_vect1:out std_logic_vector(31 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_vect0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect1:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect2:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect3:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tvalid:in std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_b2a36ee9c093246bbf53aedb97dcea8e; 

architecture behavior of xlfir_compiler_b2a36ee9c093246bbf53aedb97dcea8e  is
  component xsg_bwselector_fir_compiler_v7_2_i1
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(63 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>'0');
signal s_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_vect1 <= m_axis_data_tdata_net(63 downto 32);
  m_axis_data_tdata_vect0 <= m_axis_data_tdata_net(31 downto 0);
  s_axis_data_tdata_net(63 downto 48) <= s_axis_data_tdata_vect3;
  s_axis_data_tdata_net(47 downto 32) <= s_axis_data_tdata_vect2;
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_vect1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_vect0;
  xsg_bwselector_fir_compiler_v7_2_i1_instance : xsg_bwselector_fir_compiler_v7_2_i1
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>s_axis_data_tvalid
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_af3721e210868ca8451d0c9d4ed84b4a is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_data_tdata_real:out std_logic_vector(31 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_vect0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect1:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tvalid:in std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_af3721e210868ca8451d0c9d4ed84b4a; 

architecture behavior of xlfir_compiler_af3721e210868ca8451d0c9d4ed84b4a  is
  component xsg_bwselector_fir_compiler_v7_2_i2
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(31 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_real <= m_axis_data_tdata_net(31 downto 0);
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_vect1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_vect0;
  xsg_bwselector_fir_compiler_v7_2_i2_instance : xsg_bwselector_fir_compiler_v7_2_i2
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>s_axis_data_tvalid
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_cc68edf79396dfed251a29648fc69207 is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_data_tdata_path0:out std_logic_vector(31 downto 0);
    m_axis_data_tdata_path1:out std_logic_vector(31 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_path0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_path1:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tvalid:in std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_cc68edf79396dfed251a29648fc69207; 

architecture behavior of xlfir_compiler_cc68edf79396dfed251a29648fc69207  is
  component xsg_bwselector_fir_compiler_v7_2_i3
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>'0');
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_path1 <= m_axis_data_tdata_net(63 downto 32);
  m_axis_data_tdata_path0 <= m_axis_data_tdata_net(31 downto 0);
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_path1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_path0;
  xsg_bwselector_fir_compiler_v7_2_i3_instance : xsg_bwselector_fir_compiler_v7_2_i3
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>s_axis_data_tvalid
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_7edb5ddbd2a4bf3484a7009e3fd7b76a is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_data_tdata_path0:out std_logic_vector(31 downto 0);
    m_axis_data_tdata_path1:out std_logic_vector(31 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_path0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_path1:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tvalid:in std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_7edb5ddbd2a4bf3484a7009e3fd7b76a; 

architecture behavior of xlfir_compiler_7edb5ddbd2a4bf3484a7009e3fd7b76a  is
  component xsg_bwselector_fir_compiler_v7_2_i4
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>'0');
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_path1 <= m_axis_data_tdata_net(63 downto 32);
  m_axis_data_tdata_path0 <= m_axis_data_tdata_net(31 downto 0);
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_path1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_path0;
  xsg_bwselector_fir_compiler_v7_2_i4_instance : xsg_bwselector_fir_compiler_v7_2_i4
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>s_axis_data_tvalid
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_1af804b5feb07c721f63eebe3fafbd1c is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_data_tdata_path0:out std_logic_vector(31 downto 0);
    m_axis_data_tdata_path1:out std_logic_vector(31 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_path0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_path1:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tvalid:in std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_1af804b5feb07c721f63eebe3fafbd1c; 

architecture behavior of xlfir_compiler_1af804b5feb07c721f63eebe3fafbd1c  is
  component xsg_bwselector_fir_compiler_v7_2_i5
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>'0');
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_path1 <= m_axis_data_tdata_net(63 downto 32);
  m_axis_data_tdata_path0 <= m_axis_data_tdata_net(31 downto 0);
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_path1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_path0;
  xsg_bwselector_fir_compiler_v7_2_i5_instance : xsg_bwselector_fir_compiler_v7_2_i5
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>s_axis_data_tvalid
    );
end behavior;



