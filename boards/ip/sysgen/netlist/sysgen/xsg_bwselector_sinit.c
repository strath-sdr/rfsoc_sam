/**
* @file xsg_bwselector_sinit.c
*
* The implementation of the xsg_bwselector driver's static initialzation
* functionality.
*
* @note
*
* None
*
*/
#ifndef __linux__
#include "xstatus.h"
#include "xparameters.h"
#include "xsg_bwselector.h"
extern xsg_bwselector_Config xsg_bwselector_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type xsg_bwselector_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
xsg_bwselector_Config *xsg_bwselector_LookupConfig(u16 DeviceId) {
    xsg_bwselector_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_XSG_BWSELECTOR_NUM_INSTANCES; Index++) {
        if (xsg_bwselector_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &xsg_bwselector_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int xsg_bwselector_Initialize(xsg_bwselector *InstancePtr, u16 DeviceId) {
    xsg_bwselector_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = xsg_bwselector_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return xsg_bwselector_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
