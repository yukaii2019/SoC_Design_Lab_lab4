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




    wire clk;
    wire rst, rst_n;
    assign clk = wb_clk_i;
    assign rst = wb_rst_i;
    assign rst_n = ~rst;



    // // IO
    // assign io_out = io_out_uart;
    // assign io_oeb = io_oeb_uart;

    // // IRQ
    // assign irq = user_irqs_uart;


    // sdram interface
    wire        dma_in_m_sdram_s_wbs_stb;
    wire        dma_in_m_sdram_s_wbs_cyc;
    wire        dma_in_m_sdram_s_wbs_we ;
    wire [3:0]  dma_in_m_sdram_s_wbs_sel;
    wire [31:0] dma_in_m_sdram_s_wbs_dat_i;
    wire [31:0] dma_in_m_sdram_s_wbs_adr;
    wire        dma_in_m_sdram_s_wbs_ack;
    wire [31:0] dma_in_m_sdram_s_wbs_dat_o;

    wire        dma_out_m_sdram_s_wbs_stb;
    wire        dma_out_m_sdram_s_wbs_cyc;
    wire        dma_out_m_sdram_s_wbs_we;
    wire [3:0]  dma_out_m_sdram_s_wbs_sel;
    wire [31:0] dma_out_m_sdram_s_wbs_dat_i;
    wire [31:0] dma_out_m_sdram_s_wbs_adr;
    wire        dma_out_m_sdram_s_wbs_ack;
    wire [31:0] dma_out_m_sdram_s_wbs_dat_o;

    wire        mm_m_sdram_s_wbs_stb;
    wire        mm_m_sdram_s_wbs_cyc;
    wire        mm_m_sdram_s_wbs_we;
    wire [3:0]  mm_m_sdram_s_wbs_sel;
    wire [31:0] mm_m_sdram_s_wbs_dat_i;
    wire [31:0] mm_m_sdram_s_wbs_adr;
    wire        mm_m_sdram_s_wbs_ack;
    wire [31:0] mm_m_sdram_s_wbs_dat_o;

    wire        sdram_s_wbs_stb;
    wire        sdram_s_wbs_cyc;
    wire        sdram_s_wbs_we;
    wire [3:0]  sdram_s_wbs_sel;
    wire [31:0] sdram_s_wbs_dat_i;
    wire [31:0] sdram_s_wbs_adr;
    wire        sdram_s_wbs_ack;
    wire [31:0] sdram_s_wbs_dat_o;
    



    // data access from cpu, ack from ip

    reg         cpu_m_dma_in_s_wbs_stb;
    reg         cpu_m_dma_in_s_wbs_cyc;
    reg         cpu_m_dma_in_s_wbs_we;
    reg  [3:0]  cpu_m_dma_in_s_wbs_sel;
    reg  [31:0] cpu_m_dma_in_s_wbs_dat_i;
    reg  [31:0] cpu_m_dma_in_s_wbs_adr;
    wire        cpu_m_dma_in_s_wbs_ack;
    wire [31:0] cpu_m_dma_in_s_wbs_dat_o;

    reg         cpu_m_dma_out_s_wbs_stb;
    reg         cpu_m_dma_out_s_wbs_cyc;
    reg         cpu_m_dma_out_s_wbs_we ;
    reg  [3:0]  cpu_m_dma_out_s_wbs_sel;
    reg  [31:0] cpu_m_dma_out_s_wbs_dat_i;
    reg  [31:0] cpu_m_dma_out_s_wbs_adr;
    wire        cpu_m_dma_out_s_wbs_ack;
    wire [31:0] cpu_m_dma_out_s_wbs_dat_o;

    reg         cpu_m_fir_s_wbs_stb;
    reg         cpu_m_fir_s_wbs_cyc;
    reg         cpu_m_fir_s_wbs_we;
    reg  [3:0]  cpu_m_fir_s_wbs_sel;
    reg  [31:0] cpu_m_fir_s_wbs_dat_i;
    reg  [31:0] cpu_m_fir_s_wbs_adr;
    wire        cpu_m_fir_s_wbs_ack;
    wire [31:0] cpu_m_fir_s_wbs_dat_o;

    reg         cpu_m_mm_s_wbs_stb;
    reg         cpu_m_mm_s_wbs_cyc;
    reg         cpu_m_mm_s_wbs_we;
    reg  [3:0]  cpu_m_mm_s_wbs_sel;
    reg  [31:0] cpu_m_mm_s_wbs_dat_i;
    reg  [31:0] cpu_m_mm_s_wbs_adr;
    wire        cpu_m_mm_s_wbs_ack;
    wire [31:0] cpu_m_mm_s_wbs_dat_o;

    reg         cpu_m_sdram_s_wbs_stb;
    reg         cpu_m_sdram_s_wbs_cyc;
    reg         cpu_m_sdram_s_wbs_we;
    reg  [3:0]  cpu_m_sdram_s_wbs_sel;
    reg  [31:0] cpu_m_sdram_s_wbs_dat_i;
    reg  [31:0] cpu_m_sdram_s_wbs_adr;
    wire        cpu_m_sdram_s_wbs_ack;
    wire [31:0] cpu_m_sdram_s_wbs_dat_o;

    reg         cpu_m_uart_s_wbs_stb;
    reg         cpu_m_uart_s_wbs_cyc;
    reg         cpu_m_uart_s_wbs_we;
    reg  [3:0]  cpu_m_uart_s_wbs_sel;
    reg  [31:0] cpu_m_uart_s_wbs_dat_i;
    reg  [31:0] cpu_m_uart_s_wbs_adr;
    wire        cpu_m_uart_s_wbs_ack;
    wire [31:0] cpu_m_uart_s_wbs_dat_o;





    // axi stream interface between dma_in and fir and dma_out;
    wire        sm_tvalid;
    wire [31:0] sm_tdata; 
    wire        sm_tlast; 
    wire        sm_tready;
    wire        ss_tvalid; 
    wire [31:0] ss_tdata;
    wire        ss_tlast; 
    wire        ss_tready;




    localparam  
        UART_CONTROL_BASE    = 32'h3000_0000,
        DMA_IN_CONTROL_BASE  = 32'h3100_0000,
        DMA_OUT_CONTROL_BASE = 32'h3200_0000,
        FIR_CONTROL_BASE     = 32'h3400_0000,
        MM_CONTROL_BASE      = 32'h3500_0000,
        SDRAM_CONTROL_BASE   = 32'h3800_0000;



    reg        wbs_ack_o_w;
    reg [31:0] wbs_dat_o_w;




    always@(*)begin
        cpu_m_dma_in_s_wbs_stb = 0;
        cpu_m_dma_in_s_wbs_cyc = 0;
        cpu_m_dma_in_s_wbs_we = 0;
        cpu_m_dma_in_s_wbs_adr  = wbs_adr_i;

        cpu_m_dma_out_s_wbs_stb = 0;
        cpu_m_dma_out_s_wbs_cyc = 0;
        cpu_m_dma_out_s_wbs_we = 0;
        cpu_m_dma_out_s_wbs_adr = wbs_adr_i;

        cpu_m_fir_s_wbs_stb = 0;
        cpu_m_fir_s_wbs_cyc = 0;
        cpu_m_fir_s_wbs_we = 0;
        cpu_m_fir_s_wbs_adr     = wbs_adr_i;

        cpu_m_mm_s_wbs_stb = 0;
        cpu_m_mm_s_wbs_cyc = 0;
        cpu_m_mm_s_wbs_we = 0; 
        cpu_m_mm_s_wbs_adr      = wbs_adr_i;

        cpu_m_sdram_s_wbs_stb = 0;
        cpu_m_sdram_s_wbs_cyc = 0;
        cpu_m_sdram_s_wbs_we = 0;
        cpu_m_sdram_s_wbs_adr   = wbs_adr_i;

        cpu_m_uart_s_wbs_stb = 0;
        cpu_m_uart_s_wbs_cyc = 0;
        cpu_m_uart_s_wbs_we = 0;
        cpu_m_uart_s_wbs_adr    = wbs_adr_i;


        cpu_m_dma_in_s_wbs_sel = 4'b1111;
        cpu_m_dma_in_s_wbs_dat_i = wbs_dat_i;

        cpu_m_dma_out_s_wbs_sel = 4'b1111;
        cpu_m_dma_out_s_wbs_dat_i = wbs_dat_i;

        cpu_m_fir_s_wbs_sel = 4'b1111;
        cpu_m_fir_s_wbs_dat_i = wbs_dat_i;

        cpu_m_mm_s_wbs_sel = 4'b1111;
        cpu_m_mm_s_wbs_dat_i = wbs_dat_i;

        cpu_m_sdram_s_wbs_sel = 4'b1111;
        cpu_m_sdram_s_wbs_dat_i = wbs_dat_i;

        cpu_m_uart_s_wbs_sel = 4'b1111;
        cpu_m_uart_s_wbs_dat_i = wbs_dat_i;

        
        
        
        
        
        


        case(wbs_adr_i[31-:8])
            
            DMA_IN_CONTROL_BASE[31-:8]:begin
                cpu_m_dma_in_s_wbs_stb = wbs_stb_i;
                cpu_m_dma_in_s_wbs_cyc = wbs_cyc_i;
                cpu_m_dma_in_s_wbs_we  = wbs_we_i;
                cpu_m_dma_in_s_wbs_adr[31-:8] = wbs_adr_i[31-:8] - DMA_IN_CONTROL_BASE[31-:8];

                wbs_ack_o_w = cpu_m_dma_in_s_wbs_ack;
                wbs_dat_o_w = cpu_m_dma_in_s_wbs_dat_o;
            end
            DMA_OUT_CONTROL_BASE[31-:8]:begin
                cpu_m_dma_out_s_wbs_stb = wbs_stb_i;
                cpu_m_dma_out_s_wbs_cyc = wbs_cyc_i;
                cpu_m_dma_out_s_wbs_we  = wbs_we_i;
                cpu_m_dma_out_s_wbs_adr[31-:8] = wbs_adr_i[31-:8] - DMA_OUT_CONTROL_BASE[31-:8];

                wbs_ack_o_w = cpu_m_dma_out_s_wbs_ack;
                wbs_dat_o_w = cpu_m_dma_out_s_wbs_dat_o;
            end
            FIR_CONTROL_BASE[31-:8]:begin
                cpu_m_fir_s_wbs_stb = wbs_stb_i;
                cpu_m_fir_s_wbs_cyc = wbs_cyc_i;
                cpu_m_fir_s_wbs_we  = wbs_we_i;
                cpu_m_fir_s_wbs_adr[31-:8] = wbs_adr_i[31-:8] - FIR_CONTROL_BASE[31-:8];

                wbs_ack_o_w = cpu_m_fir_s_wbs_ack;
                wbs_dat_o_w = cpu_m_fir_s_wbs_dat_o;
            end
            MM_CONTROL_BASE[31-:8]:begin
                cpu_m_mm_s_wbs_stb = wbs_stb_i;
                cpu_m_mm_s_wbs_cyc = wbs_cyc_i;
                cpu_m_mm_s_wbs_we  = wbs_we_i;
                cpu_m_mm_s_wbs_adr[31-:8] = wbs_adr_i[31-:8] - MM_CONTROL_BASE[31-:8];

                wbs_ack_o_w = cpu_m_mm_s_wbs_ack;
                wbs_dat_o_w = cpu_m_mm_s_wbs_dat_o;
            end
            SDRAM_CONTROL_BASE[31-:8]:begin
                cpu_m_sdram_s_wbs_stb = wbs_stb_i;
                cpu_m_sdram_s_wbs_cyc = wbs_cyc_i;
                cpu_m_sdram_s_wbs_we  = wbs_we_i;
                cpu_m_sdram_s_wbs_adr[31-:8] = wbs_adr_i[31-:8] - cpu_m_sdram_s_wbs_adr[31-:8];

                wbs_ack_o_w = cpu_m_sdram_s_wbs_ack;
                wbs_dat_o_w = cpu_m_sdram_s_wbs_dat_o;
            end
            UART_CONTROL_BASE[31-:8]:begin
                cpu_m_uart_s_wbs_stb = wbs_stb_i;
                cpu_m_uart_s_wbs_cyc = wbs_cyc_i;
                cpu_m_uart_s_wbs_we  = wbs_we_i;
                cpu_m_uart_s_wbs_adr = wbs_adr_i;

                wbs_ack_o_w = cpu_m_uart_s_wbs_ack;
                wbs_dat_o_w = cpu_m_uart_s_wbs_dat_o;
            end
            default:begin
                wbs_ack_o_w = 0;
                wbs_dat_o_w = 0;
            end
        endcase
    end

    assign wbs_ack_o = wbs_ack_o_w;
    assign wbs_dat_o = wbs_dat_o_w;



    arbiter arbitor_U0(
        .clk(clk),
        .rst(rst),

        .cpu_wbs_stb_i(cpu_m_sdram_s_wbs_stb),
        .cpu_wbs_cyc_i(cpu_m_sdram_s_wbs_cyc),
        .cpu_wbs_we_i (cpu_m_sdram_s_wbs_we),
        .cpu_wbs_sel_i(cpu_m_sdram_s_wbs_sel),
        .cpu_wbs_dat_i(cpu_m_sdram_s_wbs_dat_i),
        .cpu_wbs_adr_i(cpu_m_sdram_s_wbs_adr),
        .cpu_wbs_ack_o(cpu_m_sdram_s_wbs_ack),
        .cpu_wbs_dat_o(cpu_m_sdram_s_wbs_dat_o),

        .dma_in_wbs_stb_i(dma_in_m_sdram_s_wbs_stb),
        .dma_in_wbs_cyc_i(dma_in_m_sdram_s_wbs_cyc),
        .dma_in_wbs_we_i (dma_in_m_sdram_s_wbs_we ),
        .dma_in_wbs_sel_i(dma_in_m_sdram_s_wbs_sel),
        .dma_in_wbs_dat_i(dma_in_m_sdram_s_wbs_dat_i),
        .dma_in_wbs_adr_i(dma_in_m_sdram_s_wbs_adr),
        .dma_in_wbs_ack_o(dma_in_m_sdram_s_wbs_ack),
        .dma_in_wbs_dat_o(dma_in_m_sdram_s_wbs_dat_o),

        .dma_out_wbs_stb_i(dma_out_m_sdram_s_wbs_stb),
        .dma_out_wbs_cyc_i(dma_out_m_sdram_s_wbs_cyc),
        .dma_out_wbs_we_i (dma_out_m_sdram_s_wbs_we ),
        .dma_out_wbs_sel_i(dma_out_m_sdram_s_wbs_sel),
        .dma_out_wbs_dat_i(dma_out_m_sdram_s_wbs_dat_i),
        .dma_out_wbs_adr_i(dma_out_m_sdram_s_wbs_adr),
        .dma_out_wbs_ack_o(dma_out_m_sdram_s_wbs_ack),
        .dma_out_wbs_dat_o(dma_out_m_sdram_s_wbs_dat_o),

        .mm_wbs_stb_i(mm_m_sdram_s_wbs_stb),
        .mm_wbs_cyc_i(mm_m_sdram_s_wbs_cyc),
        .mm_wbs_we_i (mm_m_sdram_s_wbs_we ),
        .mm_wbs_sel_i(mm_m_sdram_s_wbs_sel),
        .mm_wbs_dat_i(mm_m_sdram_s_wbs_dat_i),
        .mm_wbs_adr_i(mm_m_sdram_s_wbs_adr),
        .mm_wbs_ack_o(mm_m_sdram_s_wbs_ack),
        .mm_wbs_dat_o(mm_m_sdram_s_wbs_dat_o),

        .wbs_stb_o(sdram_s_wbs_stb),
        .wbs_cyc_o(sdram_s_wbs_cyc),
        .wbs_we_o (sdram_s_wbs_we),
        .wbs_sel_o(sdram_s_wbs_sel),
        .wbs_dat_o(sdram_s_wbs_dat_i),
        .wbs_adr_o(sdram_s_wbs_adr),
        .wbs_ack_i(sdram_s_wbs_ack),
        .wbs_dat_i(sdram_s_wbs_dat_o)
    );





    dma_in dma_in_u0 
    (
        .clk(clk),
        .rst(rst),
        // wb slave interface (from cpu, for control register configuration)
        .s_wbs_stb_i(cpu_m_dma_in_s_wbs_stb),
        .s_wbs_cyc_i(cpu_m_dma_in_s_wbs_cyc),
        .s_wbs_we_i (cpu_m_dma_in_s_wbs_we),
        .s_wbs_sel_i(cpu_m_dma_in_s_wbs_sel),
        .s_wbs_dat_i(cpu_m_dma_in_s_wbs_dat_i),
        .s_wbs_adr_i(cpu_m_dma_in_s_wbs_adr),
        .s_wbs_ack_o(cpu_m_dma_in_s_wbs_ack),
        .s_wbs_dat_o(cpu_m_dma_in_s_wbs_dat_o),


        // wb master interface (to sdram)
        .m_wbs_stb_o(dma_in_m_sdram_s_wbs_stb),
        .m_wbs_cyc_o(dma_in_m_sdram_s_wbs_cyc),
        .m_wbs_we_o (dma_in_m_sdram_s_wbs_we ),
        .m_wbs_sel_o(dma_in_m_sdram_s_wbs_sel),
        .m_wbs_dat_o(dma_in_m_sdram_s_wbs_dat_i),
        .m_wbs_adr_o(dma_in_m_sdram_s_wbs_adr),
        .m_wbs_ack_i(dma_in_m_sdram_s_wbs_ack),
        .m_wbs_dat_i(dma_in_m_sdram_s_wbs_dat_o),

        // ports like axi_stream ports (to user module, for streaming data)
        .sm_tvalid(ss_tvalid), 
        .sm_tdata (ss_tdata ), 
        .sm_tlast (ss_tlast ), 
        .sm_tready(ss_tready)
    );



    
    fir fir_u0(
        .clk      (clk),
        .rst      (rst),
        // wish-bone interface
        .wbs_stb_i(cpu_m_fir_s_wbs_stb),
        .wbs_cyc_i(cpu_m_fir_s_wbs_cyc),
        .wbs_we_i (cpu_m_fir_s_wbs_we),
        .wbs_sel_i(cpu_m_fir_s_wbs_sel),
        .wbs_dat_i(cpu_m_fir_s_wbs_dat_i),
        .wbs_adr_i(cpu_m_fir_s_wbs_adr),
        .wbs_ack_o(cpu_m_fir_s_wbs_ack),
        .wbs_dat_o(cpu_m_fir_s_wbs_dat_o),


        // axi-stream interface
        .ss_tvalid(ss_tvalid),
        .ss_tdata (ss_tdata ),
        .ss_tlast (ss_tlast ),
        .ss_tready(ss_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata (sm_tdata ),
        .sm_tlast (sm_tlast ),
        .sm_tready(sm_tready)
    );


    mm mm_u0 (
        .clk(clk),
        .rst(rst),
    // wb slave interface (from cpu, for control register configuration)
        .s_wbs_stb_i(cpu_m_mm_s_wbs_stb),
        .s_wbs_cyc_i(cpu_m_mm_s_wbs_cyc),
        .s_wbs_we_i(cpu_m_mm_s_wbs_we),
        .s_wbs_sel_i(cpu_m_mm_s_wbs_sel),
        .s_wbs_dat_i(cpu_m_mm_s_wbs_dat_i),
        .s_wbs_adr_i(cpu_m_mm_s_wbs_adr),
        .s_wbs_ack_o(cpu_m_mm_s_wbs_ack),
        .s_wbs_dat_o(cpu_m_mm_s_wbs_dat_o),
    // wb master interface (to sdram)
        .m_wbs_stb_o(mm_m_sdram_s_wbs_stb),
        .m_wbs_cyc_o(mm_m_sdram_s_wbs_cyc),
        .m_wbs_we_o(mm_m_sdram_s_wbs_we),
        .m_wbs_sel_o(mm_m_sdram_s_wbs_sel),
        .m_wbs_dat_o(mm_m_sdram_s_wbs_dat_i),
        .m_wbs_adr_o(mm_m_sdram_s_wbs_adr),
        .m_wbs_ack_i(mm_m_sdram_s_wbs_ack),
        .m_wbs_dat_i(mm_m_sdram_s_wbs_dat_o)
    );

    dma_out dma_out_u0 
    (
        .clk(clk),
        .rst(rst),
        // wb slave interface (from cpu, for control register configuration)
        .s_wbs_stb_i(cpu_m_dma_out_s_wbs_stb),
        .s_wbs_cyc_i(cpu_m_dma_out_s_wbs_cyc),
        .s_wbs_we_i (cpu_m_dma_out_s_wbs_we),
        .s_wbs_sel_i(cpu_m_dma_out_s_wbs_sel),
        .s_wbs_dat_i(cpu_m_dma_out_s_wbs_dat_i),
        .s_wbs_adr_i(cpu_m_dma_out_s_wbs_adr),
        .s_wbs_ack_o(cpu_m_dma_out_s_wbs_ack),
        .s_wbs_dat_o(cpu_m_dma_out_s_wbs_dat_o),
        
        // wb master interface (to sdram)
        .m_wbs_stb_o(dma_out_m_sdram_s_wbs_stb),
        .m_wbs_cyc_o(dma_out_m_sdram_s_wbs_cyc),
        .m_wbs_we_o (dma_out_m_sdram_s_wbs_we),
        .m_wbs_sel_o(dma_out_m_sdram_s_wbs_sel),
        .m_wbs_dat_o(dma_out_m_sdram_s_wbs_dat_i),
        .m_wbs_adr_o(dma_out_m_sdram_s_wbs_adr),
        .m_wbs_ack_i(dma_out_m_sdram_s_wbs_ack),
        .m_wbs_dat_i(dma_out_m_sdram_s_wbs_dat_o),

        // ports like axi_stream ports (from user module, for streaming data)
        .ss_tvalid(sm_tvalid), 
        .ss_tdata(sm_tdata), 
        .ss_tlast(sm_tlast), 
        .ss_tready(sm_tready)
    );

    wire sdram_cle;
    wire sdram_cs;
    wire sdram_cas;
    wire sdram_ras;
    wire sdram_we;
    wire sdram_dqm;
    wire [1:0] sdram_ba;
    wire [12:0] sdram_a;
    wire [31:0] d2c_data;
    wire [31:0] c2d_data;


    wire ctrl_busy;
    wire sdram_s_in_valid = sdram_s_wbs_stb & sdram_s_wbs_cyc;

    sdram_controller user_sdram_controller (
        .clk(clk),
        .rst(rst),
        
        .sdram_cle(sdram_cle),
        .sdram_cs(sdram_cs),
        .sdram_cas(sdram_cas),
        .sdram_ras(sdram_ras),
        .sdram_we(sdram_we),
        .sdram_dqm(sdram_dqm),
        .sdram_ba(sdram_ba),
        .sdram_a(sdram_a),
        .sdram_dqi(d2c_data),
        .sdram_dqo(c2d_data),


        .in_valid (sdram_s_in_valid),
        .rw       (sdram_s_wbs_we),
        .data_in  (sdram_s_wbs_dat_i),
        .user_addr(sdram_s_wbs_adr),
        .out_valid(sdram_s_wbs_ack),
        .data_out (sdram_s_wbs_dat_o),
        
        .busy     (ctrl_busy)
    );

    sdr user_bram (
        .Rst_n(rst_n),
        .Clk(clk),
        .Cke(sdram_cle),
        .Cs_n(sdram_cs),
        .Ras_n(sdram_ras),
        .Cas_n(sdram_cas),
        .We_n(sdram_we),
        .Addr(sdram_a),
        .Ba(sdram_ba),
        .Dqm(4'b1111),
        .Dqi(c2d_data),
        .Dqo(d2c_data)
    );




    uart uart (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    // MGMT SoC Wishbone Slave

    .wbs_stb_i(cpu_m_uart_s_wbs_stb),
    .wbs_cyc_i(cpu_m_uart_s_wbs_cyc),
    .wbs_we_i (cpu_m_uart_s_wbs_we),
    .wbs_sel_i(cpu_m_uart_s_wbs_sel),
    .wbs_dat_i(cpu_m_uart_s_wbs_dat_i),
    .wbs_adr_i(cpu_m_uart_s_wbs_adr),
    .wbs_ack_o(cpu_m_uart_s_wbs_ack),
    .wbs_dat_o(cpu_m_uart_s_wbs_dat_o),

    // IO ports
    .io_in  (io_in      ),
    .io_out (io_out),
    .io_oeb (io_oeb),

    // irq
    .user_irq (irq)
);




endmodule

`default_nettype wire
