`timescale 1ns / 1ps


module Adder (
input [63:0] incrementBy,
input [63:0] programCounter,
output reg[63:0] adder_out
);

	always @ (*) begin
		 adder_out = programCounter + incrementBy;
	end
endmodule
