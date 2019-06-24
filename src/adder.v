// Name : Ronit Kumar


`timescale 1ns / 1ps


module adder (inc_by, pc_out, adder_out);
input [3:0] inc_by;
input [63:0] pc_out;
output [63:0] adder_out;

assign adder_out = pc_out + inc_by;

endmodule
