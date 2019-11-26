module ForwardingUnitALUMuxA
(
	input [63:0] regData1,
	input [63:0] dataMemoryMUXout,
	input [63:0] EXMEM_InputAddress,
	input [1:0] ForwardA,
	output reg [63:0] ForwardingUnitALUMUXoutA
);

	always @(*) case (ForwardA)
		00: ForwardingUnitALUMUXoutA = regData1;
		01: ForwardingUnitALUMUXoutA = dataMemoryMUXout;
		10: ForwardingUnitALUMUXoutA = EXMEM_InputAddress;
		default: ForwardingUnitALUMUXoutA = regData1;
	endcase

endmodule