# LAB SDRAM

## USER DESIGN FILES
```
./rtl/my_sdram_controller.v
./rtl/user_proj_example.counter.v
```

## Run iverilog simulation
```sh
cd ~/caravel-soc_fpga-lab/lab-sdram/testbench/counter_la
source run_sim
```

## Validate the following result is printed
```
$ ./run_sim
Reading counter_la.hex
counter_la.hex loaded into memory
Memory 5 bytes = 0x6f 0x00 0x00 0x0b 0x13
VCD info: dumpfile counter_la.vcd opened for output.
LA Test 1 started
Start MM matmul()
Call function matmul() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x003e
Call function matmul() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x0044
Call function matmul() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x004a
Call function matmul() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x0050
LA Test 2 passed

```
