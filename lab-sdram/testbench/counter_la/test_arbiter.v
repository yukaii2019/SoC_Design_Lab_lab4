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
		$dumpfile("test_arbiter.vcd");
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
    
    reg [2:0] req;
    wire[2:0] gnt;
    sub_arbiter sub_arbiter_U0(
        .clk(clk),
        .rst(rst),
        .req(req),
        .gnt(gnt)
    ); 


    initial begin
        rst = 0;
        #(`CLOCK * 2.5)
        rst = 1;
        #(`CLOCK * 2)
        rst = 0;
        req = 3'b000;
        @(posedge clk) #0.1 req = 3'b000; 
        @(posedge clk) #0.1 req = 3'b001;
        @(posedge clk) #0.1 req = 3'b011;
        @(posedge clk) #0.1 req = 3'b111;   
        @(posedge clk) #0.1 req = 3'b110;   
        @(posedge clk) #0.1 req = 3'b110;   
        @(posedge clk) #0.1 req = 3'b101;   
        @(posedge clk) #0.1 req = 3'b000;   
        @(posedge clk) #0.1 req = 3'b000;   
        @(posedge clk) #0.1 req = 3'b000;   
        @(posedge clk) #0.1 req = 3'b100;   
        @(posedge clk) #0.1 req = 3'b101;   
        @(posedge clk) #0.1 req = 3'b111;
        @(posedge clk) #0.1 req = 3'b111;
        @(posedge clk) #0.1 req = 3'b110; 
        @(posedge clk) #0.1 req = 3'b110;
        @(posedge clk) #0.1 req = 3'b111;
        @(posedge clk) #0.1 req = 3'b101;
        @(posedge clk) #0.1 req = 3'b100;
        @(posedge clk) #0.1 req = 3'b100;
        @(posedge clk) #0.1 req = 3'b000;      
        
    end

endmodule