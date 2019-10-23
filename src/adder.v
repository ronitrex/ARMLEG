`timescale 1ns / 1ps


module adder (incrementBy, programCounter_out, adder_out);
input [3:0] incrementBy;
input [63:0] programCounter_out;
output [63:0] adder_out;

assign adder_out = programCounter_out + incrementBy;

endmodule
