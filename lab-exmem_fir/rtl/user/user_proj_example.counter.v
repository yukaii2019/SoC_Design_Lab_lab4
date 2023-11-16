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

    // IRQ
    output [2:0] irq
);
    // wire clk;
    // wire rst;
    // wire [`MPRJ_IO_PADS-1:0] io_in;
    // wire [`MPRJ_IO_PADS-1:0] io_out;
    // wire [`MPRJ_IO_PADS-1:0] io_oeb;

    localparam
        IDLE                  = 2'd0,
        DATA                  = 2'd1,
        RESET                 = 2'd2;
    

    wire valid;
    reg [2-1:0] state_r, state_w;
    reg [4-1:0] cnt_r;

    wire WE0;
    wire EN0;
    wire [31:0] Di0;
    wire [31:0] A0;

    wire [31:0] Do0;

    // reg [31:0] Do0_r;
    // reg Do_en;



    assign valid = wbs_cyc_i & wbs_stb_i & (wbs_adr_i[31-:8] == 8'h38); 

    /*================== Bram signals =======================*/
    assign WE0 = wbs_we_i;
    //assign EN0 = valid & (state_r == IDLE);
    assign EN0 = valid;
    assign Di0 = wbs_dat_i;
    assign A0  = wbs_adr_i;     
    // always@(posedge wb_clk_i)begin
    //     Do_en <= EN0 & ~WE0; 
    //     Do0_r <= (Do_en)? Do0 : Do0_r;
    // end
    // assign wbs_dat_o = Do0_r;
    assign wbs_dat_o = Do0;

    /*================== Bram signals =======================*/
    // always@(posedge wb_clk_i)begin
    //     if(state_r == IDLE)begin
    //         if(valid)begin
    //             WE0 <= wbs_we_i;
    //             EN0 <= 1'b1;
    //             Di0 <= wbs_dat_i;
    //             A0  <= wbs_adr_i; 
    //         end
    //     end
    //     else begin
    //         WE0 <= 1'b0;
    //         EN0 <= 1'b0; 
    //     end
    // end

    /*================== FSM =======================*/
    always@(posedge wb_clk_i)begin
        if(wb_rst_i)begin
            state_r <= RESET;
        end
        else begin
            state_r <= state_w;
        end
    end

    always@(*)begin
        case(state_r)
            IDLE:begin
                state_w = (valid) ? DATA : IDLE;
            end
            DATA:begin
                state_w = (cnt_r == DELAYS) ? IDLE : DATA;
            end
            default:begin
                state_w = IDLE;
            end
        endcase
    end


    /*================= counter -----------------------*/
    always@(posedge wb_clk_i)begin
        if(state_r == DATA)begin
            cnt_r   <= cnt_r + 1;
        end
        else begin
            cnt_r <= 0;
        end
    end 
    assign wbs_ack_o = (cnt_r == DELAYS);


    bram user_bram (
        .CLK(wb_clk_i),
        .WE0({4{WE0}}),
        .EN0(EN0),
        .Di0(Di0),
        .Do0(Do0),
        .A0(A0)
    );

endmodule


`default_nettype wire
