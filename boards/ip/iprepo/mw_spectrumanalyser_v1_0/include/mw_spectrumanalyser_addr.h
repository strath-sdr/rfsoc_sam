/*
 * File Name:         hdl_prj\ipcore\mw_spectrumanalyser_v1_0\include\mw_spectrumanalyser_addr.h
 * Description:       C Header File
 * Created:           2020-12-23 15:08:57
*/

#ifndef MW_SPECTRUMANALYSER_H_
#define MW_SPECTRUMANALYSER_H_

#define  IPCore_Reset_mw_spectrumanalyser       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_mw_spectrumanalyser      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_mw_spectrumanalyser   0x8  //contains unique IP timestamp (yymmddHHMM): 2012231508
#define  Units_Data_mw_spectrumanalyser         0x100  //data register for Inport Units
#define  Type_Data_mw_spectrumanalyser          0x104  //data register for Inport Type
#define  Vrms_Data_mw_spectrumanalyser          0x108  //data register for Inport Vrms
#define  Type_Scale_Data_mw_spectrumanalyser    0x10C  //data register for Inport Type Scale
#define  Power_Scale_Data_mw_spectrumanalyser   0x110  //data register for Inport Power Scale
#define  Bypass_Data_mw_spectrumanalyser        0x114  //data register for Inport Bypass

#endif /* MW_SPECTRUMANALYSER_H_ */
