`timescale 1ns / 1ps
`default_nettype wire
module fir (
    input             clk,
    input             rst,
    // wish-bone interface
    input             wbs_cyc_i,
    input             wbs_stb_i,
    input             wbs_we_i,
    input [3:0]       wbs_sel_i,
    input [31:0]      wbs_adr_i,
    input [31:0]      wbs_dat_i,
    output            wbs_ack_o,
    output[31:0]      wbs_dat_o,
    // axi-stream interface
    input             ss_tvalid,
    output            ss_tready,
    input  [31:0]     ss_tdata,
    input             ss_tlast,
    input             sm_tready,
    output            sm_tvalid,
    output [31:0]     sm_tdata,
    output            sm_tlast
);


    localparam DELAY = 4; // fir computation delay

    localparam
        ADDR_AP_CTRL            = 'h20,
        ADDR_TAP_BEGIN          = 'h40,
        ADDR_TAP_END            = 'h6C,
        IDLE                    = 'd0,
        DATA                    = 'd1,
        RESET                   = 'd3;

    integer i;
    wire stall;

    
    reg[2:0] state_r;
    reg [0:DELAY-1] ss_hs_fifo ; // input hankshake fifo for output sm_tvalid
    reg [0:DELAY-1] last_fifo; // input ss_tlast fifo for output sm_tlast

    // datapath
    reg  [31:0] data [0:10];
    wire [31:0] mul  [0:10];  // multipliers' output wire
    wire [31:0] yn;
    
    
    wire valid = wbs_cyc_i & wbs_stb_i;
    wire [31:0] tap_A;
    reg ap_start_r;
    reg  [31:0] tap  [0:10];
    wire in_data = state_r == DATA;

    wire full = ss_hs_fifo[DELAY-1];
    reg last;
    
    reg last_ready;


    assign sm_tvalid = full & ~last_ready & in_data;  
    // assign sm_tvalid = ss_hs_fifo[DELAY-1];
    assign sm_tdata  = yn;
    assign sm_tlast = last_fifo[DELAY-1];
    assign stall = (last)? ~sm_tready : (full) ? ~last_ready | ~ss_tvalid : ~ss_tvalid; 
    // assign stall = (full) ? sm_tready & sm_tvalid : ~ss_tvalid; 
    // assign stall = (sm_tvalid & ~sm_tready) | (~sm_tvalid & ~ss_tvalid);
    assign ss_tready = (full) ? last_ready & ss_tvalid & in_data : in_data;

    
    always@(posedge clk)begin
        if(rst)begin
            last_ready <= 0;
        end
        else if (state_r == RESET)begin
            last_ready <= 0;
        end
        else begin
            if(~stall)begin
                last_ready <= 0;
            end
            else if(sm_tready)begin
                last_ready <= 1;
            end 
        end
    end

    // assign ss_tready = ~stall & in_data;

    always@(posedge clk)begin
        if(rst)begin
            last <= 0;
        end
        else if (state_r == RESET)begin
            last <= 0;
        end
        else begin
            if(ss_tvalid & ss_tready & ss_tlast)begin
                last <= 1;
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            state_r <= RESET;
        end
        else begin
            case(state_r)
                IDLE:begin
                    state_r <= (ap_start_r) ? DATA : IDLE;
                end
                DATA:begin
                    state_r <= (sm_tlast & sm_tvalid & sm_tready)? RESET : DATA;
                end
                default:begin //RESET
                    state_r <= IDLE;
                end
            endcase
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            last_fifo <= 0; 
        end
        else if (state_r == RESET)begin
            for(i = 0 ; i < DELAY ; i = i + 1)begin
                last_fifo[i] <= 0;
            end
        end
        else begin
            if(((last & sm_tvalid & sm_tready) | (~last & ss_tvalid & ss_tready)) & in_data)begin
                last_fifo[0] <= ss_tlast;
                for(i = 1 ; i < DELAY ; i = i + 1)begin
                    last_fifo[i] <= last_fifo[i-1];
                end
            end
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            ss_hs_fifo <= 0;
        end
        else if(state_r == RESET)begin
            for(i = 0 ; i < DELAY ; i = i + 1)begin
                ss_hs_fifo[i] <= 0;
            end
        end
        else begin
            if (ss_tvalid & in_data) begin
                ss_hs_fifo[0] <= 1;
                for (i = 1;i < DELAY ; i = i + 1) begin
                    ss_hs_fifo[i] <= ss_hs_fifo[i-1];
                end
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            for(i = 0 ; i < 11 ; i = i + 1)begin
                data[i] = 0;
            end
        end
        else if(state_r == RESET)begin
            for(i = 0 ; i < 11 ; i = i + 1)begin
                data[i] = 0;
            end
        end
        else begin
            if(~stall & in_data)begin
                data[0] <= ss_tdata;
                for (i = 1 ; i < 11 ; i = i + 1) begin
                    data[i] <= data[i-1];
                end
            end
        end
    end


    // wb control signal
    always@(posedge clk)begin
        if(rst)begin
            ap_start_r <= 0;
        end
        else if (state_r == RESET)begin
            ap_start_r <= 0;
        end
        else begin
            if(valid && wbs_we_i && wbs_adr_i == ADDR_AP_CTRL)begin
                ap_start_r <= wbs_dat_i[0];
            end
        end
    end

    assign tap_A = wbs_adr_i - ADDR_TAP_BEGIN; // tap address x4

    always@(posedge clk)begin
        if(rst)begin
            for(i = 0 ; i < 11 ; i = i + 1)begin
                tap[i] = 0;
            end
        end
        else if (state_r == RESET)begin
            for(i = 0 ; i < 11 ; i = i + 1)begin
                tap[i] = 0;
            end
        end
        else begin
            if(valid && wbs_we_i && wbs_adr_i >= ADDR_TAP_BEGIN && wbs_adr_i < ADDR_TAP_END)begin
                tap[tap_A[5:2]] <= wbs_dat_i; 
            end
        end
    end

    assign wbs_ack_o = valid; 
    assign wbs_dat_o = 0;


    multiplier_11 mul0 (
        .clk   (clk    ),
        .rst   (rst    ),
        .stall (stall),
        .a1    (data[0]),
        .a2    (data[1]),
        .a3    (data[2]),
        .a4    (data[3]),
        .a5    (data[4]),
        .a6    (data[5]),
        .a7    (data[6]),
        .a8    (data[7]),
        .a9    (data[8]),
        .a10   (data[9]),
        .a11   (data[10]),
        .b1    (tap[0] ),
        .b2    (tap[1] ),
        .b3    (tap[2] ),
        .b4    (tap[3] ),
        .b5    (tap[4] ),
        .b6    (tap[5] ),
        .b7    (tap[6] ),
        .b8    (tap[7] ),
        .b9    (tap[8] ),
        .b10   (tap[9] ),
        .b11   (tap[10]),
        .p1    (mul[0] ),
        .p2    (mul[1] ),
        .p3    (mul[2] ),
        .p4    (mul[3] ),
        .p5    (mul[4] ),
        .p6    (mul[5] ),
        .p7    (mul[6] ),
        .p8    (mul[7] ),
        .p9    (mul[8] ),
        .p10   (mul[9] ),
        .p11   (mul[10])
    );

    addertree_11 add0 (
        .clk   (clk    ),
        .rst   (rst    ),
        .stall (stall),
        .i1    (mul[0] ),
        .i2    (mul[1] ),
        .i3    (mul[2] ),
        .i4    (mul[3] ),
        .i5    (mul[4] ),
        .i6    (mul[5] ),
        .i7    (mul[6] ),
        .i8    (mul[7] ),
        .i9    (mul[8] ),
        .i10   (mul[9] ),
        .i11   (mul[10]),
        .s     (yn     )
    );

