/*
 * File Name:         hdl_prj\ipcore\mw_autodma_v1_0\include\mw_autodma_addr.h
 * Description:       C Header File
 * Created:           2020-12-16 17:10:11
*/

#ifndef MW_AUTODMA_H_
#define MW_AUTODMA_H_

#define  IPCore_Reset_mw_autodma              0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_mw_autodma             0x4  //enabled (by default) when bit 0 is 0x1
#define  AXI4_Master_Wr_BaseAddr_mw_autodma   0x8  //Base Address offset for AXI4 Master Write
#define  IPCore_Timestamp_mw_autodma          0xC  //contains unique IP timestamp (yymmddHHMM): 2012161710
#define  Length_Data_mw_autodma               0x100  //data register for Inport Length
#define  Buffer_Address_1_Data_mw_autodma     0x104  //data register for Inport Buffer Address 1
#define  Buffer_Address_2_Data_mw_autodma     0x108  //data register for Inport Buffer Address 2
#define  Buffer_Address_3_Data_mw_autodma     0x10C  //data register for Inport Buffer Address 3
#define  Enable_Data_mw_autodma               0x110  //data register for Inport Enable
#define  Count_Data_mw_autodma                0x114  //data register for Inport Count
#define  Buffer_Pointer_Data_mw_autodma       0x124  //data register for Outport Buffer Pointer
#define  DMA_Status_Data_mw_autodma           0x128  //data register for Outport DMA Status

#endif /* MW_AUTODMA_H_ */
