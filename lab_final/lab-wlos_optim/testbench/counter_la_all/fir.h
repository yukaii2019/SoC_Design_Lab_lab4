#ifndef __FIR_H__
#define __FIR_H__

#define N 11
#define L 64


#ifndef MODIFIED_FIR
#define HARDWARE_FIR
#endif
// #define ORIGINAL_FIR
// #define MODIFIED_FIR
// #define HARDWARE_FIR

typedef long unsigned int uint32_t;

#ifdef HARDWARE_FIR

#define UART_CONTROL_BASE      ((volatile uint32_t*) 0x30000000) 

#define DMA_IN_CONTROL_BASE    ((volatile uint32_t*) 0x31000000)
#define DMA_IN_AP_CTRL         ((volatile uint32_t*) 0x31000000)
#define DMA_IN_BASED_ADDR      ((volatile uint32_t*) 0x31000010)
#define DMA_IN_DATA_LENGTH     ((volatile uint32_t*) 0x31000020)

#define DMA_OUT_CONTROL_BASE    ((volatile uint32_t*) 0x32000000)
#define DMA_OUT_AP_CTRL         ((volatile uint32_t*) 0x32000000)
#define DMA_OUT_BASED_ADDR      ((volatile uint32_t*) 0x32000010)
#define DMA_OUT_DATA_LENGTH     ((volatile uint32_t*) 0x32000020)

#define FIR_CONTROL_BASE       ((volatile uint32_t*) 0x34000000)
#define FIR_AP_CTRL            ((volatile uint32_t*) 0x34000020)
#define FIR_TAP_BEGIN          ((volatile uint32_t*) 0x34000040)
#define FIR_TAP_END            ((volatile uint32_t*) 0x3400006C)

#define SDRAM_CONTROL_BASE     ((volatile uint32_t*) 0x38000000)

#endif




int taps[N] = {0,-10,-9,23,56,63,56,23,-9,-10,0};

#ifdef ORIGINAL_FIR
int inputbuffer[N];
#endif

int inputsignal[L] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,\
                      16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,\
                      31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,\
                      46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,\
                      61,62,63,64};
int outputsignal[L];
#endif
