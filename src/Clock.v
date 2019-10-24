`timescale 1ns / 1ps

module Clock(
output reg clk
);

always @(posedge clk)
begin
		#0.01
		clk = ~clk;
end
always @(negedge clk)
begin
		#0.09
		clk = ~clk;
end

initial begin
clk = 1;
#5;
// Clock terminates after 5ns
$finish;
end
endmodule
