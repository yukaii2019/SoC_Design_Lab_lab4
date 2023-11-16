create_clock -period 10.547 -waveform {0.000 5.274} [get_ports -filter { NAME =~  "*clk*" && DIRECTION == "IN" }]
set _xlnx_shared_i0 [get_ports -filter { NAME =~  "*" && DIRECTION == "IN" }]
set_input_delay -clock [get_clocks *] 1.299 $_xlnx_shared_i0
set _xlnx_shared_i1 [get_ports -filter { NAME =~  "*" && DIRECTION == "OUT" }]
set_output_delay -clock [get_clocks *] 1.000 $_xlnx_shared_i1



