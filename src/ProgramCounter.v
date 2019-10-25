`timescale 1ns / 1ps

module ProgramCounter
(
  input CLOCK,
  input RESET,
  input [63:0] programCounter_in,
  output reg [63:0] programCounter_out
);
	 
	always @(posedge CLOCK) begin
		if (programCounter_in === 64'bx) begin
	    	programCounter_out  <= 0;
		end	else begin
		 	 programCounter_out <= programCounter_in;
		end
	end
	always @(RESET) begin
	  programCounter_out = 0;
	end

endmodule
