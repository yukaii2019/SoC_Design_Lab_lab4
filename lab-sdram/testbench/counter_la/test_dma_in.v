`timescale 1 ns / 1 ps
`define CLOCK 10
module test_dma();


    reg clk;
    reg rst;

    // always@(*)begin
    //     #(`CLOCK) clk = ~clk;
    // end
    always #(`CLOCK/2) clk <= (clk === 1'b0);
    
    initial begin
		$dumpfile("test_dma_in.vcd");
		$dumpvars(0, test_dma);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (250) begin
			repeat (10) @(posedge clk);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		$display ("Timeout!!");
		$display("%c[0m",27);
		$finish;
	end
    
    localparam
        ADDR_AP_CTRL            = 'h00,
        ADDR_BASED_ADDR         = 'h10,
        ADDR_DATA_LENGTH        = 'h20;

    localparam 
        BAED_ADDR = 10,
        DATA_LEN = 50;

    integer seed = 10;


    reg s_wbs_stb_i;
    reg s_wbs_cyc_i;
    reg s_wbs_we_i;
    reg [31:0] s_wbs_dat_i; 
    reg [31:0] s_wbs_adr_i;

    wire s_wbs_ack_o;
    wire [31:0] s_wbs_dat_o;

    wire m_wbs_stb_o;
    wire m_wbs_cyc_o;
    wire m_wbs_we_o;
    wire [3:0]  m_wbs_sel_o;
    wire [31:0] m_wbs_dat_o;
    wire [31:0] m_wbs_adr_o;

    reg m_wbs_ack_i;
    reg[31:0] m_wbs_dat_i;

    wire sm_tvalid;
    wire [31:0] sm_tdata;
    wire sm_tlast;
    reg sm_tready;


    initial begin
        s_wbs_stb_i = 0;
        s_wbs_cyc_i = 0;
        s_wbs_we_i = 0;
        s_wbs_dat_i = 0;
        s_wbs_adr_i = 0;
        m_wbs_ack_i = 0;
        m_wbs_dat_i = 'hZ;
        sm_tready = 0;
    end


    reg [31:0] in_data[0 : DATA_LEN-1];

    integer i;
    initial begin
        for(i = 0 ; i < DATA_LEN ; i = i + 1)begin
            in_data [i] = i;
        end
    end
    
    reg config_complete;
    initial begin
        config_complete = 0;
        rst = 0;
        #(`CLOCK * 2.5)
        rst = 1;
        #(`CLOCK * 2)
        rst = 0;

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        
        config_write(ADDR_BASED_ADDR, BAED_ADDR);
        reset_write();

        config_write(ADDR_DATA_LENGTH, DATA_LEN);
        reset_write();

        config_write(ADDR_AP_CTRL, 32'h0000_0001);
        reset_write();

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        config_complete = 1;
    end

    integer in_i;
    integer in_d;

    initial begin
        
        wait(config_complete);
        for(in_i = 0 ; in_i < DATA_LEN ; in_i = in_i + 1)begin
            in_d = {$random(seed)} % 10;
            pass_data(in_data[in_i], in_d);

        end

    end

    integer out_i;
    integer out_d;
    initial begin
        wait(config_complete);
        for(out_i = 0 ; out_i < DATA_LEN ; out_i = out_i + 1)begin
            out_d = {$random(seed)} % 10;
            #(`CLOCK * out_d);
            recieve_data();
        end    
    end

    dma_in dma_in_u0 
    (
        .clk(clk),
        .rst(rst),
        // wb slave interface (from cpu, for control register configuration)
        .s_wbs_stb_i(s_wbs_stb_i),
        .s_wbs_cyc_i(s_wbs_cyc_i),
        .s_wbs_we_i (s_wbs_we_i),
        .s_wbs_sel_i(4'd1),
        .s_wbs_dat_i(s_wbs_dat_i),
        .s_wbs_adr_i(s_wbs_adr_i),
        .s_wbs_ack_o(s_wbs_ack_o),
        .s_wbs_dat_o(s_wbs_dat_o),
        // wb master interface (to sdram)
        .m_wbs_stb_o(m_wbs_stb_o),
        .m_wbs_cyc_o(m_wbs_cyc_o),
        .m_wbs_we_o (m_wbs_we_o ),
        .m_wbs_sel_o(m_wbs_sel_o),
        .m_wbs_dat_o(m_wbs_dat_o),
        .m_wbs_adr_o(m_wbs_adr_o),
        .m_wbs_ack_i(m_wbs_ack_i),
        .m_wbs_dat_i(m_wbs_dat_i),
        // ports like axi_stream ports (to user module, for streaming data)
        .sm_tvalid(sm_tvalid), 
        .sm_tdata (sm_tdata ), 
        .sm_tlast (sm_tlast ), 
        .sm_tready(sm_tready)
    );

    task config_write;
        input [31:0]    addr;
        input [31:0]    data;
        begin
            @(posedge clk) #0.1 s_wbs_stb_i = 1; s_wbs_cyc_i = 1; s_wbs_we_i = 1; s_wbs_dat_i = data; s_wbs_adr_i = addr;
            wait(s_wbs_ack_o);
        end
    endtask
    task reset_write;
        begin
            @(posedge clk) #0.1 s_wbs_stb_i = 0; s_wbs_cyc_i = 0;
        end
    endtask


    
    task pass_data;
        input [31:0]    data;
        input [31:0]    delay;
        begin
            wait(m_wbs_stb_o); wait(m_wbs_cyc_o);
            #(delay * `CLOCK) #0.1 m_wbs_ack_i = 1; m_wbs_dat_i = in_data[m_wbs_adr_o-BAED_ADDR];
            @(posedge clk); #0.1 m_wbs_ack_i = 0; m_wbs_dat_i = 'hZ;
        end
    endtask


    task recieve_data;
        begin
            #0.1 sm_tready = 1; 
            wait(sm_tvalid);
            @(posedge clk) #0.1 sm_tready = 0;
        end
    endtask


    // task pass_and_recieve_data;
    //     input [31:0]    data;
    //     input [31:0]    delay;
    //     begin
    //         wait(m_wbs_stb_o); wait(m_wbs_cyc_o);
    //         #(delay * `CLOCK) #0.1 m_wbs_ack_i = 1; m_wbs_dat_i = data; sm_tready = 1; 
    //         @(posedge clk); #0.1 m_wbs_ack_i = 0; m_wbs_dat_i = 'hZ; sm_tready = 0;
    //     end
    // endtask
    


    // check
    integer error;
    integer l;
    initial begin
        error = 0;
        #150;
        for (l = 0;l < DATA_LEN;l = l + 1) begin
            while (!(sm_tvalid & sm_tready)) @(posedge clk);
            if (sm_tdata !== in_data[l]) begin
                $display("[ERROR] [Pattern %d] Golden answer: %d, Your answer: %d", l, $signed(in_data[l]), $signed(sm_tdata));
                error += 1;
            end
            else begin
                $display("[PASS] [Pattern %d] Golden answer: %d, Your answer: %d", l, $signed(in_data[l]), $signed(sm_tdata));
            end
            if(l == DATA_LEN -1)begin
                if(sm_tlast === 0)begin
                    $display("[ERROR] sm_tlast not correct");
                    error += 1;
                end
            end
            @(posedge clk);
        end
        if (error == 0) begin
            $display("---------------------------------------------");
            $display("-----------Congratulations! Pass-------------");
        end
        else begin
            $display("--------Simulation Failed---------");
        end
        #100;
        $finish;
    end


    

endmodule