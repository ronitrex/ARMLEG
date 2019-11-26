module ForwardingUnitALUMuxB
(
	input [63:0] regData2,
	input [63:0] dataMemoryMUXout,
	input [63:0] EXMEM_InputAddress,
	input [1:0] ForwardB,
	output reg [63:0] ForwardingUnitALUMUXoutB
);

	always @(*) case (ForwardB)
		00: ForwardingUnitALUMUXoutB = regData2;
		01: ForwardingUnitALUMUXoutB = dataMemoryMUXout;
		10: ForwardingUnitALUMUXoutB = EXMEM_InputAddress;
		default: ForwardingUnitALUMUXoutB = regData2;
	endcase

endmodule