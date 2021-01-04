-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_TWDLROM_7_1_block1.vhd
-- Created: 2021-01-04 00:54:53
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_TWDLROM_7_1_block1
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 2048/TWDLROM_7_
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.SpectrumAnalyser_src_Spectrum_Analyser_pkg.ALL;

ENTITY SpectrumAnalyser_src_TWDLROM_7_1_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        dout_6_1_vld                      :   IN    std_logic;
        softReset                         :   IN    std_logic;
        twdl_7_1_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_7_1_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_7_1_vld                      :   OUT   std_logic
        );
END SpectrumAnalyser_src_TWDLROM_7_1_block1;


ARCHITECTURE rtl OF SpectrumAnalyser_src_TWDLROM_7_1_block1 IS

  -- Constants
  CONSTANT Twiddle_re_table_data          : vector_of_signed16(0 TO 255) := 
    (to_signed(16#4000#, 16), to_signed(16#4000#, 16), to_signed(16#4000#, 16), to_signed(16#3FFF#, 16),
     to_signed(16#3FFF#, 16), to_signed(16#3FFE#, 16), to_signed(16#3FFD#, 16), to_signed(16#3FFC#, 16),
     to_signed(16#3FFB#, 16), to_signed(16#3FFA#, 16), to_signed(16#3FF8#, 16), to_signed(16#3FF7#, 16),
     to_signed(16#3FF5#, 16), to_signed(16#3FF3#, 16), to_signed(16#3FF1#, 16), to_signed(16#3FEF#, 16),
     to_signed(16#3FEC#, 16), to_signed(16#3FEA#, 16), to_signed(16#3FE7#, 16), to_signed(16#3FE4#, 16),
     to_signed(16#3FE1#, 16), to_signed(16#3FDE#, 16), to_signed(16#3FDB#, 16), to_signed(16#3FD7#, 16),
     to_signed(16#3FD4#, 16), to_signed(16#3FD0#, 16), to_signed(16#3FCC#, 16), to_signed(16#3FC8#, 16),
     to_signed(16#3FC4#, 16), to_signed(16#3FBF#, 16), to_signed(16#3FBB#, 16), to_signed(16#3FB6#, 16),
     to_signed(16#3FB1#, 16), to_signed(16#3FAC#, 16), to_signed(16#3FA7#, 16), to_signed(16#3FA2#, 16),
     to_signed(16#3F9C#, 16), to_signed(16#3F97#, 16), to_signed(16#3F91#, 16), to_signed(16#3F8B#, 16),
     to_signed(16#3F85#, 16), to_signed(16#3F7F#, 16), to_signed(16#3F78#, 16), to_signed(16#3F72#, 16),
     to_signed(16#3F6B#, 16), to_signed(16#3F64#, 16), to_signed(16#3F5D#, 16), to_signed(16#3F56#, 16),
     to_signed(16#3F4F#, 16), to_signed(16#3F47#, 16), to_signed(16#3F40#, 16), to_signed(16#3F38#, 16),
     to_signed(16#3F30#, 16), to_signed(16#3F28#, 16), to_signed(16#3F20#, 16), to_signed(16#3F17#, 16),
     to_signed(16#3F0F#, 16), to_signed(16#3F06#, 16), to_signed(16#3EFD#, 16), to_signed(16#3EF4#, 16),
     to_signed(16#3EEB#, 16), to_signed(16#3EE2#, 16), to_signed(16#3ED8#, 16), to_signed(16#3ECF#, 16),
     to_signed(16#3EC5#, 16), to_signed(16#3EBB#, 16), to_signed(16#3EB1#, 16), to_signed(16#3EA7#, 16),
     to_signed(16#3E9D#, 16), to_signed(16#3E92#, 16), to_signed(16#3E88#, 16), to_signed(16#3E7D#, 16),
     to_signed(16#3E72#, 16), to_signed(16#3E67#, 16), to_signed(16#3E5C#, 16), to_signed(16#3E50#, 16),
     to_signed(16#3E45#, 16), to_signed(16#3E39#, 16), to_signed(16#3E2D#, 16), to_signed(16#3E21#, 16),
     to_signed(16#3E15#, 16), to_signed(16#3E09#, 16), to_signed(16#3DFC#, 16), to_signed(16#3DF0#, 16),
     to_signed(16#3DE3#, 16), to_signed(16#3DD6#, 16), to_signed(16#3DC9#, 16), to_signed(16#3DBC#, 16),
     to_signed(16#3DAF#, 16), to_signed(16#3DA1#, 16), to_signed(16#3D93#, 16), to_signed(16#3D86#, 16),
     to_signed(16#3D78#, 16), to_signed(16#3D6A#, 16), to_signed(16#3D5B#, 16), to_signed(16#3D4D#, 16),
     to_signed(16#3D3F#, 16), to_signed(16#3D30#, 16), to_signed(16#3D21#, 16), to_signed(16#3D12#, 16),
     to_signed(16#3D03#, 16), to_signed(16#3CF4#, 16), to_signed(16#3CE4#, 16), to_signed(16#3CD5#, 16),
     to_signed(16#3CC5#, 16), to_signed(16#3CB5#, 16), to_signed(16#3CA5#, 16), to_signed(16#3C95#, 16),
     to_signed(16#3C85#, 16), to_signed(16#3C74#, 16), to_signed(16#3C64#, 16), to_signed(16#3C53#, 16),
     to_signed(16#3C42#, 16), to_signed(16#3C31#, 16), to_signed(16#3C20#, 16), to_signed(16#3C0F#, 16),
     to_signed(16#3BFD#, 16), to_signed(16#3BEC#, 16), to_signed(16#3BDA#, 16), to_signed(16#3BC8#, 16),
     to_signed(16#3BB6#, 16), to_signed(16#3BA4#, 16), to_signed(16#3B92#, 16), to_signed(16#3B7F#, 16),
     to_signed(16#3B6D#, 16), to_signed(16#3B5A#, 16), to_signed(16#3B47#, 16), to_signed(16#3B34#, 16),
     to_signed(16#3B21#, 16), to_signed(16#3B0E#, 16), to_signed(16#3AFA#, 16), to_signed(16#3AE6#, 16),
     to_signed(16#3AD3#, 16), to_signed(16#3ABF#, 16), to_signed(16#3AAB#, 16), to_signed(16#3A97#, 16),
     to_signed(16#3A82#, 16), to_signed(16#3A6E#, 16), to_signed(16#3A59#, 16), to_signed(16#3A45#, 16),
     to_signed(16#3A30#, 16), to_signed(16#3A1B#, 16), to_signed(16#3A06#, 16), to_signed(16#39F0#, 16),
     to_signed(16#39DB#, 16), to_signed(16#39C5#, 16), to_signed(16#39B0#, 16), to_signed(16#399A#, 16),
     to_signed(16#3984#, 16), to_signed(16#396E#, 16), to_signed(16#3958#, 16), to_signed(16#3941#, 16),
     to_signed(16#392B#, 16), to_signed(16#3914#, 16), to_signed(16#38FD#, 16), to_signed(16#38E6#, 16),
     to_signed(16#38CF#, 16), to_signed(16#38B8#, 16), to_signed(16#38A1#, 16), to_signed(16#3889#, 16),
     to_signed(16#3871#, 16), to_signed(16#385A#, 16), to_signed(16#3842#, 16), to_signed(16#382A#, 16),
     to_signed(16#3812#, 16), to_signed(16#37F9#, 16), to_signed(16#37E1#, 16), to_signed(16#37C8#, 16),
     to_signed(16#37B0#, 16), to_signed(16#3797#, 16), to_signed(16#377E#, 16), to_signed(16#3765#, 16),
     to_signed(16#374B#, 16), to_signed(16#3732#, 16), to_signed(16#3718#, 16), to_signed(16#36FF#, 16),
     to_signed(16#36E5#, 16), to_signed(16#36CB#, 16), to_signed(16#36B1#, 16), to_signed(16#3697#, 16),
     to_signed(16#367D#, 16), to_signed(16#3662#, 16), to_signed(16#3648#, 16), to_signed(16#362D#, 16),
     to_signed(16#3612#, 16), to_signed(16#35F7#, 16), to_signed(16#35DC#, 16), to_signed(16#35C1#, 16),
     to_signed(16#35A5#, 16), to_signed(16#358A#, 16), to_signed(16#356E#, 16), to_signed(16#3553#, 16),
     to_signed(16#3537#, 16), to_signed(16#351B#, 16), to_signed(16#34FF#, 16), to_signed(16#34E2#, 16),
     to_signed(16#34C6#, 16), to_signed(16#34AA#, 16), to_signed(16#348D#, 16), to_signed(16#3470#, 16),
     to_signed(16#3453#, 16), to_signed(16#3436#, 16), to_signed(16#3419#, 16), to_signed(16#33FC#, 16),
     to_signed(16#33DF#, 16), to_signed(16#33C1#, 16), to_signed(16#33A3#, 16), to_signed(16#3386#, 16),
     to_signed(16#3368#, 16), to_signed(16#334A#, 16), to_signed(16#332C#, 16), to_signed(16#330D#, 16),
     to_signed(16#32EF#, 16), to_signed(16#32D0#, 16), to_signed(16#32B2#, 16), to_signed(16#3293#, 16),
     to_signed(16#3274#, 16), to_signed(16#3255#, 16), to_signed(16#3236#, 16), to_signed(16#3217#, 16),
     to_signed(16#31F8#, 16), to_signed(16#31D8#, 16), to_signed(16#31B9#, 16), to_signed(16#3199#, 16),
     to_signed(16#3179#, 16), to_signed(16#3159#, 16), to_signed(16#3139#, 16), to_signed(16#3119#, 16),
     to_signed(16#30F9#, 16), to_signed(16#30D8#, 16), to_signed(16#30B8#, 16), to_signed(16#3097#, 16),
     to_signed(16#3076#, 16), to_signed(16#3055#, 16), to_signed(16#3034#, 16), to_signed(16#3013#, 16),
     to_signed(16#2FF2#, 16), to_signed(16#2FD0#, 16), to_signed(16#2FAF#, 16), to_signed(16#2F8D#, 16),
     to_signed(16#2F6C#, 16), to_signed(16#2F4A#, 16), to_signed(16#2F28#, 16), to_signed(16#2F06#, 16),
     to_signed(16#2EE4#, 16), to_signed(16#2EC2#, 16), to_signed(16#2E9F#, 16), to_signed(16#2E7D#, 16),
     to_signed(16#2E5A#, 16), to_signed(16#2E37#, 16), to_signed(16#2E15#, 16), to_signed(16#2DF2#, 16),
     to_signed(16#2DCF#, 16), to_signed(16#2DAB#, 16), to_signed(16#2D88#, 16), to_signed(16#2D65#, 16));  -- sfix16 [256]
  CONSTANT Twiddle_im_table_data          : vector_of_signed16(0 TO 255) := 
    (to_signed(16#0000#, 16), to_signed(-16#0032#, 16), to_signed(-16#0065#, 16), to_signed(-16#0097#, 16),
     to_signed(-16#00C9#, 16), to_signed(-16#00FB#, 16), to_signed(-16#012E#, 16), to_signed(-16#0160#, 16),
     to_signed(-16#0192#, 16), to_signed(-16#01C4#, 16), to_signed(-16#01F7#, 16), to_signed(-16#0229#, 16),
     to_signed(-16#025B#, 16), to_signed(-16#028D#, 16), to_signed(-16#02C0#, 16), to_signed(-16#02F2#, 16),
     to_signed(-16#0324#, 16), to_signed(-16#0356#, 16), to_signed(-16#0388#, 16), to_signed(-16#03BB#, 16),
     to_signed(-16#03ED#, 16), to_signed(-16#041F#, 16), to_signed(-16#0451#, 16), to_signed(-16#0483#, 16),
     to_signed(-16#04B5#, 16), to_signed(-16#04E7#, 16), to_signed(-16#051A#, 16), to_signed(-16#054C#, 16),
     to_signed(-16#057E#, 16), to_signed(-16#05B0#, 16), to_signed(-16#05E2#, 16), to_signed(-16#0614#, 16),
     to_signed(-16#0646#, 16), to_signed(-16#0678#, 16), to_signed(-16#06AA#, 16), to_signed(-16#06DC#, 16),
     to_signed(-16#070E#, 16), to_signed(-16#0740#, 16), to_signed(-16#0772#, 16), to_signed(-16#07A4#, 16),
     to_signed(-16#07D6#, 16), to_signed(-16#0807#, 16), to_signed(-16#0839#, 16), to_signed(-16#086B#, 16),
     to_signed(-16#089D#, 16), to_signed(-16#08CF#, 16), to_signed(-16#0901#, 16), to_signed(-16#0932#, 16),
     to_signed(-16#0964#, 16), to_signed(-16#0996#, 16), to_signed(-16#09C7#, 16), to_signed(-16#09F9#, 16),
     to_signed(-16#0A2B#, 16), to_signed(-16#0A5C#, 16), to_signed(-16#0A8E#, 16), to_signed(-16#0AC0#, 16),
     to_signed(-16#0AF1#, 16), to_signed(-16#0B23#, 16), to_signed(-16#0B54#, 16), to_signed(-16#0B85#, 16),
     to_signed(-16#0BB7#, 16), to_signed(-16#0BE8#, 16), to_signed(-16#0C1A#, 16), to_signed(-16#0C4B#, 16),
     to_signed(-16#0C7C#, 16), to_signed(-16#0CAE#, 16), to_signed(-16#0CDF#, 16), to_signed(-16#0D10#, 16),
     to_signed(-16#0D41#, 16), to_signed(-16#0D72#, 16), to_signed(-16#0DA4#, 16), to_signed(-16#0DD5#, 16),
     to_signed(-16#0E06#, 16), to_signed(-16#0E37#, 16), to_signed(-16#0E68#, 16), to_signed(-16#0E99#, 16),
     to_signed(-16#0ECA#, 16), to_signed(-16#0EFB#, 16), to_signed(-16#0F2B#, 16), to_signed(-16#0F5C#, 16),
     to_signed(-16#0F8D#, 16), to_signed(-16#0FBE#, 16), to_signed(-16#0FEE#, 16), to_signed(-16#101F#, 16),
     to_signed(-16#1050#, 16), to_signed(-16#1080#, 16), to_signed(-16#10B1#, 16), to_signed(-16#10E1#, 16),
     to_signed(-16#1112#, 16), to_signed(-16#1142#, 16), to_signed(-16#1173#, 16), to_signed(-16#11A3#, 16),
     to_signed(-16#11D3#, 16), to_signed(-16#1204#, 16), to_signed(-16#1234#, 16), to_signed(-16#1264#, 16),
     to_signed(-16#1294#, 16), to_signed(-16#12C4#, 16), to_signed(-16#12F4#, 16), to_signed(-16#1324#, 16),
     to_signed(-16#1354#, 16), to_signed(-16#1384#, 16), to_signed(-16#13B4#, 16), to_signed(-16#13E4#, 16),
     to_signed(-16#1413#, 16), to_signed(-16#1443#, 16), to_signed(-16#1473#, 16), to_signed(-16#14A2#, 16),
     to_signed(-16#14D2#, 16), to_signed(-16#1501#, 16), to_signed(-16#1531#, 16), to_signed(-16#1560#, 16),
     to_signed(-16#1590#, 16), to_signed(-16#15BF#, 16), to_signed(-16#15EE#, 16), to_signed(-16#161D#, 16),
     to_signed(-16#164C#, 16), to_signed(-16#167C#, 16), to_signed(-16#16AB#, 16), to_signed(-16#16DA#, 16),
     to_signed(-16#1709#, 16), to_signed(-16#1737#, 16), to_signed(-16#1766#, 16), to_signed(-16#1795#, 16),
     to_signed(-16#17C4#, 16), to_signed(-16#17F2#, 16), to_signed(-16#1821#, 16), to_signed(-16#184F#, 16),
     to_signed(-16#187E#, 16), to_signed(-16#18AC#, 16), to_signed(-16#18DB#, 16), to_signed(-16#1909#, 16),
     to_signed(-16#1937#, 16), to_signed(-16#1965#, 16), to_signed(-16#1993#, 16), to_signed(-16#19C1#, 16),
     to_signed(-16#19EF#, 16), to_signed(-16#1A1D#, 16), to_signed(-16#1A4B#, 16), to_signed(-16#1A79#, 16),
     to_signed(-16#1AA7#, 16), to_signed(-16#1AD4#, 16), to_signed(-16#1B02#, 16), to_signed(-16#1B30#, 16),
     to_signed(-16#1B5D#, 16), to_signed(-16#1B8A#, 16), to_signed(-16#1BB8#, 16), to_signed(-16#1BE5#, 16),
     to_signed(-16#1C12#, 16), to_signed(-16#1C3F#, 16), to_signed(-16#1C6C#, 16), to_signed(-16#1C99#, 16),
     to_signed(-16#1CC6#, 16), to_signed(-16#1CF3#, 16), to_signed(-16#1D20#, 16), to_signed(-16#1D4D#, 16),
     to_signed(-16#1D79#, 16), to_signed(-16#1DA6#, 16), to_signed(-16#1DD3#, 16), to_signed(-16#1DFF#, 16),
     to_signed(-16#1E2B#, 16), to_signed(-16#1E58#, 16), to_signed(-16#1E84#, 16), to_signed(-16#1EB0#, 16),
     to_signed(-16#1EDC#, 16), to_signed(-16#1F08#, 16), to_signed(-16#1F34#, 16), to_signed(-16#1F60#, 16),
     to_signed(-16#1F8C#, 16), to_signed(-16#1FB7#, 16), to_signed(-16#1FE3#, 16), to_signed(-16#200F#, 16),
     to_signed(-16#203A#, 16), to_signed(-16#2065#, 16), to_signed(-16#2091#, 16), to_signed(-16#20BC#, 16),
     to_signed(-16#20E7#, 16), to_signed(-16#2112#, 16), to_signed(-16#213D#, 16), to_signed(-16#2168#, 16),
     to_signed(-16#2193#, 16), to_signed(-16#21BE#, 16), to_signed(-16#21E8#, 16), to_signed(-16#2213#, 16),
     to_signed(-16#223D#, 16), to_signed(-16#2268#, 16), to_signed(-16#2292#, 16), to_signed(-16#22BC#, 16),
     to_signed(-16#22E7#, 16), to_signed(-16#2311#, 16), to_signed(-16#233B#, 16), to_signed(-16#2365#, 16),
     to_signed(-16#238E#, 16), to_signed(-16#23B8#, 16), to_signed(-16#23E2#, 16), to_signed(-16#240B#, 16),
     to_signed(-16#2435#, 16), to_signed(-16#245E#, 16), to_signed(-16#2488#, 16), to_signed(-16#24B1#, 16),
     to_signed(-16#24DA#, 16), to_signed(-16#2503#, 16), to_signed(-16#252C#, 16), to_signed(-16#2555#, 16),
     to_signed(-16#257E#, 16), to_signed(-16#25A6#, 16), to_signed(-16#25CF#, 16), to_signed(-16#25F8#, 16),
     to_signed(-16#2620#, 16), to_signed(-16#2648#, 16), to_signed(-16#2671#, 16), to_signed(-16#2699#, 16),
     to_signed(-16#26C1#, 16), to_signed(-16#26E9#, 16), to_signed(-16#2711#, 16), to_signed(-16#2738#, 16),
     to_signed(-16#2760#, 16), to_signed(-16#2788#, 16), to_signed(-16#27AF#, 16), to_signed(-16#27D6#, 16),
     to_signed(-16#27FE#, 16), to_signed(-16#2825#, 16), to_signed(-16#284C#, 16), to_signed(-16#2873#, 16),
     to_signed(-16#289A#, 16), to_signed(-16#28C1#, 16), to_signed(-16#28E7#, 16), to_signed(-16#290E#, 16),
     to_signed(-16#2935#, 16), to_signed(-16#295B#, 16), to_signed(-16#2981#, 16), to_signed(-16#29A7#, 16),
     to_signed(-16#29CE#, 16), to_signed(-16#29F4#, 16), to_signed(-16#2A1A#, 16), to_signed(-16#2A3F#, 16),
     to_signed(-16#2A65#, 16), to_signed(-16#2A8B#, 16), to_signed(-16#2AB0#, 16), to_signed(-16#2AD6#, 16),
     to_signed(-16#2AFB#, 16), to_signed(-16#2B20#, 16), to_signed(-16#2B45#, 16), to_signed(-16#2B6A#, 16),
     to_signed(-16#2B8F#, 16), to_signed(-16#2BB4#, 16), to_signed(-16#2BD8#, 16), to_signed(-16#2BFD#, 16),
     to_signed(-16#2C21#, 16), to_signed(-16#2C46#, 16), to_signed(-16#2C6A#, 16), to_signed(-16#2C8E#, 16),
     to_signed(-16#2CB2#, 16), to_signed(-16#2CD6#, 16), to_signed(-16#2CFA#, 16), to_signed(-16#2D1E#, 16));  -- sfix16 [256]

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
  SIGNAL Radix22TwdlMapping_cnt           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Radix22TwdlMapping_phase         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Radix22TwdlMapping_octantReg1    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Radix22TwdlMapping_twdlAddr_raw  : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Radix22TwdlMapping_twdlAddrMap   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Radix22TwdlMapping_twdl45Reg     : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg1      : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg2      : std_logic;
  SIGNAL Radix22TwdlMapping_cnt_next      : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Radix22TwdlMapping_phase_next    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Radix22TwdlMapping_octantReg1_next : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Radix22TwdlMapping_twdlAddr_raw_next : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Radix22TwdlMapping_twdlAddrMap_next : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Radix22TwdlMapping_twdl45Reg_next : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg1_next : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg2_next : std_logic;
  SIGNAL twdlAddr                         : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL twdlAddrVld                      : std_logic;
  SIGNAL twdlOctant                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL twdl45                           : std_logic;
  SIGNAL twiddleS_re                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twiddleReg_re                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twiddleS_im                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twiddleReg_im                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdlOctantReg                    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL twdl45Reg                        : std_logic;
  SIGNAL twdl_7_1_re_tmp                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdl_7_1_im_tmp                  : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  -- Radix22TwdlMapping
  Radix22TwdlMapping_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22TwdlMapping_octantReg1 <= to_unsigned(16#0#, 3);
      Radix22TwdlMapping_twdlAddr_raw <= to_unsigned(16#000#, 11);
      Radix22TwdlMapping_twdlAddrMap <= to_unsigned(16#00#, 8);
      Radix22TwdlMapping_twdl45Reg <= '0';
      Radix22TwdlMapping_dvldReg1 <= '0';
      Radix22TwdlMapping_dvldReg2 <= '0';
      Radix22TwdlMapping_cnt <= to_unsigned(16#000#, 9);
      Radix22TwdlMapping_phase <= to_unsigned(16#0#, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Radix22TwdlMapping_cnt <= Radix22TwdlMapping_cnt_next;
        Radix22TwdlMapping_phase <= Radix22TwdlMapping_phase_next;
        Radix22TwdlMapping_octantReg1 <= Radix22TwdlMapping_octantReg1_next;
        Radix22TwdlMapping_twdlAddr_raw <= Radix22TwdlMapping_twdlAddr_raw_next;
        Radix22TwdlMapping_twdlAddrMap <= Radix22TwdlMapping_twdlAddrMap_next;
        Radix22TwdlMapping_twdl45Reg <= Radix22TwdlMapping_twdl45Reg_next;
        Radix22TwdlMapping_dvldReg1 <= Radix22TwdlMapping_dvldReg1_next;
        Radix22TwdlMapping_dvldReg2 <= Radix22TwdlMapping_dvldReg2_next;
      END IF;
    END IF;
  END PROCESS Radix22TwdlMapping_process;

  Radix22TwdlMapping_output : PROCESS (Radix22TwdlMapping_cnt, Radix22TwdlMapping_dvldReg1,
       Radix22TwdlMapping_dvldReg2, Radix22TwdlMapping_octantReg1,
       Radix22TwdlMapping_phase, Radix22TwdlMapping_twdl45Reg,
       Radix22TwdlMapping_twdlAddrMap, Radix22TwdlMapping_twdlAddr_raw,
       dout_6_1_vld)
    VARIABLE octant : unsigned(2 DOWNTO 0);
    VARIABLE cnt_cast : unsigned(10 DOWNTO 0);
    VARIABLE sub_cast : signed(23 DOWNTO 0);
    VARIABLE sub_temp : signed(23 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(12 DOWNTO 0);
    VARIABLE sub_temp_0 : signed(12 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(12 DOWNTO 0);
    VARIABLE sub_temp_1 : signed(12 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(23 DOWNTO 0);
    VARIABLE sub_temp_2 : signed(23 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(23 DOWNTO 0);
    VARIABLE sub_temp_3 : signed(23 DOWNTO 0);
  BEGIN
    sub_temp := to_signed(16#000000#, 24);
    sub_temp_0 := to_signed(16#0000#, 13);
    sub_temp_1 := to_signed(16#0000#, 13);
    sub_temp_2 := to_signed(16#000000#, 24);
    sub_temp_3 := to_signed(16#000000#, 24);
    cnt_cast := to_unsigned(16#000#, 11);
    sub_cast := to_signed(16#000000#, 24);
    sub_cast_0 := to_signed(16#0000#, 13);
    sub_cast_1 := to_signed(16#0000#, 13);
    sub_cast_2 := to_signed(16#000000#, 24);
    sub_cast_3 := to_signed(16#000000#, 24);
    Radix22TwdlMapping_cnt_next <= Radix22TwdlMapping_cnt;
    Radix22TwdlMapping_phase_next <= Radix22TwdlMapping_phase;
    Radix22TwdlMapping_twdlAddr_raw_next <= Radix22TwdlMapping_twdlAddr_raw;
    Radix22TwdlMapping_twdlAddrMap_next <= Radix22TwdlMapping_twdlAddrMap;
    Radix22TwdlMapping_twdl45Reg_next <= Radix22TwdlMapping_twdl45Reg;
    Radix22TwdlMapping_dvldReg2_next <= Radix22TwdlMapping_dvldReg1;
    Radix22TwdlMapping_dvldReg1_next <= dout_6_1_vld;
    CASE Radix22TwdlMapping_twdlAddr_raw IS
      WHEN "00100000000" =>
        octant := to_unsigned(16#0#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '1';
      WHEN "01000000000" =>
        octant := to_unsigned(16#1#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '0';
      WHEN "01100000000" =>
        octant := to_unsigned(16#2#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '1';
      WHEN "10000000000" =>
        octant := to_unsigned(16#3#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '0';
      WHEN "10100000000" =>
        octant := to_unsigned(16#4#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '1';
      WHEN OTHERS => 
        octant := Radix22TwdlMapping_twdlAddr_raw(10 DOWNTO 8);
        Radix22TwdlMapping_twdl45Reg_next <= '0';
    END CASE;
    Radix22TwdlMapping_octantReg1_next <= octant;
    CASE octant IS
      WHEN "000" =>
        Radix22TwdlMapping_twdlAddrMap_next <= Radix22TwdlMapping_twdlAddr_raw(7 DOWNTO 0);
      WHEN "001" =>
        sub_cast_0 := signed(resize(Radix22TwdlMapping_twdlAddr_raw, 13));
        sub_temp_0 := to_signed(16#0200#, 13) - sub_cast_0;
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_0(7 DOWNTO 0));
      WHEN "010" =>
        sub_cast_1 := signed(resize(Radix22TwdlMapping_twdlAddr_raw, 13));
        sub_temp_1 := sub_cast_1 - to_signed(16#0200#, 13);
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_1(7 DOWNTO 0));
      WHEN "011" =>
        sub_cast_2 := signed(resize(Radix22TwdlMapping_twdlAddr_raw & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 24));
        sub_temp_2 := to_signed(16#040000#, 24) - sub_cast_2;
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_2(15 DOWNTO 8));
      WHEN "100" =>
        sub_cast_3 := signed(resize(Radix22TwdlMapping_twdlAddr_raw & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 24));
        sub_temp_3 := sub_cast_3 - to_signed(16#040000#, 24);
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_3(15 DOWNTO 8));
      WHEN OTHERS => 
        sub_cast := signed(resize(Radix22TwdlMapping_twdlAddr_raw & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 24));
        sub_temp := to_signed(16#060000#, 24) - sub_cast;
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp(15 DOWNTO 8));
    END CASE;
    IF Radix22TwdlMapping_phase = to_unsigned(16#0#, 2) THEN 
      Radix22TwdlMapping_twdlAddr_raw_next <= to_unsigned(16#000#, 11);
    ELSIF Radix22TwdlMapping_phase = to_unsigned(16#1#, 2) THEN 
      Radix22TwdlMapping_twdlAddr_raw_next <= resize(Radix22TwdlMapping_cnt, 11) sll 1;
    ELSIF Radix22TwdlMapping_phase = to_unsigned(16#2#, 2) THEN 
      Radix22TwdlMapping_twdlAddr_raw_next <= resize(Radix22TwdlMapping_cnt, 11);
    ELSE 
      cnt_cast := resize(Radix22TwdlMapping_cnt, 11);
      Radix22TwdlMapping_twdlAddr_raw_next <= (cnt_cast sll 1) + cnt_cast;
    END IF;
    IF (dout_6_1_vld AND hdlcoder_to_stdlogic(Radix22TwdlMapping_cnt > to_unsigned(16#1EF#, 9))) = '1' THEN 
      Radix22TwdlMapping_phase_next <= Radix22TwdlMapping_phase + to_unsigned(16#1#, 2);
    END IF;
    IF dout_6_1_vld = '1' THEN 
      Radix22TwdlMapping_cnt_next <= Radix22TwdlMapping_cnt + to_unsigned(16#010#, 9);
    END IF;
    twdlAddr <= Radix22TwdlMapping_twdlAddrMap;
    twdlAddrVld <= Radix22TwdlMapping_dvldReg2;
    twdlOctant <= Radix22TwdlMapping_octantReg1;
    twdl45 <= Radix22TwdlMapping_twdl45Reg;
  END PROCESS Radix22TwdlMapping_output;


  -- Twiddle ROM1
  twiddleS_re <= Twiddle_re_table_data(to_integer(twdlAddr));

  TWIDDLEROM_RE_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twiddleReg_re <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twiddleReg_re <= twiddleS_re;
      END IF;
    END IF;
  END PROCESS TWIDDLEROM_RE_process;


  -- Twiddle ROM2
  twiddleS_im <= Twiddle_im_table_data(to_integer(twdlAddr));

  TWIDDLEROM_IM_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twiddleReg_im <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twiddleReg_im <= twiddleS_im;
      END IF;
    END IF;
  END PROCESS TWIDDLEROM_IM_process;


  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdlOctantReg <= to_unsigned(16#0#, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twdlOctantReg <= twdlOctant;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl45Reg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twdl45Reg <= twdl45;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  -- Radix22TwdlOctCorr
  Radix22TwdlOctCorr_output : PROCESS (twdl45Reg, twdlOctantReg, twiddleReg_im, twiddleReg_re)
    VARIABLE twdlIn_re : signed(15 DOWNTO 0);
    VARIABLE twdlIn_im : signed(15 DOWNTO 0);
    VARIABLE cast : signed(16 DOWNTO 0);
    VARIABLE cast_0 : signed(16 DOWNTO 0);
    VARIABLE cast_1 : signed(16 DOWNTO 0);
    VARIABLE cast_2 : signed(16 DOWNTO 0);
    VARIABLE cast_3 : signed(16 DOWNTO 0);
    VARIABLE cast_4 : signed(16 DOWNTO 0);
    VARIABLE cast_5 : signed(16 DOWNTO 0);
    VARIABLE cast_6 : signed(16 DOWNTO 0);
    VARIABLE cast_7 : signed(16 DOWNTO 0);
    VARIABLE cast_8 : signed(16 DOWNTO 0);
    VARIABLE cast_9 : signed(16 DOWNTO 0);
    VARIABLE cast_10 : signed(16 DOWNTO 0);
  BEGIN
    cast_0 := to_signed(16#00000#, 17);
    cast_2 := to_signed(16#00000#, 17);
    cast_4 := to_signed(16#00000#, 17);
    cast_6 := to_signed(16#00000#, 17);
    cast_8 := to_signed(16#00000#, 17);
    cast_10 := to_signed(16#00000#, 17);
    cast := to_signed(16#00000#, 17);
    cast_1 := to_signed(16#00000#, 17);
    cast_3 := to_signed(16#00000#, 17);
    cast_5 := to_signed(16#00000#, 17);
    cast_7 := to_signed(16#00000#, 17);
    cast_9 := to_signed(16#00000#, 17);
    twdlIn_re := twiddleReg_re;
    twdlIn_im := twiddleReg_im;
    IF twdl45Reg = '1' THEN 
      CASE twdlOctantReg IS
        WHEN "000" =>
          twdlIn_re := to_signed(16#2D41#, 16);
          twdlIn_im := to_signed(-16#2D41#, 16);
        WHEN "010" =>
          twdlIn_re := to_signed(-16#2D41#, 16);
          twdlIn_im := to_signed(-16#2D41#, 16);
        WHEN "100" =>
          twdlIn_re := to_signed(-16#2D41#, 16);
          twdlIn_im := to_signed(16#2D41#, 16);
        WHEN OTHERS => 
          twdlIn_re := to_signed(16#2D41#, 16);
          twdlIn_im := to_signed(-16#2D41#, 16);
      END CASE;
    ELSE 
      CASE twdlOctantReg IS
        WHEN "000" =>
          NULL;
        WHEN "001" =>
          cast := resize(twiddleReg_im, 17);
          cast_0 :=  - (cast);
          twdlIn_re := cast_0(15 DOWNTO 0);
          cast_5 := resize(twiddleReg_re, 17);
          cast_6 :=  - (cast_5);
          twdlIn_im := cast_6(15 DOWNTO 0);
        WHEN "010" =>
          twdlIn_re := twiddleReg_im;
          cast_7 := resize(twiddleReg_re, 17);
          cast_8 :=  - (cast_7);
          twdlIn_im := cast_8(15 DOWNTO 0);
        WHEN "011" =>
          cast_1 := resize(twiddleReg_re, 17);
          cast_2 :=  - (cast_1);
          twdlIn_re := cast_2(15 DOWNTO 0);
          twdlIn_im := twiddleReg_im;
        WHEN "100" =>
          cast_3 := resize(twiddleReg_re, 17);
          cast_4 :=  - (cast_3);
          twdlIn_re := cast_4(15 DOWNTO 0);
          cast_9 := resize(twiddleReg_im, 17);
          cast_10 :=  - (cast_9);
          twdlIn_im := cast_10(15 DOWNTO 0);
        WHEN OTHERS => 
          twdlIn_re := twiddleReg_im;
          twdlIn_im := twiddleReg_re;
      END CASE;
    END IF;
    twdl_7_1_re_tmp <= twdlIn_re;
    twdl_7_1_im_tmp <= twdlIn_im;
  END PROCESS Radix22TwdlOctCorr_output;


  twdl_7_1_re <= std_logic_vector(twdl_7_1_re_tmp);

  twdl_7_1_im <= std_logic_vector(twdl_7_1_im_tmp);

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl_7_1_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twdl_7_1_vld <= twdlAddrVld;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


END rtl;

