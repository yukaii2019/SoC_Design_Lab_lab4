`timescale 1ns / 1ps
`default_nettype wire
module mm (
    input         clk,
    input         rst,
    // wb slave interface (from cpu, for control register configuration)
    input         s_wbs_stb_i,
    input         s_wbs_cyc_i,
    input         s_wbs_we_i,
    input [3:0]   s_wbs_sel_i,
    input [31:0]  s_wbs_dat_i,
    input [31:0]  s_wbs_adr_i,
    output        s_wbs_ack_o,
    output reg [31:0] s_wbs_dat_o,
    // wb master interface (to sdram)
    output        m_wbs_stb_o,
    output        m_wbs_cyc_o,
    output        m_wbs_we_o,
    output [3:0]  m_wbs_sel_o,
    output [31:0] m_wbs_dat_o,
    output [31:0] m_wbs_adr_o,
    input         m_wbs_ack_i,
    input [31:0]  m_wbs_dat_i
);

    localparam
        ADDR_AP_CTRL = 'h00,
        ADDR_A_BASE  = 'h10,
        ADDR_B_BASE  = 'h14,
        ADDR_C_BASE  = 'h18,
        ADDR_SIZE    = 'h20,
        IDLE         = 'd0,
        READ_A       = 'd1,
        READ_B       = 'd2,
        WRTE_C       = 'd3,
        RESET        = 'd4;

    localparam BUFFER_SIZE = 32;
    
    reg [3:0] state_r, state_w;

    reg [4:0]  i_r, j_r, k_r; // counter for matrix multiplication
    reg [31:0] data_A_r [0:BUFFER_SIZE-1];
    // reg [31:0] data_B_r;
    reg [31:0] data_C_r;

    // debug
    wire [31:0] data_A0 = data_A_r[0];
    wire [31:0] data_A1 = data_A_r[1];
    wire [31:0] data_A2 = data_A_r[2];
    wire [31:0] data_A3 = data_A_r[3];

    wire [31:0] addr_A = a_base_r + ((i_r * size_r + k_r) << 2);
    // wire [31:0] addr_B = b_base_r + ((k_r * size_r + j_r) << 2); // B not transposed
    wire [31:0] addr_B = b_base_r + ((j_r * size_r + k_r) << 2); // B transposed
    wire [31:0] addr_C = c_base_r + ((i_r * size_r + j_r) << 2);

    assign m_wbs_adr_o = (state_r == READ_A) ? addr_A : (state_r == READ_B) ? addr_B : addr_C;
    assign m_wbs_stb_o = state_r != IDLE && state_r != RESET;
    assign m_wbs_cyc_o = state_r != IDLE && state_r != RESET;
    // write related
    assign m_wbs_we_o = (state_r == WRTE_C);
    assign m_wbs_sel_o = 4'b1111;
    assign m_wbs_dat_o = data_C_r;
    
    // CPU config registers
    reg        ap_start_r;
    reg        ap_done_r;
    reg [4:0]  size_r;
    reg [31:0] a_base_r;
    reg [31:0] b_base_r;
    reg [31:0] c_base_r;
    reg        r_valid;

    always@(*)begin
        state_w = state_r;
        case(state_r)
            IDLE:begin
                state_w = (ap_start_r) ? READ_A : IDLE;
            end
            READ_A:begin
                state_w = (m_wbs_ack_i && k_r == size_r-1) ? READ_B : READ_A;
            end
            READ_B:begin
                state_w = (m_wbs_ack_i && k_r == size_r-1) ? WRTE_C : READ_B;
            end
            WRTE_C:begin
                if (m_wbs_ack_i) begin
                    if (i_r == size_r-1 && j_r == size_r-1) begin
                        state_w = RESET;
                    end
                    else begin
                        state_w = READ_A;
                    end
                end
            end
            default:begin
                state_w = IDLE;
            end
        endcase
    end

    always@(posedge clk)begin
        if(rst)begin
            state_r <= RESET;
        end
        else begin
            state_r <= state_w;
        end
    end

    // counter for matrix multiplication
    always @(posedge clk) begin
        if(rst)begin
            k_r <= 0;
        end
        else if (state_r == RESET)begin
            k_r <= 0;
        end
        else begin
            if (m_wbs_ack_i) begin
                if ((state_r == READ_A || state_r == WRTE_C) && k_r == size_r - 1) begin
                    k_r <= 0;
                end
                else if (state_r != WRTE_C && k_r != size_r - 1) begin
                    k_r <= k_r + 1;
                end
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            i_r <= 0;
            j_r <= 0;
        end
        else if (state_r == RESET)begin
            i_r <= 0;
            j_r <= 0;
        end
        else begin
            if (m_wbs_ack_i && state_r == WRTE_C) begin
                if (i_r == size_r - 1 && j_r == size_r - 1 && k_r == size_r - 1) begin
                    i_r <= 0;
                    j_r <= 0;
                end
                else begin
                    if (j_r == size_r - 1 && k_r == size_r - 1) begin
                        i_r <= i_r + 1;
                        j_r <= 0;
                    end
                    else begin
                        if (k_r == size_r - 1) begin
                            j_r <= j_r + 1;
                        end
                    end
                end
            end
        end
    end

    // data
    integer i;
    always@(posedge clk)begin
        if(rst)begin
            for (i = 0; i < BUFFER_SIZE; i = i + 1) begin
                data_A_r[i] <= 0;
            end 
            // data_B_r <= 0;
        end
        else if (state_r == RESET) begin
            for (i = 0; i < BUFFER_SIZE; i = i + 1) begin
                data_A_r[i] <= 0;
            end
            // data_B_r <= 0;
        end
        else begin
            if (m_wbs_ack_i && state_r == READ_A) begin
                data_A_r[k_r] <= m_wbs_dat_i;
            end
            // else if (m_wbs_ack_i && state_r == READ_B) begin
            //     data_B_r <= m_wbs_dat_i;
            // end
        end
    end

    // mac
    always@(posedge clk)begin
        if(rst)begin
            data_C_r <= 0;
        end
        else if (state_r == RESET) begin
            data_C_r <= 0;
        end
        else begin
            if (state_r == READ_A) begin
                data_C_r <= 0;
            end
            else if (m_wbs_ack_i && state_r == READ_B) begin
                data_C_r <= data_C_r + $signed(data_A_r[k_r]) * $signed(m_wbs_dat_i);
            end
        end
    end

    // cpu wishbone
    wire valid = s_wbs_stb_i & s_wbs_cyc_i;

    // cpu wishbone write
    always@(posedge clk)begin
        if(rst)begin
            ap_start_r <= 0;
        end
        else if (state_r == RESET)begin
            ap_start_r <= 0;
        end
        else begin
            if(valid && s_wbs_we_i && s_wbs_adr_i == ADDR_AP_CTRL)begin
                ap_start_r <= s_wbs_dat_i[0];
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            ap_done_r <= 0;
        end
        // else if (state_r == RESET)begin
        //     ap_done_r <= 0;
        // end
        else begin
            if(m_wbs_ack_i && state_r == WRTE_C && i_r == size_r - 1 && j_r == size_r - 1)begin
                ap_done_r <= 1;
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            size_r <= 0;
        end
        else if (state_r == RESET)begin
            size_r <= 0;
        end
        else begin
            if(valid && s_wbs_we_i && s_wbs_adr_i == ADDR_SIZE)begin
                size_r <= s_wbs_dat_i[4:0];
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            a_base_r <= 0;
        end
        else if (state_r == RESET)begin
            a_base_r <= 0;
        end
        else begin
            if(valid && s_wbs_we_i && s_wbs_adr_i == ADDR_A_BASE)begin
                a_base_r <= s_wbs_dat_i;
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            b_base_r <= 0;
        end
        else if (state_r == RESET)begin
            b_base_r <= 0;
        end
        else begin
            if(valid && s_wbs_we_i && s_wbs_adr_i == ADDR_B_BASE)begin
                b_base_r <= s_wbs_dat_i;
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            c_base_r <= 0;
        end
        else if (state_r == RESET)begin
            c_base_r <= 0;
        end
        else begin
            if(valid && s_wbs_we_i && s_wbs_adr_i == ADDR_C_BASE)begin
                c_base_r <= s_wbs_dat_i;
            end
        end
    end

    // cpu wishbone read
    always@(posedge clk)begin
        if(valid && ~s_wbs_we_i)begin
            if(s_wbs_adr_i == ADDR_AP_CTRL)begin
                s_wbs_dat_o    <= 'b0;
                s_wbs_dat_o[0] <= ap_start_r;
                s_wbs_dat_o[1] <= ap_done_r;
            end
            else if(s_wbs_adr_i == ADDR_A_BASE)begin
                s_wbs_dat_o <= a_base_r;
            end
            else if(s_wbs_adr_i == ADDR_B_BASE)begin
                s_wbs_dat_o <= b_base_r;
            end
            else if(s_wbs_adr_i == ADDR_C_BASE)begin
                s_wbs_dat_o <= c_base_r;
            end
            else if(s_wbs_adr_i == ADDR_SIZE)begin
                s_wbs_dat_o <= size_r;
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            r_valid <= 0;
        end
        else if (state_r == RESET)begin
            r_valid <= 0;
        end
        else begin
            if(valid && ~s_wbs_we_i)begin
                r_valid <= 1;
            end
            else begin
                r_valid <= 0;
            end
        end
    end

    assign s_wbs_ack_o = (valid & s_wbs_we_i) | r_valid;

endmodule