endmodule

module multiplier_11 (
    input clk,
    input rst,
    input stall,
    input [31:0] a1,
    input [31:0] a2,
    input [31:0] a3,
    input [31:0] a4,
    input [31:0] a5,
    input [31:0] a6,
    input [31:0] a7,
    input [31:0] a8,
    input [31:0] a9,
    input [31:0] a10,
    input [31:0] a11,
    input [31:0] b1,
    input [31:0] b2,
    input [31:0] b3,
    input [31:0] b4,
    input [31:0] b5,
    input [31:0] b6,
    input [31:0] b7,
    input [31:0] b8,
    input [31:0] b9,
    input [31:0] b10,
    input [31:0] b11,
    output reg [31:0] p1,
    output reg [31:0] p2,
    output reg [31:0] p3,
    output reg [31:0] p4,
    output reg [31:0] p5,
    output reg [31:0] p6,
    output reg [31:0] p7,
    output reg [31:0] p8,
    output reg [31:0] p9,
    output reg [31:0] p10,
    output reg [31:0] p11
);

    always @(posedge clk) begin
        if (rst) begin
            p1  <= 0;
            p2  <= 0;
            p3  <= 0;
            p4  <= 0;
            p5  <= 0;
            p6  <= 0;
            p7  <= 0;
            p8  <= 0;
            p9  <= 0;
            p10 <= 0;
            p11 <= 0;
        end
        else if (!stall) begin
            p1  <= $signed(a1)  * $signed(b1);
            p2  <= $signed(a2)  * $signed(b2);
            p3  <= $signed(a3)  * $signed(b3);
            p4  <= $signed(a4)  * $signed(b4);
            p5  <= $signed(a5)  * $signed(b5);
            p6  <= $signed(a6)  * $signed(b6);
            p7  <= $signed(a7)  * $signed(b7);
            p8  <= $signed(a8)  * $signed(b8);
            p9  <= $signed(a9)  * $signed(b9);
            p10 <= $signed(a10) * $signed(b10);
            p11 <= $signed(a11) * $signed(b11);
        end
    end
endmodule

module addertree_11 (
    input clk,
    input rst,
    input stall,
    input  [31:0] i1,
    input  [31:0] i2,
    input  [31:0] i3,
    input  [31:0] i4,
    input  [31:0] i5,
    input  [31:0] i6,
    input  [31:0] i7,
    input  [31:0] i8,
    input  [31:0] i9,
    input  [31:0] i10,
    input  [31:0] i11,
    output reg [31:0] s
);

    wire [31:0] w1;
    wire [31:0] w2;
    wire [31:0] w3;
    wire [31:0] w4;
    wire [31:0] w5;
    wire [31:0] w6;
    reg [31:0] r1;
    reg [31:0] r2;
    reg [31:0] r3;

    // stage 1
    assign w1 = i1 + i2;
    assign w2 = i3 + i4;
    assign w3 = i5 + i6;
    assign w4 = i7 + i8;
    assign w5 = i9 + i10;
    // stage 2
    assign w6 = r1 + r2;

    always @(posedge clk) begin
        if (rst) begin
            r1 <= 0;
            r2 <= 0;
            r3 <= 0;
            s  <= 0;
        end
        else if (!stall) begin
            // stage 1
            r1 <= w1 + w2;
            r2 <= w3 + w4;
            r3 <= w5 + i11;
            // stage 2
            s  <= w6 + r3;
        end
    end
endmodule