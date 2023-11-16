module wb_to_axi
#(
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
)
(
    input clk,
    input rst,

     // Wishbone Slave ports (WB MI A)
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0]   wbs_sel_i,
    input [31:0]  wbs_dat_i,
    input [31:0]  wbs_adr_i,
    output        wbs_ack_o,
    output [31:0] wbs_dat_o,


    // axi_lite master ports
    output                     awvalid,
    output [(pADDR_WIDTH-1):0] awaddr,
    output                     wvalid,
    output [(pDATA_WIDTH-1):0] wdata,

    output                     arvalid,
    output [(pADDR_WIDTH-1):0] araddr,
    output                     rready,
    
    input                      awready,
    input                      wready,
    input                      arready,

    input                      rvalid,
    input [(pDATA_WIDTH-1):0]  rdata,

    // axi_stream ports
    output                      ss_tvalid, 
    output  [(pDATA_WIDTH-1):0] ss_tdata, 
    output                      ss_tlast, 
    input                       ss_tready, 

    output                      sm_tready, 
    input                       sm_tvalid, 
    input   [(pDATA_WIDTH-1):0] sm_tdata, 
    input                       sm_tlast
);
    
    wire wbs_valid;
    wire decode;
    reg [1:0] w_state_r;
    
    wire w_cyc;
    wire aw_hs;
    wire w_hs;
    
    reg [1:0] r_state_r;
    wire r_cyc;
    wire ar_hs;
    wire r_hs;

    localparam
        WRADDR                  = 2'd0,
        WRDATA                  = 2'd1,
        WRRESET                 = 2'd2;

    localparam
        RDADDR                  = 2'd0,
        RDDATA                  = 2'd1,
        RDRESET                 = 2'd2;


    assign decode = (wbs_adr_i >= 32'h3000_0000) & (wbs_adr_i <= 32'h3000_007F);

    assign wbs_valid = wbs_stb_i & wbs_cyc_i;
    
    assign w_cyc   = wbs_valid & wbs_we_i; 
    assign awvalid = w_cyc & decode & (w_state_r == WRADDR);
    assign wvalid  = w_cyc & decode & (w_state_r == WRDATA); 
    assign aw_hs   = awvalid & awready; 
    assign awaddr  = wbs_adr_i[(pDATA_WIDTH-1):0];
    assign wdata   = wbs_dat_i;
    assign w_hs    = wvalid & wready;
    


    always@(posedge clk)begin
        if(rst)begin
            w_state_r <= WRRESET; 
        end
        else begin
            case(w_state_r)
                WRADDR:begin
                    w_state_r <= (aw_hs)? WRDATA : WRADDR; 
                end
                WRDATA:begin
                    w_state_r <= (wready)? WRADDR : WRDATA;
                end
                default:begin
                    w_state_r <= WRADDR; 
                end 
            endcase
        end
    end


    assign r_cyc = wbs_valid & (~wbs_we_i); 
    assign arvalid = r_cyc  & decode & (r_state_r == RDADDR);
    assign ar_hs = arvalid == arready;
     
    assign araddr = wbs_adr_i[(pDATA_WIDTH-1):0];
    assign rready = r_cyc  & decode & (r_state_r == RDDATA); 
    assign r_hs = rready & rvalid;
    

    always@(posedge clk)begin
        if(rst)begin
            r_state_r <= RDRESET;
        end
        else begin
            case(r_state_r)
                RDADDR:begin
                    r_state_r <= (ar_hs) ? RDDATA : RDADDR; 
                end
                RDDATA:begin
                    r_state_r <= (rvalid) ? RDADDR: RDDATA; 
                end
                default:begin
                    r_state_r <= RDADDR;
                end
            endcase
        end
    end 

    
    wire ss_hs;
    wire sm_hs;

    assign ss_tvalid     = wbs_valid & (wbs_adr_i == 32'h3000_0080);
    assign ss_tdata      = wbs_dat_i;
    assign ss_hs         = ss_tready & ss_tvalid;


    assign sm_tready     = wbs_valid & (wbs_adr_i == 32'h3000_0084);
    assign sm_hs         = sm_tready & sm_tvalid;


    assign wbs_ack_o = w_hs | r_hs | sm_hs | ss_hs; 
    assign wbs_dat_o = (r_hs) ? rdata : sm_tdata;


endmodule