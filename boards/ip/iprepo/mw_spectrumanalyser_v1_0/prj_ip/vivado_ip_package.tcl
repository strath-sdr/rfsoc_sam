create_project prj_ip {} -part xczu28dr-ffvg1517-2-e -force
set_property ip_repo_paths {../../} [current_fileset]

# Add HDL source files to project
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser_pkg.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Convert_Data.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SimpleDualPortRAM_generic.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_1024.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_128.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block7.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block8.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block9.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block10.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_2048.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block11.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block12.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block13.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_256.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block14.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block15.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block16.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block17.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block18.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_4096.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block19.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block20.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block21.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block22.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block7.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_512.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block8.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block23.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block24.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_64.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block9.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block25.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block26.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block27.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block5.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block4.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block28.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block3.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block2.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block29.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_13_1.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block30.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator13.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_13.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block10.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block6.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_8192.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_FFT_Core.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_nfp_hypot_single.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_nfp_convert_sfix_29_En15_to_single.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_nfp_log10_single.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_nfp_pow10_single.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_nfp_mul_single.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Options.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_reset_sync.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_dut.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_generic.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_fifo_data_OUT.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_singlebit.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_OUT.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_OUT.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_axi4_stream_master.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_fifo_data.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_fifo_TLAST.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_fifo_TUSER.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_axi4_stream_real_slave.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_fifo_data_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_block.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_axi4_stream_imag_slave.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_addr_decoder.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_axi_lite_module.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser_axi_lite.vhd}
add_files -norecurse {../hdl/vhdl/mw_spectrumanalyser.vhd}
set_property top mw_spectrumanalyser [get_filesets sources_1]
set_property top mw_spectrumanalyser [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Package IP from project
ipx::package_project -root_dir {../} -force

# Set IP properties
set_property name mw_spectrumanalyser [ipx::current_core]
set_property display_name mw_spectrumanalyser [ipx::current_core]
set_property version {1.0} [ipx::current_core]
set_property library {ip} [ipx::current_core]
set Families [split [lsort -uniq [get_property C_FAMILY [get_parts]]]]
set IPSupportedFamily {}
foreach family $Families {append IPSupportedFamily "{$family} {Production} "}
set_property supported_families $IPSupportedFamily [ipx::current_core]
set_property taxonomy {{/HDL Coder Generated IP}} [ipx::current_core]
set_property description {HDL Coder generated IP} [ipx::current_core]
set_property core_revision 2012240922 [ipx::current_core]

# Add HDL source files to IP
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser_pkg.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser_pkg.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser_pkg.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser_pkg.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Convert_Data.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Convert_Data.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Convert_Data.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Convert_Data.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_1024.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_1024.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_1024.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_1024.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_128.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_128.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_128.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_128.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block8.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block8.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block9.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block9.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block10.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block10.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_2048.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_2048.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_2048.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_2048.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block11.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block11.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block11.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block11.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block12.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block12.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block12.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block12.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block13.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block13.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block13.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block13.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_256.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_256.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_256.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_256.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block14.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block14.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block14.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block14.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block15.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block15.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block15.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block15.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block16.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block16.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block16.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block16.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block17.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block17.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block17.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block17.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block18.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block18.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block18.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block18.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_4096.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_4096.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_4096.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_4096.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block19.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block19.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block19.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block19.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block20.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block20.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block20.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block20.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block21.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block21.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block21.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block21.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block22.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block22.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block22.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block22.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_512.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_512.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_512.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_512.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block8.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block8.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block23.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block23.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block23.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block23.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block24.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block24.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block24.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block24.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_64.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_64.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_64.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_64.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block9.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block9.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator2_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_2_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_2_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_3_1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block25.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block25.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block25.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block25.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator3_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_3_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_3_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator4_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_4_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_4_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_5_1_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block26.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block26.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block26.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block26.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator5_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_5_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_5_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator6_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_6_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_6_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_7_1_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block27.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block27.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block27.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block27.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator7_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_7_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_7_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator8_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_8_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_8_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_9_1_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block28.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block28.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block28.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block28.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator9_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_9_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_9_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator10_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_10_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_10_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_11_1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block29.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block29.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block29.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block29.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator11_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_11_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_11_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator12_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF2_12_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_12_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_13_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_13_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_13_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_TWDLROM_13_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block30.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block30.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block30.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Complex4Multiply_block30.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator13.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator13.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator13.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_SDFCommutator13.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_13.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_13.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_13.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_SDF1_13.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block10.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block10.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX22FFT_CTRL1_1_block10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_RADIX2FFT_bitNatural_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_8192.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_8192.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_8192.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_HDL_Optimized_8192.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_Core.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_Core.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_FFT_Core.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_FFT_Core.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_wire_single_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_hypot_single.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_hypot_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_hypot_single.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_hypot_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_convert_sfix_29_En15_to_single.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_convert_sfix_29_En15_to_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_convert_sfix_29_En15_to_single.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_convert_sfix_29_En15_to_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_log10_single.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_log10_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_log10_single.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_log10_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_pow10_single.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_pow10_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_pow10_single.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_pow10_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_mul_single.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_mul_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_nfp_mul_single.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_nfp_mul_single.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Options.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Options.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Options.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Options.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_src_Spectrum_Analyser.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_dut.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_dut.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_data_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_data_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_data_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_data_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi4_stream_master.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi4_stream_master.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi4_stream_master.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi4_stream_master.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_data.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_data.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_data.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_data.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi4_stream_real_slave.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi4_stream_real_slave.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi4_stream_real_slave.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi4_stream_real_slave.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_data_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_data_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_data_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_data_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TLAST_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_fifo_TUSER_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi4_stream_imag_slave.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi4_stream_imag_slave.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi4_stream_imag_slave.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi4_stream_imag_slave.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_addr_decoder.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_addr_decoder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_addr_decoder.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_addr_decoder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi_lite_module.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi_lite_module.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi_lite_module.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi_lite_module.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi_lite.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi_lite.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser_axi_lite.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser_axi_lite.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/mw_spectrumanalyser.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/mw_spectrumanalyser.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]

