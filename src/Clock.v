`timescale 1ns / 1ps

module Clock(
  output reg clk
);

	always @(posedge clk)
	begin
			#0.03
			clk <= ~clk;
	end
	
	always @(negedge clk)
	begin
			#0.07
			clk <= ~clk;
	end
	
	initial begin
	clk <= 1;
	#10;
	// Clock terminates after 10ns
	$finish;
	end
endmodule
