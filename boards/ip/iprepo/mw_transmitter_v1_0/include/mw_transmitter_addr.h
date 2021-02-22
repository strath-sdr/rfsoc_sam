/*
 * File Name:         hdl_prj\ipcore\mw_transmitter_v1_0\include\mw_transmitter_addr.h
 * Description:       C Header File
 * Created:           2020-12-16 17:01:21
*/

#ifndef MW_TRANSMITTER_H_
#define MW_TRANSMITTER_H_

#define  IPCore_Reset_mw_transmitter                           0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_mw_transmitter                          0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_PacketSize_AXI4_Stream_Master_mw_transmitter   0x8  //Packet size for AXI4-Stream Master interface, the default value is 1024. The TLAST output signal of the AXI4-Stream Master interface is generated based on the packet size.
#define  IPCore_Timestamp_mw_transmitter                       0xC  //contains unique IP timestamp (yymmddHHMM): 2012161701
#define  Enable_Data_mw_transmitter                            0x100  //data register for Inport Enable
#define  Value_Data_mw_transmitter                             0x104  //data register for Inport Value

#endif /* MW_TRANSMITTER_H_ */
