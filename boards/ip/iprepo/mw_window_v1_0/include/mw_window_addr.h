/*
 * File Name:         hdl_prj\ipcore\mw_window_v1_0\include\mw_window_addr.h
 * Description:       C Header File
 * Created:           2020-12-24 09:34:25
*/

#ifndef MW_WINDOW_H_
#define MW_WINDOW_H_

#define  IPCore_Reset_mw_window              0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_mw_window             0x4  //enabled (by default) when bit 0 is 0x1
#define  AXI4_Master_Rd_BaseAddr_mw_window   0x8  //Base Address offset for AXI4 Master Read
#define  IPCore_Timestamp_mw_window          0xC  //contains unique IP timestamp (yymmddHHMM): 2012240934
#define  Length_Data_mw_window               0x100  //data register for Inport Length
#define  Address_Data_mw_window              0x104  //data register for Inport Address
#define  Enable_Data_mw_window               0x108  //data register for Inport Enable
#define  dma_ready_Data_mw_window            0x10C  //data register for Outport dma_ready

#endif /* MW_WINDOW_H_ */
