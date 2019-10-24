`timescale 1ns / 1ps


module adder (
input [3:0] incrementBy,
input [63:0] programCounter,
output [63:0] adder_out
);

assign adder_out = programCounter + incrementBy;

endmodule
