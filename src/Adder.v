module Adder (
	input [63:0] incrementBy,
	input [63:0] programCounter,
	output reg[63:0] adderResult
);

	always @ (*) begin
		adderResult = programCounter + incrementBy;
	end
endmodule