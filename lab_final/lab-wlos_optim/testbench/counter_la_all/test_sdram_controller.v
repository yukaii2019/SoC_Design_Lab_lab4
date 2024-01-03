`timescale 1 ns / 1 ps
`define CLOCK 10
module test_sdram_controller();

    reg clk;
    reg rst;

    always #(`CLOCK/2) clk <= (clk === 1'b0);
    
    initial begin
		$dumpfile("test_sdram_controller.vcd");
		$dumpvars(0, test_sdram_controller);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (250) begin
			repeat (1000) @(posedge clk);
			repeat (1000) @(posedge clk);
			repeat (1000) @(posedge clk);
			repeat (1000) @(posedge clk);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		$display ("Timeout!!");
		$display("%c[0m",27);
		$finish;
	end
    assign rst_n = ~rst;



    reg wbs_stb_i;
    reg wbs_cyc_i;
    reg wbs_we_i;
    reg [31:0]wbs_dat_i;
    reg [31:0]wbs_adr_i;
    wire wbs_ack_o;
    wire [31:0]wbs_dat_o;
    reg [3:0]wbs_sel_i;


    initial begin
        wbs_stb_i = 0;
        wbs_cyc_i = 0;
        wbs_we_i = 0;
        wbs_dat_i = 0;
        wbs_adr_i = 0;
        wbs_sel_i = 4'b1111;
    end


    
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
    wire [3:0]  bram_mask;

    wire [31:0] ctrl_addr;
    wire ctrl_busy;
    wire ctrl_in_valid, ctrl_out_valid;


    assign  ctrl_in_valid = wbs_stb_i && wbs_cyc_i;
    assign wbs_ack_o = ctrl_out_valid; 
    assign bram_mask = wbs_sel_i & {4{wbs_we_i}};
    assign ctrl_addr = wbs_adr_i;

    localparam 
        DATA_BASED_ADDR = 'h3800_0000,
        DATA_LEN = 200;
    integer seed = 10;

    reg [31:0] in_data[0 : DATA_LEN-1];

    integer i;
    initial begin
        for(i = 0 ; i < DATA_LEN ; i = i + 1)begin
            in_data [i] = i+1;
        end
    end

    integer in_i;
    integer out_i;

    reg[31:0] rand_addr;
    
    
    integer in_d;


    initial begin
        rst = 0;
        #(`CLOCK * 2.5)
        rst = 1;
        #(`CLOCK * 2)
        rst = 0;

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);

        for(in_i = 0 ; in_i < DATA_LEN ; in_i = in_i + 1)begin
            in_d = {$random(seed)} %10 + 100;
            #(`CLOCK * in_d);
            pass_data(in_data[in_i], DATA_BASED_ADDR + in_i*4);

            // in_d = 0;
            // // in_d = 2;
            // #(`CLOCK * in_d);
            // // rand_addr = {$random(seed)} % DATA_LEN; 
            // rand_addr = in_i;
            // recieve_data(DATA_BASED_ADDR + rand_addr*4);

        end

        // in_i = 0;
        // pass_data(in_data[in_i], DATA_BASED_ADDR + in_i*4);
        // in_i = 1;
        // pass_data(in_data[in_i], DATA_BASED_ADDR + in_i*4);
        // rand_addr = 1;
        // recieve_data(DATA_BASED_ADDR + rand_addr*4);
        // in_i = 0;
        // pass_data(20, DATA_BASED_ADDR + in_i*4);
        // rand_addr = 0;
        // recieve_data(DATA_BASED_ADDR + rand_addr*4);

        // in_i = 2;
        // pass_data(in_data[in_i], DATA_BASED_ADDR + in_i*4);
        // in_i = 3;
        // pass_data(in_data[in_i], DATA_BASED_ADDR + in_i*4);

        repeat (250) begin 
			repeat (20) @(posedge clk);
        end

        for(out_i = 0 ; out_i < DATA_LEN ; out_i = out_i + 1)begin
            // in_d = {$random(seed)} %5;
            in_d = 0;
            #(`CLOCK * in_d);
            // rand_addr = {$random(seed)} % DATA_LEN; 
            rand_addr = out_i;
            recieve_data(DATA_BASED_ADDR + rand_addr*4);
        end
    end

    task pass_data;
        input [31:0]    data;
        input [31:0]    addr;
        begin
            #0.1 wbs_stb_i = 1; wbs_cyc_i= 1; wbs_we_i = 1; wbs_dat_i = data; wbs_adr_i = addr;
            #0.1 wait(wbs_ack_o);
            @(posedge clk); #0.1 wbs_stb_i = 0; wbs_cyc_i = 0; wbs_we_i = 0;wbs_dat_i = 'hZ;
        end
    endtask

    task recieve_data;
        input [31:0]  addr;
        begin
            #0.1 wbs_stb_i = 1; wbs_cyc_i= 1; wbs_we_i = 0; wbs_dat_i = 'hZ; wbs_adr_i = addr;
            #0.1 wait(wbs_ack_o);
            @(posedge clk) #0.1 wbs_stb_i = 0; wbs_cyc_i = 0; 
        end
    endtask

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

        .user_addr(ctrl_addr),
        .rw(wbs_we_i),
        .data_in(wbs_dat_i),
        .data_out(wbs_dat_o),
        .busy(ctrl_busy),
        .in_valid(ctrl_in_valid),
        .out_valid(ctrl_out_valid)
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
        .Dqm(bram_mask),
        .Dqi(c2d_data),
        .Dqo(d2c_data)
    );

    integer error;
    integer l;
    initial begin
        error = 0;
        #150;
        for (l = 0;l < DATA_LEN;l = l + 1) begin
            while (!(wbs_cyc_i & wbs_stb_i & ~wbs_we_i & wbs_ack_o)) @(posedge clk);
            if (wbs_dat_o !== in_data[(wbs_adr_i - DATA_BASED_ADDR)/4]) begin
                $display("[ERROR] [Pattern %d] Golden answer: %d, Your answer: %d", l, $signed(in_data[(wbs_adr_i - DATA_BASED_ADDR)/4]), $signed(wbs_dat_o));
                error += 1;
            end
            else begin
                $display("[PASS] [Pattern %d] Golden answer: %d, Your answer: %d", l, $signed(in_data[(wbs_adr_i - DATA_BASED_ADDR)/4]), $signed(wbs_dat_o));
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