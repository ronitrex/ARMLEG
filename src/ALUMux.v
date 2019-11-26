module ALUMux
(
	input [63:0] registerData,
	input [63:0] signExtendedData,
	input ALUsrc,
	output reg [63:0] ALUMUXout
);

	always @(*) case (ALUsrc)
		0: ALUMUXout = registerData;
		1: ALUMUXout = signExtendedData;
		default: ALUMUXout = registerData;
	endcase

endmodule