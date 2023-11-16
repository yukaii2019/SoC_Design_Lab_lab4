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


    wire                        awready;
    wire                        wready;
    wire                         awvalid;
    wire [(12-1): 0]             awaddr;
    wire                         wvalid;
    wire [(BITS-1) : 0]          wdata;


    wire                        arready;
    wire                        rready;
    wire                        arvalid;
    wire [(12-1): 0]            araddr;
    wire                        rvalid;
    wire [(BITS-1): 0]          rdata;


    wire                        ss_tvalid;
    wire [(BITS-1) : 0]         ss_tdata;
    wire                        ss_tlast;
    wire                        ss_tready;
    wire                        sm_tready;
    wire                        sm_tvalid;
    wire [(BITS-1) : 0]         sm_tdata;
    wire                        sm_tlast;


// ram for tap
    wire [3:0]               tap_WE;
    wire                     tap_EN;
    wire [(BITS-1):0]        tap_Di;
    wire [(12-1):0]          tap_A;
    wire [(BITS-1):0]        tap_Do;

// ram for data RAM
    wire [3:0]               data_WE;
    wire                     data_EN;
    wire [(BITS-1):0]        data_Di;
    wire [(12-1):0]          data_A;
    wire [(BITS-1):0]        data_Do;

    wire wbs_ack_fir_o;
    wire [31:0] wbs_dat_fir_o;
    wire wbs_ack_bram_o;
    wire [31:0] wbs_dat_bram_o;

    // always@(*)begin
    //     if(wbs_adr_i[31-:8] == 8'b30)begin
    //         wbs_ack_o = wbs_ack_fir_o;
    //         wbs_dat_o = wbs_dat_fir_o; 
    //     end
    //     else begin
    //         wbs_ack_o = wbs_ack_bram_o;
    //         wbs_dat_o = wbs_dat_bram_o; 
    //     end
    // end
    assign wbs_ack_o = (wbs_adr_i[31-:8] == 8'h30) ? wbs_ack_fir_o : wbs_ack_bram_o;
    assign wbs_dat_o = (wbs_adr_i[31-:8] == 8'h30) ? wbs_dat_fir_o : wbs_dat_bram_o;

    // assign wbs_ack_o = wbs_ack_bram_o;
    // assign wbs_dat_o = wbs_dat_bram_o;
    
    
    bram11 #(
        .ADDR_WIDTH(12),
        .SIZE(11),
        .BIT_WIDTH(BITS)
    )
    tap_RAM(
        .clk(wb_clk_i), 
        .we(tap_WE[0]),
        .re(1'b1), 
        .waddr({2'b0, tap_A[11:2]}), 
        .raddr({2'b0, tap_A[11:2]}), 
        .wdi(tap_Di),
        .rdo(tap_Do)
    );

    bram11 #(
        .ADDR_WIDTH(12),
        .SIZE(11),
        .BIT_WIDTH(BITS)
    )
    DATA_RAM(
        .clk(wb_clk_i), 
        .we(data_WE[0]),
        .re(1'b1), 
        .waddr({2'b0, data_A[11:2]}), 
        .raddr({2'b0, data_A[11:2]}), 
        .wdi(data_Di),
        .rdo(data_Do)
    );


    fir #(  
        .pADDR_WIDTH(12),
        .pDATA_WIDTH(BITS),
        .Tape_Num(11)
    )
    fir_U0(
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wdata(wdata),
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(araddr),
        .rvalid(rvalid),
        .rdata(rdata),


        // axi_stream ports
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tlast(ss_tlast),
        .ss_tready(ss_tready),
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),
        .sm_tlast(sm_tlast),

        // ram for tap
        .tap_WE(tap_WE),
        .tap_EN(tap_EN),
        .tap_Di(tap_Di),
        .tap_A(tap_A),
        .tap_Do(tap_Do),

        // ram for data
        .data_WE(data_WE),
        .data_EN(data_EN),
        .data_Di(data_Di),
        .data_A(data_A),
        .data_Do(data_Do),

        .axis_clk(wb_clk_i),
        .axis_rst(wb_rst_i)
        );


    wb_to_axi wb_to_axi_U0(
        .clk(wb_clk_i),
        .rst(wb_rst_i),

         // Wishbone Slave ports (WB MI A)
        .wbs_stb_i(wbs_cyc_i),
        .wbs_cyc_i(wbs_stb_i),
        .wbs_we_i (wbs_we_i),
        .wbs_sel_i(wbs_sel_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_adr_i(wbs_adr_i),


        .wbs_ack_o(wbs_ack_fir_o),
        .wbs_dat_o(wbs_dat_fir_o),

        // axi_lite master ports
        .awvalid(awvalid),
        .awaddr (awaddr),
        .wvalid(wvalid),
        .wdata (wdata),

        .arvalid(arvalid),
        .araddr(araddr),
        .rready(rready),

        .awready(awready),
        .wready (wready),
        .arready(arready),

        .rvalid(rvalid),
        .rdata(rdata),

        // axi_stream ports
        .ss_tvalid(ss_tvalid), 
        .ss_tdata (ss_tdata), 
        .ss_tlast (ss_tlast), 
        .ss_tready(ss_tready), 

        .sm_tready(sm_tready), 
        .sm_tvalid(sm_tvalid), 
        .sm_tdata (sm_tdata), 
        .sm_tlast (sm_tlast)


    );


    user_bram_control #(
        .BITS(BITS),
        .DELAYS(DELAYS)
    )user_bram_control_U0(
        // Wishbone Slave ports (WB MI A)
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wbs_stb_i(wbs_stb_i),
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_we_i(wbs_we_i),

        .wbs_sel_i(wbs_sel_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_adr_i(wbs_adr_i),
        
        .wbs_ack_o(wbs_ack_bram_o),
        .wbs_dat_o(wbs_dat_bram_o),

        // Logic Analyzer Signals
        .la_data_in(la_data_in),
        .la_data_out(la_data_out),
        .la_oenb(la_oenb),

        // IOs
        .io_in(io_in),
        .io_out(io_out),
        .io_oeb(io_oeb),

        // IRQ
        .irq(irq)
    );

endmodule
`default_nettype wire
