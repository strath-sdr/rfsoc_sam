/*
 * File Name:         hdl_prj\ipcore\mw_ssrconverter_v1_0\include\mw_ssrconverter_addr.h
 * Description:       C Header File
 * Created:           2020-12-22 10:57:23
*/

#ifndef MW_SSRCONVERTER_H_
#define MW_SSRCONVERTER_H_

#define  IPCore_Reset_mw_ssrconverter       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_mw_ssrconverter      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_mw_ssrconverter   0x8  //contains unique IP timestamp (yymmddHHMM): 2012221057
#define  Packet_Size_Data_mw_ssrconverter   0x100  //data register for Inport Packet Size
#define  SSR_Mode_Data_mw_ssrconverter      0x104  //data register for Inport SSR Mode

#endif /* MW_SSRCONVERTER_H_ */
