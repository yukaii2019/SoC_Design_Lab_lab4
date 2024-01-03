# SoC Final Project

## USER DESIGN FILES
```
design source:
./rtl/user/user_project_wrapper.v
./rtl/user/my_user_proj_example.counter.v
./rtl/user/my_sdram_controller.v
./rtl/user/sdr.v
./rtl/user/arbiter.v
./rtl/user/dma_in.v
./rtl/user/dma_out.v
./rtl/user/fir_new.v
./rtl/user/mm_new.v
./rtl/user/uart.v
./rtl/user/uart_tx.v
./rtl/user/uart_rx.v 
./rtl/user/uart_ctrl.v

design testbench files:
testbench/test_arbiter.v
testbench/test_dma_in.v
testbench/test_dma_out.v
testbench/test_fir.v
testbench/sdram_controller.v

firmware source: 
testbench/counter_la_all.c
testbench/matmul.c 
testbench/fir.c 
testbench/qsort.c 
testbench/uart.c 
```

## Run iverilog simulation
```sh
cd testbench/counter_la_all
source run_sim # you can add -D MODIFIED_FIR and -D ORIGINAL_MATMUL flag to compile software FIR and MATMUL
```

## Validate the following result is printed
```
$ source run_sim
...
...

LA Test 2 passed
Timer End: QS
MM:         414
FIR:        557
QS:        3564
Total (MM + FIR + QS):        4535
```

## Validate design
```sh
cd testbench/counter_la_all
./run_test_arbiter
./run_test_dma_in
./run_test_dma_out
./run_test_fir
./run_test_sdram_controller
```