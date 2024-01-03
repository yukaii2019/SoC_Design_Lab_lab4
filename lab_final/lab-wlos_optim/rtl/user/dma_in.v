module dma_in 
(
    input   clk,
    input   rst,
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
    input [31:0]  m_wbs_dat_i,
    // ports like axi_stream ports (to user module, for streaming data)
    output        sm_tvalid, 
    output [31:0] sm_tdata, 
    output        sm_tlast, 
    input         sm_tready
);
    localparam
        ADDR_AP_CTRL            = 'h00,
        ADDR_BASED_ADDR         = 'h10,
        ADDR_DATA_LENGTH        = 'h20,

        IDLE                   = 'd0,
        DATA                   = 'd1,
        RESET                  = 'd3;

    localparam data_buf_size = 4; // support only 2 to power of n
    localparam state_bit = 3;

    reg [state_bit-1:0] state_r, state_w;
    
    wire in_state_data = state_r == DATA;
    
    wire valid = s_wbs_stb_i & s_wbs_cyc_i;

    reg [31:0] data_buf_r [0: data_buf_size-1];
    reg [$clog2(data_buf_size)-1: 0] write_p_r;
    reg [$clog2(data_buf_size)-1: 0] read_p_r;

    reg [$clog2(data_buf_size): 0] top_p_r;
    wire data_buf_empty = top_p_r == {($clog2(data_buf_size)+1){1'b1}};
    wire data_buf_full  = top_p_r == data_buf_size-1;
    
    reg [31:0] data_cnt_r;
    
    integer i;
    always@(posedge clk)begin
        if(rst)begin
            top_p_r <= -1;
        end
        else if (state_r == RESET)begin
            top_p_r <= -1;
        end
        else begin
            if(m_wbs_ack_i & sm_tready)begin
                if(data_buf_empty)begin
                    top_p_r = top_p_r + 1; 
                end
            end
            else if(m_wbs_ack_i & ~sm_tready & ~data_buf_full)begin
                top_p_r <= top_p_r + 1;
            end
            else if (~m_wbs_ack_i & sm_tready & ~data_buf_empty)begin
                top_p_r <= top_p_r - 1;
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            write_p_r <= 0;
        end 
        else if (state_r == RESET)begin
            write_p_r <= 0;
        end
        else begin
            if(m_wbs_ack_i & ~data_buf_full)begin
                write_p_r <= write_p_r + 1;
            end
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            read_p_r <= 0;
        end 
        else if (state_r == RESET)begin
            read_p_r <= 0;
        end
        else begin
            if(sm_tvalid & sm_tready)begin
                read_p_r <= read_p_r + 1;
            end
        end
    end

    always@(posedge clk)begin
        for(i = 0 ; i < data_buf_size ; i = i + 1)begin
            data_buf_r[i] <= data_buf_r[i];
        end
        if(m_wbs_ack_i & ~data_buf_full)begin
            data_buf_r[write_p_r] <= m_wbs_dat_i;
        end
    end

    // if the buffer is empty, bypass data
    //assign sm_tdata = (m_wbs_ack_i && sm_tready && data_buf_empty) ? m_wbs_dat_i : data_buf_r[read_p_r];
    assign sm_tdata = data_buf_r[read_p_r];
    //assign sm_tvalid = (m_wbs_ack_i & sm_tready & data_buf_empty) | (sm_tready & ~data_buf_empty);
    assign sm_tvalid = ~data_buf_empty;

    // assign sm_tlast = ((data_cnt_r == data_length_r-1) &  (m_wbs_ack_i & sm_tready & data_buf_empty)) | 
                    //   ((data_cnt_r == data_length_r) &  (top_p_r == 0 && sm_tready)); 
    
    assign sm_tlast = (data_cnt_r == data_length_r) & top_p_r == 0; 


    // write port not used
    // =========================
    assign m_wbs_we_o = 0;
    assign m_wbs_dat_o = 0;
    assign m_wbs_sel_o = {4{1'd1}};
    // =========================

    assign m_wbs_cyc_o = ~data_buf_full & in_state_data;
    assign m_wbs_stb_o = m_wbs_cyc_o;
    assign m_wbs_adr_o = {data_cnt_r[29:0], 2'd0} + based_addr_r;


    
    always@(posedge clk)begin
        if(rst)begin
            data_cnt_r <= 0;
        end
        else if (state_r == RESET)begin
            data_cnt_r <= 0;
        end
        else begin
            if(in_state_data && m_wbs_ack_i)begin
                data_cnt_r <= data_cnt_r + 1;
            end
        end
    end

    always@(*)begin
        case(state_r)
            IDLE:begin
                state_w = (ap_start_r)? DATA : IDLE;
            end
            DATA:begin
                state_w = (sm_tlast & sm_tvalid & sm_tready) ? RESET : DATA;
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


    reg ap_start_r;
    reg [31:0] data_length_r;
    reg [31:0] based_addr_r;
    reg r_valid;

    // write logic
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
            data_length_r <= 0;
        end
        else if (state_r == RESET)begin
            data_length_r <= 0;
        end
        else begin
            if(valid && s_wbs_we_i && s_wbs_adr_i == ADDR_DATA_LENGTH)begin
                data_length_r <= s_wbs_dat_i;
            end
        end
    end
    always@(posedge clk)begin
        if(rst)begin
            based_addr_r <= 0;
        end
        else if (state_r == RESET)begin
            based_addr_r <= 0;
        end
        else begin
            if(valid && s_wbs_we_i && s_wbs_adr_i == ADDR_BASED_ADDR)begin
                based_addr_r <= s_wbs_dat_i;
            end
        end
    end


    // read logic
    always@(posedge clk)begin
        if(valid && ~s_wbs_we_i)begin
            if(s_wbs_adr_i == ADDR_AP_CTRL)begin
                s_wbs_dat_o    <= 'b0;
                s_wbs_dat_o[0] <= ap_start_r;
            end
            else if(s_wbs_adr_i == ADDR_BASED_ADDR)begin
                s_wbs_dat_o <= based_addr_r;
            end
            else if(s_wbs_adr_i == ADDR_DATA_LENGTH)begin
                s_wbs_dat_o <= data_length_r;
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