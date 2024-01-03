#include "fir.h"
#include "../../firmware/defs.h"

#ifdef ORIGINAL_FIR
void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	
	//initial your fir
	for (int i = 0;i < N;++i){
		inputbuffer[i] = 0;
	}
	for (int i = 0;i < L;++i){
		outputsignal[i] = 0;
	}
	
}
#endif


int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir() {
#ifdef HARDWARE_FIR
	*DMA_IN_BASED_ADDR = inputsignal;
	*DMA_IN_DATA_LENGTH = L;
	*DMA_OUT_BASED_ADDR = outputsignal;
	*DMA_OUT_DATA_LENGTH = L;

	volatile uint32_t* p = FIR_TAP_BEGIN;
	for(int i = 0 ; i < N ; i ++){
		*(p++) = taps[i];
	}
	
	*DMA_IN_AP_CTRL = 1;
	*DMA_OUT_AP_CTRL = 1;
	
	reg_mprj_datal = 0xBBBB0000; // timer start
	*FIR_AP_CTRL = 1;
	while(((*DMA_OUT_AP_CTRL) & 0x00000002) == 0x00000000);
	reg_mprj_datal = 0xBBFF0000; // timer end
#endif

#ifdef MODIFIED_FIR
	int tmp;
	reg_mprj_datal = 0xBBBB0000;
	for (int i = 0; i < L; i++)
	{	
		tmp = 0;
		for (int j = 0; j < N; j++)
		{
			if ((i - j) >= 0)
			{
				tmp += inputsignal[i - j] * taps[j];
			}
		}
		outputsignal[i] = tmp;
	}
	reg_mprj_datal = 0xBBFF0000;
#endif

	
#ifdef ORIGINAL_FIR
	//write down your fir
	initfir();
	for (int i = 0;i < L;++i){
		int acc = 0;
		// shift register
		for (int j = N - 1;j >= 1;--j) {
			inputbuffer[j] = inputbuffer[j - 1];
		}
		inputbuffer[0] = inputsignal[i];
		// fir convolution
		for (int j = 0;j < N;++j){
			acc += taps[j] * inputbuffer[j];
		}
		outputsignal[i] = acc;
	}
#endif

	return outputsignal;
}
