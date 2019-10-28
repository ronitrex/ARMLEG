`timescale 1ns / 1ps

module Clock(
  output reg CLOCK
);

	always @(posedge CLOCK)
	begin
			#0.03
			CLOCK <= ~CLOCK;
	end
	
	always @(negedge CLOCK)
	begin
			#0.07
			CLOCK <= ~CLOCK;
	end
	
	initial begin
	CLOCK <= 1;
	#2;
	// Clock terminates after 2ns
	$finish;
	end
endmodule
