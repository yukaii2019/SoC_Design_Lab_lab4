#ifndef _MATMUL_H
#define _MATMUL_H

#define SIZE 4

#ifndef ORIGINAL_MATMUL
#define HARDWARE_MATMUL
#endif


typedef long unsigned int uint32_t;

#ifdef HARDWARE_MATMUL

#define TRANSPOSE

#define UART_CONTROL_BASE      ((volatile uint32_t*) 0x30000000) 

#define MM_AP_CTRL             ((volatile uint32_t*) 0x35000000)
#define MM_A_BASE              ((volatile uint32_t*) 0x35000010)
#define MM_B_BASE              ((volatile uint32_t*) 0x35000014)
#define MM_C_BASE              ((volatile uint32_t*) 0x35000018)
#define MM_SIZE                ((volatile uint32_t*) 0x35000020)

#define SDRAM_CONTROL_BASE     ((volatile uint32_t*) 0x38000000)

#endif


int A[SIZE*SIZE] = {0, 1, 2, 3,
					0, 1, 2, 3,
					0, 1, 2, 3,
					0, 1, 2, 3,};
#ifdef TRANSPOSE
int B[SIZE*SIZE] = {1, 5, 9, 13,
					2, 6, 10, 14,
					3, 7, 11, 15,
					4, 8, 12, 16,};
#else
int B[SIZE*SIZE] = {1, 2, 3, 4,
					5, 6, 7, 8,
					9, 10, 11, 12,
					13, 14, 15, 16,};
#endif

int result[SIZE*SIZE];
#endif
