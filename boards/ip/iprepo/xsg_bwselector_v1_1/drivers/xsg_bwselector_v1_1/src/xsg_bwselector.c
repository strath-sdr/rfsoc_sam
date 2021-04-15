#include "xsg_bwselector.h"
#ifndef __linux__
int xsg_bwselector_CfgInitialize(xsg_bwselector *InstancePtr, xsg_bwselector_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->xsg_bwselector_BaseAddress = ConfigPtr->xsg_bwselector_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void xsg_bwselector_s_axi_decimation_write(xsg_bwselector *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    xsg_bwselector_WriteReg(InstancePtr->xsg_bwselector_BaseAddress, 0, Data);
}
u32 xsg_bwselector_s_axi_decimation_read(xsg_bwselector *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = xsg_bwselector_ReadReg(InstancePtr->xsg_bwselector_BaseAddress, 0);
    return Data;
}
