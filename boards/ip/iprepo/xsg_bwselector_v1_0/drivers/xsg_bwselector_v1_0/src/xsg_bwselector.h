#ifndef XSG_BWSELECTOR__H
#define XSG_BWSELECTOR__H
#ifdef __cplusplus
extern "C" {
#endif
/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xsg_bwselector_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 xsg_bwselector_BaseAddress;
} xsg_bwselector_Config;
#endif
/**
* The xsg_bwselector driver instance data. The user is required to
* allocate a variable of this type for every xsg_bwselector device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 xsg_bwselector_BaseAddress;
    u32 IsReady;
} xsg_bwselector;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define xsg_bwselector_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define xsg_bwselector_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define xsg_bwselector_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define xsg_bwselector_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif
/************************** Function Prototypes *****************************/
#ifndef __linux__
int xsg_bwselector_Initialize(xsg_bwselector *InstancePtr, u16 DeviceId);
xsg_bwselector_Config* xsg_bwselector_LookupConfig(u16 DeviceId);
int xsg_bwselector_CfgInitialize(xsg_bwselector *InstancePtr, xsg_bwselector_Config *ConfigPtr);
#else
int xsg_bwselector_Initialize(xsg_bwselector *InstancePtr, const char* InstanceName);
int xsg_bwselector_Release(xsg_bwselector *InstancePtr);
#endif
/**
* Write to s_axi_decimation gateway of xsg_bwselector. Assignments are LSB-justified.
*
* @param	InstancePtr is the s_axi_decimation instance to operate on.
* @param	Data is value to be written to gateway s_axi_decimation.
*
* @return	None.
*
* @note    .
*
*/
void xsg_bwselector_s_axi_decimation_write(xsg_bwselector *InstancePtr, u32 Data);
/**
* Read from s_axi_decimation gateway of xsg_bwselector. Assignments are LSB-justified.
*
* @param	InstancePtr is the s_axi_decimation instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 xsg_bwselector_s_axi_decimation_read(xsg_bwselector *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
