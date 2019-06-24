// Name : Ronit Kumar

`timescale 1ns / 1ps

`timescale 1ns / 1ps

module Clock(clk);

output reg clk;
// clock
// 20 ns clock running forever
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
// Clock terminates after 100ns
$finish;
end
endmodule