# Add bus interfaces
ipx::remove_all_bus_interface [ipx::current_core]
ipx::remove_all_memory_map [ipx::current_core]
ipx::remove_all_address_space [ipx::current_core]
# AXI4_Lite Slave
ipx::add_bus_interface {AXI4_Lite} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:aximm_rtl:1.0} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:aximm:1.0} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
ipx::add_port_map {AWADDR} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_AWADDR} [ipx::get_port_maps AWADDR -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {AWVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_AWVALID} [ipx::get_port_maps AWVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WDATA} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WDATA} [ipx::get_port_maps WDATA -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WSTRB} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WSTRB} [ipx::get_port_maps WSTRB -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WVALID} [ipx::get_port_maps WVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {BREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_BREADY} [ipx::get_port_maps BREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {ARADDR} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARADDR} [ipx::get_port_maps ARADDR -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {ARVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARVALID} [ipx::get_port_maps ARVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RREADY} [ipx::get_port_maps RREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {AWREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_AWREADY} [ipx::get_port_maps AWREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WREADY} [ipx::get_port_maps WREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {BRESP} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_BRESP} [ipx::get_port_maps BRESP -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {BVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_BVALID} [ipx::get_port_maps BVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {ARREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARREADY} [ipx::get_port_maps ARREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RDATA} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RDATA} [ipx::get_port_maps RDATA -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RRESP} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RRESP} [ipx::get_port_maps RRESP -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RVALID} [ipx::get_port_maps RVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_bus_interface {AXI4_Lite_signal_clock} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:clock_rtl:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:clock:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
ipx::add_port_map {CLK} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ACLK} [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_interface {AXI4_Lite_signal_reset} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:reset_rtl:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:reset:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
ipx::add_port_map {RST} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARESETN} [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_BUSIF} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property value {AXI4_Lite} [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_RESET} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property value {AXI4_Lite_ARESETN} [ipx::get_bus_parameters ASSOCIATED_RESET -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {POLARITY} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
set_property value {ACTIVE_LOW} [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]]
ipx::add_memory_map {AXI4_Lite} [ipx::current_core]
set_property slave_memory_map_ref {AXI4_Lite} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
ipx::add_address_block {reg0} [ipx::get_memory_maps AXI4_Lite -of_objects [ipx::current_core]]
set_property range {65536} [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps AXI4_Lite -of_objects [ipx::current_core]]]

# AXI4-Stream Master
ipx::add_bus_interface {AXI4_Stream_Master} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:axis_rtl:1.0} [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:axis:1.0} [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]
set_property interface_mode {master} [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]
ipx::add_port_map {TREADY} [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Master_TREADY} [ipx::get_port_maps TREADY -of_objects [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TDATA} [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Master_TDATA} [ipx::get_port_maps TDATA -of_objects [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TVALID} [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Master_TVALID} [ipx::get_port_maps TVALID -of_objects [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TLAST} [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Master_TLAST} [ipx::get_port_maps TLAST -of_objects [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TUSER} [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Master_TUSER} [ipx::get_port_maps TUSER -of_objects [ipx::get_bus_interfaces AXI4_Stream_Master -of_objects [ipx::current_core]]]

# AXI4-Stream Real Slave
ipx::add_bus_interface {AXI4_Stream_Real_Slave} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:axis_rtl:1.0} [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:axis:1.0} [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]
set_property interface_mode {slave} [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]
ipx::add_port_map {TDATA} [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Real_Slave_TDATA} [ipx::get_port_maps TDATA -of_objects [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TVALID} [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Real_Slave_TVALID} [ipx::get_port_maps TVALID -of_objects [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TLAST} [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Real_Slave_TLAST} [ipx::get_port_maps TLAST -of_objects [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TUSER} [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Real_Slave_TUSER} [ipx::get_port_maps TUSER -of_objects [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TREADY} [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Real_Slave_TREADY} [ipx::get_port_maps TREADY -of_objects [ipx::get_bus_interfaces AXI4_Stream_Real_Slave -of_objects [ipx::current_core]]]

# AXI4-Stream Imag Slave
ipx::add_bus_interface {AXI4_Stream_Imag_Slave} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:axis_rtl:1.0} [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:axis:1.0} [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]
set_property interface_mode {slave} [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]
ipx::add_port_map {TDATA} [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Imag_Slave_TDATA} [ipx::get_port_maps TDATA -of_objects [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TVALID} [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Imag_Slave_TVALID} [ipx::get_port_maps TVALID -of_objects [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TLAST} [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Imag_Slave_TLAST} [ipx::get_port_maps TLAST -of_objects [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TUSER} [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Imag_Slave_TUSER} [ipx::get_port_maps TUSER -of_objects [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TREADY} [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Imag_Slave_TREADY} [ipx::get_port_maps TREADY -of_objects [ipx::get_bus_interfaces AXI4_Stream_Imag_Slave -of_objects [ipx::current_core]]]


# Add IP clock and reset definition
ipx::add_bus_interface {IPCORE_CLK} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:clock_rtl:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:clock:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
ipx::add_port_map {CLK} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_CLK} [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_interface {IPCORE_RESETN} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:reset_rtl:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:reset:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
ipx::add_port_map {RST} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_RESETN} [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_RESET} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property value {IPCORE_RESETN} [ipx::get_bus_parameters ASSOCIATED_RESET -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {POLARITY} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property value {ACTIVE_LOW} [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_BUSIF} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property value {AXI4_Stream_Master:AXI4_Stream_Real_Slave:AXI4_Stream_Imag_Slave} [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]


# Add report files
ipx::add_file_group -type {product_guide} {} [ipx::current_core]
ipx::add_file {doc/doc_arch_axi4_lite_stream.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/doc_arch_axi4_lite_stream.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/free_running.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/free_running.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/mw_spectrumanalyser_ip_core_report.html} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{html}} [ipx::get_files {doc/mw_spectrumanalyser_ip_core_report.html} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]

# Add C files
ipx::add_file_group -type {misc} {} [ipx::current_core]
ipx::add_file {include/mw_spectrumanalyser_addr.h} [ipx::get_file_groups xilinx_miscfiles -of_objects [ipx::current_core]]
set_property type {{cSource}} [ipx::get_files {include/mw_spectrumanalyser_addr.h} -of_objects [ipx::get_file_groups xilinx_miscfiles -of_objects [ipx::current_core]]]
ipx::create_xgui_files [ipx::current_core]
ipx::check_integrity -quiet [ipx::current_core]
ipx::save_core [ipx::current_core]

# Package IP
ipx::archive_core {../mw_spectrumanalyser_v1_0.zip} [ipx::current_core]
close_project
exit
