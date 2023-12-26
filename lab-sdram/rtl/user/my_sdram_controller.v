module sdram_controller (
        input   clk,
        input   rst,

        // these signals go directly to the IO pins
        // output  sdram_clk,
        output  sdram_cle,
        output  sdram_cs,
        output  sdram_cas,
        output  sdram_ras,
        output  sdram_we,
        output  sdram_dqm,
        output  [1:0]  sdram_ba,
        output  [12:0] sdram_a,
        // Jiin: split dq into dqi (input) dqo (output)
        // inout [7:0] sdram_dq,
        input   [31:0] sdram_dqi,
        output  [31:0] sdram_dqo,

        // User interface
        // Note: we want to remap addr (see below)
        // input [22:0] addr,       // address to read/write
        input   [22:0] user_addr,   // the address will be remap to addr later
        input   rw,                 // 1 = write, 0 = read
        input   [31:0] data_in,     // data from a read
        output  [31:0] data_out,    // data for a write
        output  busy,     // unsed now          // controller is busy when high
        input   in_valid,           // pulse high to initiate a read/write
        output  out_valid           // pulses high when data from read is valid
    );

    // Jiin: SDRAM Timing  3-3-3, i.e. CASL=3, PRE=3, ACT=3
    localparam tCASL            = 2;       // 3T actually
    localparam tPRE             = 2;       // 3T
    localparam tACT             = 2;       // 3T
    localparam tREF             = 6;       // 7T
    localparam tRef_Counter     = 750;     // 
    localparam PREFETCH_NUM     = 3; // include the first data 
    localparam tREAD            = tCASL + PREFETCH_NUM; 

    `define BA      9:8
    `define RA      22:10
    `define CA      7:0

    // Commands for the SDRAM
    localparam CMD_UNSELECTED    = 4'b1000;
    localparam CMD_NOP           = 4'b0111;
    localparam CMD_ACTIVE        = 4'b0011;
    localparam CMD_READ          = 4'b0101;
    localparam CMD_WRITE         = 4'b0100;
    localparam CMD_TERMINATE     = 4'b0110;
    localparam CMD_PRECHARGE     = 4'b0010;
    localparam CMD_REFRESH       = 4'b0001;
    localparam CMD_LOAD_MODE_REG = 4'b0000;
    
    localparam STATE_SIZE = 4;
    localparam INIT = 4'd0,
               WAIT = 4'd1,
               PRECHARGE_INIT = 4'd2,
               REFRESH_INIT_1 = 4'd3,
               REFRESH_INIT_2 = 4'd4,
               LOAD_MODE_REG = 4'd5,
               IDLE = 4'd6,
               REFRESH = 4'd7,
               ACTIVATE = 4'd8,
               READ = 4'd9,
               READ_RES = 4'd10,
               WRITE = 4'd11,
               PRECHARGE = 4'd12;
    
    integer i;


    wire [12:0] Mapped_RA;
    wire [1:0]  Mapped_BA;
    wire [7:0]  Mapped_CA;
    wire [22:0] addr;

    // reg ready_d, ready_q;

    // reg        saved_rw_q;
    // reg [22:0] saved_addr_q;
    // reg [31:0] saved_data_q;

    

    reg        cle_q;
    reg [3:0]  cmd_d,   cmd_q;
    reg [1:0]  ba_d,    ba_q;
    reg [12:0] a_d,     a_q;
    // reg        dq_en_q;
    reg [31:0] dq_q;
    reg        dqm_q;
    
    reg[15:0] delay_cnt_q, delay_cnt_d;


    reg [15:0] delay_ctr_d, delay_ctr_q;
    reg [STATE_SIZE-1:0] state_d, state_q;
    reg [STATE_SIZE-1:0] next_state_d, next_state_q;



    reg [9:0] refresh_ctr_d, refresh_ctr_q;
    reg       refresh_flag_d, refresh_flag_q;    



    reg [31:0] dqi_q;
    reg [31:0] data_q;
    reg        out_valid_q;
    

    reg [2:0]  precharge_bank_d, precharge_bank_q;
    reg [3:0]  row_open_d, row_open_q;
    reg [12:0] row_addr_d[3:0], row_addr_q[3:0];
    

    assign Mapped_RA = user_addr[`RA];
    assign Mapped_BA = user_addr[`BA];
    assign Mapped_CA = user_addr[`CA];
    assign addr = {Mapped_RA, Mapped_BA, Mapped_CA};

    // always@(*)begin
    //     if(state_q == INIT)begin
    //         ready_d = 1;
    //     end
    //     else begin
    //         if(state_q == IDLE && ~refresh_flag_q && ~ready_q)begin
    //             ready_d = 1;
    //         end
    //         else begin
    //             ready_d = (ready_q && in_valid)? 1'b0 : ready_q; 
    //         end
    //     end
    // end

    // always@(posedge clk)begin
    //     if(rst) begin
    //         ready_q <= 1'b0;
    //     end 
    //     else begin
    //         ready_q <= ready_d;
    //     end
    // end

    // assign busy = !ready_q;

    // always@(posedge clk)begin
    //     // if(ready_q && in_valid)begin
    //     if(in_valid)begin
    //         saved_addr_q <= addr;
    //         saved_rw_q   <= rw;
    //         saved_data_q <= data_in;
    //     end
    // end

    // clock enable for SDRAM
    // follow TA's implementation.
    always@(posedge clk)begin
        if(rst)begin
            cle_q <= 1'b0;
        end
        else begin
            cle_q   <= (state_q == INIT)  ? 1'b1 : cle_q;
        end
    end

    always@(*)begin
        case(state_q)
            REFRESH: begin
                cmd_d = CMD_REFRESH;
            end
            ACTIVATE: begin
                cmd_d = CMD_ACTIVE;
            end
            READ: begin
                cmd_d = CMD_READ;
            end
            WRITE: begin
                cmd_d = CMD_WRITE;
            end
            PRECHARGE: begin
                cmd_d = CMD_PRECHARGE;
            end
            default:begin
                cmd_d = CMD_NOP;
            end
        endcase
    end

    always@(*)begin
        case(state_q)
            INIT: begin
                a_d = {3'b000, 1'b0, 2'b00, 3'b010, 1'b0, 3'b010}; //010
                ba_d = 2'b0;
            end
            ACTIVATE: begin
                a_d = addr[`RA];
                ba_d = addr[`BA];
            end
            READ: begin
                a_d = {2'b0, 1'b0, addr[`CA], 2'b0} + {delay_cnt_q, 2'd0, 2'd0};
                ba_d = addr[`BA];
            end
            WRITE: begin
                a_d = {2'b0, 1'b0, addr[`CA], 2'b00};
                ba_d = addr[`BA];
            end
            PRECHARGE: begin
                a_d[10] = precharge_bank_q[2]; // all banks
                ba_d = precharge_bank_q[1:0];
            end
            default:begin
                a_d = 0;
                ba_d = 0;
            end
        endcase
    end

    always@(posedge clk)begin
        cmd_q <= cmd_d;
        ba_q <= ba_d;
        a_q <= a_d;
    end

    // always@(posedge clk)begin
    //     if(rst)begin
    //         dq_en_q <= 1'b0;
    //     end
    //     else begin
    //         dq_en_q <= (state_q == WRITE) ? 1'b1 : 1'b0;;
    //     end
    // end

    always@(posedge clk)begin
        dq_q <= data_in;
        // dq_q <= (state_q == WRITE) ? data_in : dq_q;
    end

    // unknown signal
    always@(posedge clk)begin
        dqm_q <= 1'b0;
    end 


    // Output assignments
    assign sdram_cle = cle_q;
    assign sdram_cs  = cmd_q[3];
    assign sdram_ras = cmd_q[2];
    assign sdram_cas = cmd_q[1];
    assign sdram_we  = cmd_q[0];
    assign sdram_ba  = ba_q;
    assign sdram_a   = a_q;
    assign sdram_dqm = dqm_q;
    //assign sdram_dqo = (dq_en_q) ? dq_q : 32'hZZZZZZZZ;
    assign sdram_dqo = dq_q;

    

    always@(posedge clk)begin
        delay_cnt_q <= delay_cnt_d; 
    end

    // always@(posedge clk)begin
    //     if(state_q == IDLE && refresh_flag_q)begin
    //         ref_q <= 1;
    //     end
    //     else if (state_q == REFRESH)begin
    //         ref_q <= 0;
    //     end
    // end

    // always@(*)begin
    //     case(state_q)
    //         INIT: begin
    //             state_d = IDLE;
    //             delay_cnt_d = 0; 
    //         end
    //         IDLE: begin
    //             if (refresh_flag_q) begin
    //                 state_d = PRECHARGE;
    //             end 
    //             else if (!ready_q) begin // operation waiting
    //                 if (row_open_q[saved_addr_q[`BA]]) begin // if the row is open we don't have to activate it
    //                     if (row_addr_q[saved_addr_q[`BA]] == saved_addr_q[`RA]) begin // Row is already open
    //                         state_d = (saved_rw_q) ? WRITE : READ; 
    //                     end
    //                     else begin                   // A different row in the bank is open
    //                         state_d = PRECHARGE;     // precharge open row
    //                     end
    //                 end 
    //                 else begin
    //                     state_d = ACTIVATE; // no rows open
    //                 end
    //             end
    //             else begin
    //                 state_d = IDLE;
    //             end
    //             delay_cnt_d = 0; 
    //         end

    //         REFRESH: begin
    //             if(delay_cnt_q == tREF)begin
    //                 state_d     = IDLE;
    //                 delay_cnt_d = 0; 
    //             end
    //             else begin
    //                 state_d = REFRESH;
    //                 delay_cnt_d = delay_cnt_q + 1; 
    //             end
    //         end

    //         ACTIVATE: begin
    //             if(delay_cnt_q == tACT)begin
    //                 state_d = (rw_op_q) ? WRITE : READ;
    //                 delay_cnt_d = 0; 
    //             end
    //             else begin
    //                 state_d = ACTIVATE; 
    //                 delay_cnt_d = delay_cnt_q + 1;  
    //             end
    //         end

    //         READ: begin
    //             if(delay_cnt_q == tCASL)begin
    //                 state_d = READ_RES;
    //                 delay_cnt_d = 0; 
    //             end
    //             else begin
    //                 state_d = READ; 
    //                 delay_cnt_d = delay_cnt_q + 1;  
    //             end
    //         end

    //         PRECHARGE: begin
    //             if(delay_cnt_q == tPRE)begin
    //                 state_d = (ref_q)? REFRESH : ACTIVATE;
    //                 delay_cnt_d = 0; 
    //             end
    //             else begin
    //                 state_d = PRECHARGE; 
    //                 delay_cnt_d = delay_cnt_q + 1;  
    //             end
    //         end  

    //         READ_RES: begin
    //             state_d = IDLE;
    //             delay_cnt_d = 0;
    //         end

    //         WRITE: begin
    //             state_d = IDLE;
    //             delay_cnt_d = 0;
    //         end


    //     endcase
    // end

    // always @(posedge clk) begin
    //     if(rst) begin
    //         state_q <= INIT;
    //     end 
    //     else begin
    //         state_q <= state_d;
    //     end
    // end

    always@(*)begin
        delay_ctr_d = delay_ctr_q;
        case(state_q)
            INIT: begin
                delay_ctr_d = 16'd0;
            end
            WAIT: begin
                delay_ctr_d = delay_ctr_q - 1'b1;
            end
            REFRESH: begin
                delay_ctr_d = tREF;
            end
            ACTIVATE: begin
                delay_ctr_d = tACT;
            end
            READ: begin
                delay_ctr_d = tCASL; 
            end
            PRECHARGE: begin
                delay_ctr_d = tPRE;
            end
        endcase
    end
    always@(posedge clk)begin
        delay_ctr_q <= delay_ctr_d;
    end

    reg [20:0] pref_based_addr_q, pref_based_addr_d;

    always@(posedge clk)begin
        pref_based_addr_q <= pref_based_addr_d;
    end




    always@(*)begin
        delay_cnt_d = delay_cnt_q;
        pref_based_addr_d = pref_based_addr_q;
        next_state_d = next_state_q;
        state_d = state_q;

        case (state_q)
            INIT: begin
                state_d = IDLE;
                pref_based_addr_d = 0;
            end
            WAIT: begin
                state_d = (delay_ctr_q == 13'd0) ? next_state_q : state_q;
                delay_cnt_d = 0; 
            end
            IDLE: begin
                if (refresh_flag_q) begin
                    state_d = PRECHARGE;
                    next_state_d = REFRESH;
                end 
                else if (in_valid)begin
                    if(~rw && in_pref_buf_flg)begin
                        state_d = IDLE;
                        delay_cnt_d = delay_cnt_q + 1; 
                    end
                    else if (row_open_q[addr[`BA]]) begin // if the row is open we don't have to activate it
                        if (row_addr_q[addr[`BA]] == addr[`RA]) begin // Row is already open
                            state_d = (rw) ? WRITE : READ; 
                            delay_cnt_d = 0; 
                        end
                        else begin // A different row in the bank is open
                            state_d = PRECHARGE; // precharge open row
                            next_state_d = ACTIVATE; // open current row
                        end
                    end 
                    else begin
                        state_d = ACTIVATE; // no rows open
                    end
                end
            end
            REFRESH: begin
                state_d = WAIT;
                next_state_d = IDLE;
            end

            ACTIVATE: begin
                state_d = WAIT;
                next_state_d = (rw) ? WRITE : READ;
            end

            READ: begin
                pref_based_addr_d = addr[22:2];
                if(delay_cnt_q == tREAD)begin
                    //state_d = READ_RES; 
                    state_d = IDLE; 
                end
                else begin
                    state_d = READ; 
                   
                end
                delay_cnt_d = delay_cnt_q + 1; 
                 
                // next_state_d = READ_RES;
            end
            
            PRECHARGE: begin
                state_d = WAIT;
            end  

            // READ_RES: begin
            //     state_d = IDLE;
            // end

            WRITE: begin
                state_d = IDLE;
            end
        endcase
    end
    always @(posedge clk) begin
        if(rst) begin
            state_q <= INIT;
        end 
        else begin
            state_q <= state_d;
        end
    end
    always@(posedge clk)begin
        next_state_q <= next_state_d;
    end
    


    always@(*)begin
        if(state_q == INIT)begin
            refresh_ctr_d  = 1;
            refresh_flag_d = 0;
        end
        else begin
            refresh_ctr_d = (refresh_ctr_q > tRef_Counter) ? 0 : refresh_ctr_q + 1;
            if(state_q == IDLE && refresh_flag_q)begin // reflesh only when IDLE
                refresh_flag_d = 0; // deassert the flag
            end
            else begin
                refresh_flag_d = (refresh_ctr_q > tRef_Counter) ? 1'b1 : refresh_flag_q; 
            end
        end
    end
    always@(posedge clk)begin
        refresh_flag_q <= refresh_flag_d;
        refresh_ctr_q <= refresh_ctr_d;
    end



    // always@(*)begin
    //     data_d = data_q; 
    //     // addr_d = addr_q;
    //     out_valid_d = 1'b0;
    //     // precharge_bank_d = precharge_bank_q;
    //     // rw_op_d = rw_op_q;

    //     if(state_q == IDLE)begin
    //         if(refresh_flag_q)begin
    //             // precharge_bank_d = 3'b100; // all banks
    //         end


    //         else if(~ready_q)begin
                
    //             // addr_d = saved_addr_q;
    //             // rw_op_d = saved_rw_q;

    //             // if(saved_rw_q)begin
    //             //     data_d = saved_data_q;
    //             // end
    //             if (row_open_q[saved_addr_q[9:8]]) begin
    //                 if (~(row_addr_q[saved_addr_q[9:8]] == saved_addr_q[22:10])) begin
    //                     // precharge_bank_d = {1'b0, saved_addr_q[9:8]};
    //                 end             
    //             end
    //         end
    //     end
    //     else if(state_q == READ_RES)begin
    //         data_d = dqi_q; // data_d by pass 
    //         out_valid_d = 1;
    //     end  
    // end


    reg [31:0] prefetch_buf[0:PREFETCH_NUM-1];

    // reg [31:0] prefetch_buf_0;
    // reg [31:0] prefetch_buf_1;
    // reg [31:0] prefetch_buf_2;
    // reg [31:0] prefetch_buf_3;

    reg [$clog2(PREFETCH_NUM)-1:0] pref_cnt;
    reg pref_flg;
    
    wire in_pref_buf_flg;
    wire [20:0] addr_diff;
    wire read_valid;

    assign in_pref_buf_flg  =  (addr_diff < PREFETCH_NUM) && (addr_diff >= 0);
    assign addr_diff = addr[22:2] - pref_based_addr_q;
    assign read_valid = delay_cnt_q >= tREAD;
    
    always@(posedge clk)begin
        if(delay_cnt_q == tCASL + 1)begin
            // dqi_q <= sdram_dqi;
            pref_cnt <= 1;
            pref_flg <= 1;
            prefetch_buf[0] <= sdram_dqi;
        end
        else if (pref_flg == 1)begin
            // case(pref_cnt)
            //     1:begin
            //         prefetch_buf_1 <= sdram_dqi;
            //     end
            //     2:begin
            //         prefetch_buf_2 <= sdram_dqi;
            //     end
            //     3:begin
            //         prefetch_buf_3 <= sdram_dqi;
            //     end
            // endcase
            prefetch_buf[pref_cnt] <= sdram_dqi;
            pref_cnt <= pref_cnt + 1;
            if(pref_cnt == PREFETCH_NUM-1)begin
                pref_flg <= 0;
            end
        end
    end


    always@(posedge clk)begin
        // if(state_q == IDLE && ready_q && in_pref_buf_flg && ~rw)begin
        //     // case(addr_diff)
        //     //     1:begin
        //     //         data_q <= prefetch_buf_1;
        //     //     end
        //     //     2:begin
        //     //         data_q <= prefetch_buf_2;
        //     //     end
        //     //     3:begin
        //     //         data_q <= prefetch_buf_3;
        //     //     end
        //     // endcase
        //     data_q<=prefetch_buf[addr_diff[1:0]];
        //     out_valid_q <= 0;
        // end
        // else if (state_q == READ && delay_cnt_q == tCASL+2) begin
        //     data_q <= dqi_q;
        //     out_valid_q <= 1;
        // end
        // else begin
        //     data_q <= data_q;
        //     out_valid_q <= 0;
        // end


        // data_q <= (state_q == READ && delay_cnt_q == tCASL+2)? dqi_q : data_q;
        out_valid_q <= (state_q == READ && delay_cnt_q == tCASL+2)? 1: 0;
        // data_q <= (state_q == READ_RES)? dqi_q : data_q;
        // out_valid_q <= (state_q == READ_RES)? 1: 0;
    end

    assign data_out = prefetch_buf[addr_diff[1:0]];   
    // assign data_out = data_q;   
    // assign out_valid = (in_valid && ~rw && in_pref_buf_flg) ? 1 : out_valid_q | (state_q == WRITE);
    assign out_valid = (in_valid & ~rw & in_pref_buf_flg & read_valid) | (state_q == WRITE); 
    // wire out_valid_test = (in_valid & ~rw & in_pref_buf_flg & read_valid) | (state_q == WRITE); 
    // assign out_valid = out_valid_q;


    always@(*)begin
        if(state_q == IDLE && refresh_flag_q)begin
            precharge_bank_d = 3'b100; // all banks
        end
        else if(row_open_q[addr[`BA]] && ~(row_addr_q[addr[`BA]] == addr[`RA])) begin
            precharge_bank_d = {1'b0, addr[9:8]}; 
        end
        else begin
            precharge_bank_d = precharge_bank_q;
        end
    end
    always@(posedge clk)begin
        precharge_bank_q <= precharge_bank_d;
    end


    always@(*)begin
        row_open_d = row_open_q;
        for (i = 0; i < 4; i = i + 1)begin
            row_addr_d[i] = row_addr_q[i];
        end

        if(state_q == INIT)begin
            row_open_d = 4'b0;
        end
        else if(state_q == ACTIVATE)begin
            row_open_d[addr[`BA]] = 1'b1; // row is now open
            row_addr_d[addr[`BA]] = addr[`RA];
        end
        else if (state_q == PRECHARGE)begin
            if (precharge_bank_q[2]) begin
                row_open_d = 4'b0000; // closed all rows
            end 
            else begin
                row_open_d[precharge_bank_q[1:0]] = 1'b0; // closed one row
            end 
        end
    end
    always@(posedge clk)begin
        row_open_q <= row_open_d;
        for (i = 0; i < 4; i = i + 1)
            row_addr_q[i] <= row_addr_d[i];
    end




    
endmodule