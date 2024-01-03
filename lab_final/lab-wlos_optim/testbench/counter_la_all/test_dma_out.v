`timescale 1 ns / 1 ps
`define CLOCK 10
module test_dma();


    reg clk;
    reg rst;


    always #(`CLOCK/2) clk <= (clk === 1'b0);
    
    initial begin
		$dumpfile("test_dma_out.vcd");
		$dumpvars(0, test_dma);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (250) begin
			repeat (10) @(posedge clk);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test LA (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test LA (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end
    
    localparam
        ADDR_AP_CTRL            = 'h00,
        ADDR_BASED_ADDR         = 'h10,
        ADDR_DATA_LENGTH        = 'h20;

    localparam 
        BAED_ADDR = 8,
        DATA_LEN = 50;

    integer seed = 50;


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

    reg ss_tvalid;
    reg [31:0] ss_tdata;
    reg ss_tlast;
    wire sm_tready;


    initial begin
        s_wbs_stb_i = 0;
        s_wbs_cyc_i = 0;
        s_wbs_we_i = 0;
        s_wbs_dat_i = 0;
        s_wbs_adr_i = 0;
        m_wbs_ack_i = 0;
        m_wbs_dat_i = 'hZ;
        ss_tvalid = 0;
        ss_tdata = 'hZ;
        ss_tlast = 0;
    end

    reg [31:0] in_data[0 : DATA_LEN-1];

    integer i;
    initial begin
        for(i = 0 ; i < DATA_LEN ; i = i + 1)begin
            in_data[i] = i;
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
        for(in_i = 0 ; in_i < DATA_LEN; in_i = in_i + 1)begin
            in_d = {$random(seed)} % 5;
            #(`CLOCK * in_d);
            if(in_i == DATA_LEN - 1)begin
                pass_data(in_data[in_i], 1);
            end
            else begin
                pass_data(in_data[in_i], 0);
            end
        end
    end


    integer out_i;
    integer out_d;
    initial begin
        wait(config_complete);
        for(out_i = 0 ; out_i < DATA_LEN ; out_i = out_i + 1)begin
            out_d = {$random(seed)} % 5;
            #(`CLOCK * out_d);
            recieve_data(0);
        end    
    end

    dma_out dma_out_u0 
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

        // ports like axi_stream ports (from user module, for streaming data)
        .ss_tvalid(ss_tvalid), 
        .ss_tdata(ss_tdata), 
        .ss_tlast(ss_tlast), 
        .ss_tready(ss_tready)
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
        input last;
        begin
            #0.1 ss_tvalid = 1; ss_tdata = data; ss_tlast = last;
            wait(ss_tready);
            @(posedge clk); #0.1 ss_tvalid = 0; ss_tdata = 'hZ; ss_tlast = 0;
        end
    endtask

    task recieve_data;
        input [31:0]  delay;
        begin
            wait(m_wbs_stb_o); wait(m_wbs_cyc_o); wait(m_wbs_we_o);
            #(delay * `CLOCK) #0.1 m_wbs_ack_i = 1;
            @(posedge clk) #0.1 m_wbs_ack_i = 0;
        end
    endtask


    // task pass_and_recieve_data;
    //     input [31:0]    data;
    //     input [31:0]    delay;
    //     begin
    //         wait(ss_tready);
    //         #(delay * `CLOCK) #0.1 ss_tvalid = 1; ss_tdata = data; m_wbs_ack_i = 1; 
    //         @(posedge clk) #0.1 ss_tvalid = 0; ss_tdata = 'hZ; m_wbs_ack_i = 0;
    //     end
    // endtask

    // check
    integer error;
    integer l;
    initial begin
        error = 0;
        #150;
        for (l = 0;l < DATA_LEN;l = l + 1) begin
            while (!(m_wbs_cyc_o & m_wbs_stb_o & m_wbs_we_o & m_wbs_ack_i)) @(posedge clk);
            if (m_wbs_dat_o !== in_data[l]) begin
                $display("[ERROR] [Pattern %d] Golden answer: %d, Your answer: %d", l, $signed(in_data[l]), $signed(m_wbs_dat_o));
                error += 1;
            end
            else begin
                $display("[PASS] [Pattern %d] Golden answer: %d, Your answer: %d", l, $signed(in_data[l]), $signed(m_wbs_dat_o));
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