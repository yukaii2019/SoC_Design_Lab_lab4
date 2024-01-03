module sub_arbiter(
    input clk,
    input rst,
    input  [3:0] req,
    output [3:0] gnt
);
    reg [3:0] gnt_r;
    wire[3:0] gnt_w;
    always@(posedge clk)begin
        if(rst)begin
            gnt_r <= 4'b0001;
        end
        else begin
            gnt_r <= gnt_w;
        end
    end

    wire[3:0] tmp_gnt = req & (~(req-1));
    wire new_req = |req;
    wire original_cont_used = |(gnt_r & req);
    //assign gnt_w = (new_req & ~original_cont_used) ? tmp_gnt : gnt_r;
    // assign gnt_w = ((new_req & ~original_cont_used) | (gnt_r[2] & (req[1] | req[0]))) ? tmp_gnt : gnt_r; 
    assign gnt_w = ((new_req & ~original_cont_used) | (gnt_r[3] & (req[2] | req[1] | req[0]))) ? tmp_gnt : gnt_r; 
    assign gnt = gnt_w;

endmodule


module arbiter(
    input clk,
    input rst,

    input         cpu_wbs_stb_i,
    input         cpu_wbs_cyc_i,
    input         cpu_wbs_we_i,
    input [3:0]   cpu_wbs_sel_i,
    input [31:0]  cpu_wbs_dat_i,
    input [31:0]  cpu_wbs_adr_i,
    output        cpu_wbs_ack_o,
    output [31:0] cpu_wbs_dat_o,

    input         dma_in_wbs_stb_i,
    input         dma_in_wbs_cyc_i,
    input         dma_in_wbs_we_i,
    input [3:0]   dma_in_wbs_sel_i,
    input [31:0]  dma_in_wbs_dat_i,
    input [31:0]  dma_in_wbs_adr_i,
    output        dma_in_wbs_ack_o,
    output [31:0] dma_in_wbs_dat_o,

    input         dma_out_wbs_stb_i,
    input         dma_out_wbs_cyc_i,
    input         dma_out_wbs_we_i,
    input [3:0]   dma_out_wbs_sel_i,
    input [31:0]  dma_out_wbs_dat_i,
    input [31:0]  dma_out_wbs_adr_i,
    output        dma_out_wbs_ack_o,
    output [31:0] dma_out_wbs_dat_o,

    input         mm_wbs_stb_i,
    input         mm_wbs_cyc_i,
    input         mm_wbs_we_i,
    input [3:0]   mm_wbs_sel_i,
    input [31:0]  mm_wbs_dat_i,
    input [31:0]  mm_wbs_adr_i,
    output        mm_wbs_ack_o,
    output [31:0] mm_wbs_dat_o,

    output        wbs_stb_o,
    output        wbs_cyc_o,
    output        wbs_we_o,
    output [3:0]  wbs_sel_o,
    output [31:0] wbs_dat_o,
    output [31:0] wbs_adr_o,
    input         wbs_ack_i,
    input  [31:0] wbs_dat_i

);

    wire cpu_valid     = cpu_wbs_stb_i      & cpu_wbs_cyc_i;
    wire dma_in_valid  = dma_in_wbs_stb_i   & dma_in_wbs_cyc_i;
    wire dma_out_valid = dma_out_wbs_stb_i  & dma_out_wbs_cyc_i;
    wire mm_valid      = mm_wbs_stb_i       & mm_wbs_cyc_i;

    wire [3:0] req = {cpu_valid, dma_out_valid, dma_in_valid, mm_valid}; //priority low to high
    wire [3:0] gnt;

    sub_arbiter sub_arbiter_U0(
        .clk(clk),
        .rst(rst),
        .req(req),
        .gnt(gnt)
    ); 

    assign wbs_stb_o = (gnt[0]) ? mm_wbs_stb_i : (gnt[1]) ? dma_in_wbs_stb_i : (gnt[2]) ? dma_out_wbs_stb_i : cpu_wbs_stb_i;
    assign wbs_cyc_o = (gnt[0]) ? mm_wbs_cyc_i : (gnt[1]) ? dma_in_wbs_cyc_i : (gnt[2]) ? dma_out_wbs_cyc_i : cpu_wbs_cyc_i;
    assign wbs_we_o  = (gnt[0]) ? mm_wbs_we_i : (gnt[1]) ? dma_in_wbs_we_i  : (gnt[2]) ? dma_out_wbs_we_i  : cpu_wbs_we_i ;
    assign wbs_sel_o = (gnt[0]) ? mm_wbs_sel_i : (gnt[1]) ? dma_in_wbs_sel_i : (gnt[2]) ? dma_out_wbs_sel_i : cpu_wbs_sel_i;
    assign wbs_dat_o = (gnt[0]) ? mm_wbs_dat_i : (gnt[1]) ? dma_in_wbs_dat_i : (gnt[2]) ? dma_out_wbs_dat_i : cpu_wbs_dat_i;
    assign wbs_adr_o = (gnt[0]) ? mm_wbs_adr_i : (gnt[1]) ? dma_in_wbs_adr_i : (gnt[2]) ? dma_out_wbs_adr_i : cpu_wbs_adr_i;

    assign mm_wbs_ack_o = gnt[0] & wbs_ack_i;
    assign mm_wbs_dat_o = wbs_dat_i;

    assign dma_in_wbs_ack_o = gnt[1] & wbs_ack_i;
    assign dma_in_wbs_dat_o = wbs_dat_i;

    assign dma_out_wbs_ack_o = gnt[2] & wbs_ack_i;
    assign dma_out_wbs_dat_o = wbs_dat_i;

    assign cpu_wbs_ack_o = gnt[3] & wbs_ack_i;
    assign cpu_wbs_dat_o = wbs_dat_i;


endmodule