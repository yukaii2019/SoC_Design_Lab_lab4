#include "matmul.h"
#include "../../firmware/defs.h"

int* __attribute__ ( ( section ( ".mprjram" ) ) ) matmul()
{	
	#ifdef ORIGINAL_MATMUL
	reg_mprj_datal = 0xAAAA0000;
	int i=0;
	int j;
	int k;
	int sum;
	int kk;
	unsigned int count = 0;
	for (i=0; i<SIZE; i++){
		for (j=0; j<SIZE; j++){
			sum = 0;
			for(k = 0;k<SIZE;k++)
				sum += A[(i*SIZE) + k] * B[(k*SIZE) + j];
			result[(i*SIZE) + j] = sum;
		}
	}
	reg_mprj_datal = 0xAAFF0000;
	#endif

	#ifdef HARDWARE_MATMUL
	*MM_A_BASE = A;
	*MM_B_BASE = B;
	*MM_C_BASE = result;
	*MM_SIZE = SIZE;

	reg_mprj_datal = 0xAAAA0000;
	*MM_AP_CTRL = 1;

	while(((*MM_AP_CTRL) & 0x00000002) == 0x00000000);
	reg_mprj_datal = 0xAAFF0000;
	#endif

	return result;
}



