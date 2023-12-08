vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/blk_mem_gen_v8_4_5
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_12
vlib questa_lib/msim/processing_system7_vip_v1_0_14
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_26
vlib questa_lib/msim/fifo_generator_v13_2_7
vlib questa_lib/msim/axi_data_fifo_v2_1_25
vlib questa_lib/msim/axi_crossbar_v2_1_27
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/axi_uartlite_v2_0_30
vlib questa_lib/msim/axi_intc_v4_1_17
vlib questa_lib/msim/xlslice_v1_0_2
vlib questa_lib/msim/xlconstant_v1_1_7
vlib questa_lib/msim/xlconcat_v2_1_4
vlib questa_lib/msim/axi_protocol_converter_v2_1_26
vlib questa_lib/msim/axi_clock_converter_v2_1_25
vlib questa_lib/msim/axi_dwidth_converter_v2_1_26

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap blk_mem_gen_v8_4_5 questa_lib/msim/blk_mem_gen_v8_4_5
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_12 questa_lib/msim/axi_vip_v1_1_12
vmap processing_system7_vip_v1_0_14 questa_lib/msim/processing_system7_vip_v1_0_14
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_26 questa_lib/msim/axi_register_slice_v2_1_26
vmap fifo_generator_v13_2_7 questa_lib/msim/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_25 questa_lib/msim/axi_data_fifo_v2_1_25
vmap axi_crossbar_v2_1_27 questa_lib/msim/axi_crossbar_v2_1_27
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_30 questa_lib/msim/axi_uartlite_v2_0_30
vmap axi_intc_v4_1_17 questa_lib/msim/axi_intc_v4_1_17
vmap xlslice_v1_0_2 questa_lib/msim/xlslice_v1_0_2
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7
vmap xlconcat_v2_1_4 questa_lib/msim/xlconcat_v2_1_4
vmap axi_protocol_converter_v2_1_26 questa_lib/msim/axi_protocol_converter_v2_1_26
vmap axi_clock_converter_v2_1_25 questa_lib/msim/axi_clock_converter_v2_1_25
vmap axi_dwidth_converter_v2_1_26 questa_lib/msim/axi_dwidth_converter_v2_1_26

vlog -work xilinx_vip -64 -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_5 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
"../../../bd/design_1/ip/design_1_caravel_0_0/sim/design_1_caravel_0_0.v" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/13ea/hdl/verilog/caravel_ps_control_s_axi.v" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/13ea/hdl/verilog/caravel_ps.v" \
"../../../bd/design_1/ip/design_1_caravel_ps_0_0/sim/design_1_caravel_ps_0_0.v" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/9bff/hdl/verilog/output_pin_control_s_axi.v" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/9bff/hdl/verilog/output_pin.v" \
"../../../bd/design_1/ip/design_1_output_pin_0_0/sim/design_1_output_pin_0_0.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_12 -64 -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/1033/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_14 -64 -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_26 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/0a3f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -64 -93 \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_25 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5390/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_27 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/3fa0/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/aab2/hdl/verilog/read_romcode_BUS0_m_axi.v" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/aab2/hdl/verilog/read_romcode_control_s_axi.v" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/aab2/hdl/verilog/read_romcode_flow_control_loop_pipe_sequential_init.v" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/aab2/hdl/verilog/read_romcode_read_romcode_Pipeline_VITIS_LOOP_31_1.v" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/aab2/hdl/verilog/read_romcode.v" \
"../../../bd/design_1/ip/design_1_read_romcode_0_0/sim/design_1_read_romcode_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_rst_ps7_0_10M_0/sim/design_1_rst_ps7_0_10M_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_spiflash_0_0/sim/design_1_spiflash_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_30 -64 -93 \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5d2b/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_axi_uartlite_0_0/sim/design_1_axi_uartlite_0_0.vhd" \

vcom -work axi_intc_v4_1_17 -64 -93 \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/802b/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_axi_intc_0_0/sim/design_1_axi_intc_0_0.vhd" \

vlog -work xlslice_v1_0_2 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xlslice_0_0/sim/design_1_xlslice_0_0.v" \

vlog -work xlconstant_v1_1_7 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/ip/design_1_xlslice_1_0/sim/design_1_xlslice_1_0.v" \

vlog -work xlconcat_v2_1_4 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xlconcat_1_0/sim/design_1_xlconcat_1_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_1_1/sim/design_1_xlconstant_1_1.v" \
"../../../bd/design_1/ip/design_1_xlconstant_2_0/sim/design_1_xlconstant_2_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_3_0/sim/design_1_xlconstant_3_0.v" \

vlog -work axi_protocol_converter_v2_1_26 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/90c8/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \

vlog -work axi_clock_converter_v2_1_25 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/e893/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work axi_dwidth_converter_v2_1_26 -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/b3c7/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/5765/hdl" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/drivers/caravel_ps_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_output_pin_0_0/drivers/output_pin_v0_0/src" "+incdir+../../../../vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/drivers/read_romcode_v0_0/src" "+incdir+/opt/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_us_0/sim/design_1_auto_us_0.v" \
"../../../bd/design_1/ip/design_1_auto_pc_1/sim/design_1_auto_pc_1.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

