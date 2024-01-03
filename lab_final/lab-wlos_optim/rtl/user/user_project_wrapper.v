// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype wire
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

// wire decode_uart;
// wire decode_bram;

// wire wbs_ack_o_uart;
// wire [31:0] wbs_dat_o_uart;
// wire [`MPRJ_IO_PADS-1:0] io_out_uart;
// wire [`MPRJ_IO_PADS-1:0] io_oeb_uart;
// wire [2:0] user_irqs_uart;

// wire wbs_ack_o_bram;
// wire [31:0] wbs_dat_o_bram;
// wire [`MPRJ_IO_PADS-1:0] io_out_bram;
// wire [`MPRJ_IO_PADS-1:0] io_oeb_bram;
// wire [2:0] user_irqs_bram;


// wire wbs_valid;
// assign wbs_valid = wbs_cyc_i && wbs_stb_i; // only for wave debug
// assign decode_uart = (wbs_adr_i[31:20] == 12'h300 && wbs_valid);
// assign decode_bram = (wbs_adr_i[31:20] == 12'h380 && wbs_valid);


// assign wbs_ack_o = (decode_uart) ? wbs_ack_o_uart : (decode_bram) ? wbs_ack_o_bram : 0;
// assign wbs_dat_o = (decode_uart) ? wbs_dat_o_uart : (decode_bram) ? wbs_dat_o_bram : 0;
// assign io_out    = io_out_uart;  // only uart use io and is not related to the wb cycle
// assign io_oeb    = io_oeb_uart;  // only uart use io and is not related to the wb cycle
// assign user_irq  = user_irqs_uart; // only uart has irq and is not related to the wb cycle


user_proj_example mprj (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif

    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    // MGMT SoC Wishbone Slave

    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o),

    // Logic Analyzer

    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb (la_oenb),

    // IO Pads

    .io_in (io_in),
    .io_out(io_out),
    .io_oeb(io_oeb),

    // IRQ
    .irq(user_irq)
);

// uart uart (
// `ifdef USE_POWER_PINS
// 	.vccd1(vccd1),	// User area 1 1.8V power
// 	.vssd1(vssd1),	// User area 1 digital ground
// `endif
//     .wb_clk_i(wb_clk_i),
//     .wb_rst_i(wb_rst_i),

//     // MGMT SoC Wishbone Slave

//     .wbs_stb_i(wbs_stb_i),
//     .wbs_cyc_i(wbs_cyc_i),
//     .wbs_we_i(wbs_we_i),
//     .wbs_sel_i(wbs_sel_i),
//     .wbs_dat_i(wbs_dat_i),
//     .wbs_adr_i(wbs_adr_i),
//     .wbs_ack_o(wbs_ack_o_uart),
//     .wbs_dat_o(wbs_dat_o_uart),

//     // IO ports
//     .io_in  (io_in      ),
//     .io_out (io_out_uart),
//     .io_oeb (io_oeb_uart),

//     // irq
//     .user_irq (user_irqs_uart)
// );

endmodule	// user_project_wrapper

`default_nettype wire
