#include "fir.h"
#include "../../firmware/defs.h"

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	*reg_fir_XferLength = L;       // send Xferlength
	volatile uint32_t* p = reg_fir_taps;
	for(int i = 0 ; i < N ; i ++){
		*(p++) = taps[i];          // send taps
	}
	reg_mprj_datal = 0x00A50000;   // tell tb to start the timer
	*reg_fir_control = 0x00000001; // send ap_start
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	for(int i = 0; i < L; i++)  {
		*reg_fir_x = i; 				// send x[n] to FIR 
		outputsignal[i] = *reg_fir_y;	// receive y[n] from FIR
 	}
	// tell tb to stop the timer
 	reg_mprj_datal = 0x005A0000 + ((outputsignal[L-1] & 0x000000FF) << 24); 
	
	// check if the fir output is correct
	for(int i = 0; i < L; i++)  {
    	reg_mprj_datal = outputsignal[i] << 16;
 	}

	return outputsignal;
}
		
