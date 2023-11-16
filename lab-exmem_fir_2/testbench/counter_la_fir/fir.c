#include "fir.h"

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial your fir
	//int i = 0;
	for (int i = 0; i < N; i++)
	{
		outputsignal[i] = 0;
	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	//write down your fir
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
		{
			if ((i - j) >= 0)
			{
				outputsignal[i] = outputsignal[i] + inputsignal[i - j] * taps[j];
			}
		}
	}
	return outputsignal;
}
		
