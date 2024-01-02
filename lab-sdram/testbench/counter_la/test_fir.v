`timescale 1ns / 1ps
`define CLOCK 10

module fir_tb ();
    reg         clk;
    reg         rst;
    // wish-bone interface
    reg         wbs_cyc_i;
    reg         wbs_stb_i;
    reg         wbs_we_i;
    reg  [3:0]  wbs_sel_i;
    reg  [31:0] wbs_adr_i;
    reg  [31:0] wbs_dat_i;
    wire        wbs_ack_o;
    wire [31:0] wbs_dat_o;
    // axi-stream interface
    reg         ss_tvalid;
    wire        ss_tready;
    reg  [31:0] ss_tdata;
    reg         ss_tlast;
    reg         sm_tready;
    wire        sm_tvalid;
    wire [31:0] sm_tdata;
    wire        sm_tlast;

    fir fir_DUT(
        .clk      (clk      ),
        .rst      (rst      ),
        // wish-bone interface
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_stb_i(wbs_stb_i),
        .wbs_we_i (wbs_we_i ),
        .wbs_sel_i(wbs_sel_i),
        .wbs_adr_i(wbs_adr_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_ack_o(wbs_ack_o),
        .wbs_dat_o(wbs_dat_o),
        // axi-stream interface
        .ss_tvalid(ss_tvalid),
        .ss_tready(ss_tready),
        .ss_tdata (ss_tdata ),
        .ss_tlast (ss_tlast ),
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata (sm_tdata ),
        .sm_tlast (sm_tlast )
    );


    localparam
        ADDR_AP_CTRL            = 'h20,
        ADDR_TAP_BEGIN          = 'h40,
        ADDR_TAP_END            = 'h6C;



    initial begin
        $dumpfile("test_fir.vcd");
        $dumpvars();
    end

    always #(`CLOCK/2) clk <= (clk === 1'b0);


    initial begin
        rst = 0;
        // delay two cycle
        @(posedge clk);
        @(posedge clk);
        rst = 1;
        @(posedge clk);
        @(posedge clk);
        rst = 0;
    end

    integer timeout = (10000);
    initial begin
        while(timeout > 0) begin
            @(posedge clk);
            timeout = timeout - 1;
        end
        $display($time, "Simualtion Hang ....");
        $finish;
    end

    // simulate golden FIR (hand-crafted 8 data)
	parameter N = 11;
    parameter DATA_LEN = 50;
    integer seed = 20;

	integer i, j;
	reg signed [31:0] fir_tap 	 [0:N-1];
	reg signed [31:0] fir_data   [0:DATA_LEN-1];
	reg signed [31:0] fir_out_gt [0:DATA_LEN-1];

	initial begin
		fir_tap[0]  = 0;
		fir_tap[1]  = -10;
		fir_tap[2]  = -9;
		fir_tap[3]  = 23;
		fir_tap[4]  = 56;
		fir_tap[5]  = 63;
		fir_tap[6]  = 56;
		fir_tap[7]  = 23;
		fir_tap[8]  = -9;
		fir_tap[9]  = -10;
		fir_tap[10] = 0;
		for (i = 0;i < DATA_LEN;i = i + 1) begin
            fir_data[i] = $random(seed) % 300;
			fir_out_gt[i] = 0;
		end
		for (i = 0;i < DATA_LEN ; i = i + 1) begin
			for (j = 0;j < N;j = j + 1) begin
				if (i - j >= 0) begin
					fir_out_gt[i] = fir_out_gt[i] + fir_tap[j] * fir_data[i - j];
				end
			end
			$display("fir_out_gt[%d] = %d (0x%h)", i, fir_out_gt[i], fir_out_gt[i]);
		end
	end

    initial begin
        $display("------------Start simulation-----------");
    end

    // wishbone
    integer k;
    
    
    initial begin
        wbs_cyc_i = 0;
        wbs_stb_i = 0;
        wbs_we_i  = 0;
        wbs_sel_i = 4'b1111;
        wbs_adr_i = 32'h00000000;
        wbs_dat_i = 'hz;

        ss_tvalid = 0;
        ss_tdata  = 'hz;
        ss_tlast  = 0;
        sm_tready = 0;
    end

    reg config_complete;
    
    initial begin
        config_complete = 0;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);


        $display("----Start the tap input (wish-bone)----");
        for (k = 0;k < 11;k = k + 1) begin
            config_write(ADDR_TAP_BEGIN + 4*k, fir_tap[k]);
            reset_write();
        end
        $display("----End the tap input (wish-bone)----");

        $display("----Start the fir (wish-bone)----");
        config_write(ADDR_AP_CTRL, 32'h0000_0001);
        reset_write();

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
            in_d = {$random(seed)} % 0;
            #(`CLOCK * in_d);
            if(in_i == DATA_LEN - 1)begin
                pass_data(fir_data[in_i], 1);
            end
            else begin
                pass_data(fir_data[in_i], 0);
            end
        end
    end

    integer out_i;
    integer out_d;
    initial begin
        wait(config_complete);
        for(out_i = 0 ; out_i < DATA_LEN ; out_i = out_i + 1)begin
            out_d = {$random(seed)} % 0;
            #(`CLOCK * out_d);
            recieve_data();
        end
    end

    task config_write;
        input [31:0]    addr;
        input [31:0]    data;
        begin
            @(posedge clk) #0.1 wbs_stb_i = 1; wbs_cyc_i = 1; wbs_we_i = 1; wbs_dat_i = data; wbs_adr_i = addr;
            wait(wbs_ack_o);
        end
    endtask
    task reset_write;
        begin
            @(posedge clk) #0.1 wbs_stb_i = 0; wbs_cyc_i = 0;
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
        begin
            #0.1 sm_tready = 1;
            wait(sm_tvalid);
            @(posedge clk) #0.1 sm_tready = 0;
        end
    endtask


    // check
    integer error;
    integer l;
    initial begin
        error = 0;
        #150;
        for (l = 0;l < DATA_LEN;l = l + 1) begin
            while (!(sm_tvalid & sm_tready)) @(posedge clk);
            if (sm_tdata !== fir_out_gt[l]) begin
                $display("[ERROR] [Pattern %d] Golden answer: %d, Your answer: %d", l, fir_out_gt[l], $signed(sm_tdata));
                error += 1;
            end
            else begin
                $display("[PASS] [Pattern %d] Golden answer: %d, Your answer: %d", l, fir_out_gt[l], $signed(sm_tdata));
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
