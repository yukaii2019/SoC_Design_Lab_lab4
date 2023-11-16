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

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32,
    parameter DELAYS=10
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wire wb_clk_i,
    input wire wb_rst_i,
    input wire wbs_stb_i,
    input wire wbs_cyc_i,
    input wire wbs_we_i,
    input wire [3:0] wbs_sel_i,
    input wire [31:0] wbs_dat_i,
    input wire [31:0] wbs_adr_i,
    output wire wbs_ack_o,
    output wire [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  wire [127:0] la_data_in,
    output wire [127:0] la_data_out,
    input  wire [127:0] la_oenb,

    // IOs
    input  wire [32-1:0] io_in,
    output wire [32-1:0] io_out,
    output wire [32-1:0] io_oeb,

    // IRQ
    output wire [2:0] irq
);
    localparam
        IDLE    =   0,
        RESET   =   1,
        DATA_I  =   2;
    //------------------- register ----------------------//
    reg [1:0] stt_c, stt_n;
    reg [3:0] cnt_r;
    //--------------------- wire -----------------------//
    wire EN_0;
    wire WE_0;
    wire [31:0] Di_0;
    wire [31:0] Do_0;
    wire [31:0] A_0;
    wire valid;
    // wire clk;
    // wire rst;

    // wire [`MPRJ_IO_PADS-1:0] io_in;
    // wire [`MPRJ_IO_PADS-1:0] io_out;
    // wire [`MPRJ_IO_PADS-1:0] io_oeb;
    //---------------------assign-----------------------//
    assign wbs_ack_o = (cnt_r == DELAYS)? 1 : 0;
    assign WE_0 = wbs_we_i;
    assign EN_0 = valid;
    assign Di_0 = wbs_dat_i;
    assign A_0 = wbs_adr_i;
    assign wbs_dat_o = Do_0;
    assign valid = (wbs_cyc_i & wbs_stb_i & (wbs_adr_i[31-:8] == 8'h38)); 
    //---------------------BRAM------------------------//
    bram user_bram (
        .CLK(wb_clk_i),
        .WE0({4{WE_0}}),
        .EN0(EN_0),
        .Di0(Di_0),
        .Do0(Do_0),
        .A0(A_0)
    );
   
    //---------------------counter-----------------------//
    always@(posedge wb_clk_i)begin
        if(stt_c == DATA_I)begin
            cnt_r <= cnt_r + 1;
        end
        else begin
            cnt_r <= 0;
        end
    end
    //---------------------FSM-----------------------//
    always@(*)begin
        case(stt_c)
        RESET:begin 
            stt_n = (wb_rst_i)? RESET : IDLE;
        end
        IDLE:begin
            stt_n = (valid)? DATA_I : IDLE;
        end
        DATA_I:begin
            stt_n = (cnt_r == DELAYS)? IDLE : DATA_I;
        end
        default:begin
            stt_n = IDLE;
        end
        endcase
    end
    always@(posedge wb_clk_i)begin
        if(wb_rst_i)begin
            stt_c <= RESET;
        end
        else begin
            stt_c <= stt_n;
        end
    end

endmodule



`default_nettype wire
