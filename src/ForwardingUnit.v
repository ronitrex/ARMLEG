module ForwardingUnit
(
	input [4:0] IDEX_RegisterRn,
	input [4:0] IDEX_RegisterRm,
	input [4:0] EXMEM_RegisterRd,
	input [4:0] MEMWB_RegisterRd,
	input EXMEM_RegWrite,
	input MEMWB_RegWrite,
	output reg [1:0] ForwardA,
	output reg [1:0] ForwardB
);

	always @(*) begin

		//EX hazard:
		if ((EXMEM_RegWrite) && (EXMEM_RegisterRd != 31) && (EXMEM_RegisterRd == IDEX_RegisterRn)) begin
			ForwardA = 2'b10;
		end else if ((EXMEM_RegWrite) && (EXMEM_RegisterRd != 31) && (EXMEM_RegisterRd == IDEX_RegisterRm)) begin
			ForwardB = 2'b10;
		end else begin
			ForwardA = 2'b00;
			ForwardB = 2'b00;
		end

		//MEM hazard:
		if ((MEMWB_RegWrite) && (MEMWB_RegisterRd != 31) && (MEMWB_RegisterRd == IDEX_RegisterRn)
		&& !((EXMEM_RegWrite) && (EXMEM_RegisterRd != 31) && (EXMEM_RegisterRd != IDEX_RegisterRn))) begin
			ForwardA = 2'b01;
		end else if ((MEMWB_RegWrite) && (MEMWB_RegisterRd != 31) && (MEMWB_RegisterRd == IDEX_RegisterRm)
		&& !((EXMEM_RegWrite) && (EXMEM_RegisterRd != 31) && (EXMEM_RegisterRd != IDEX_RegisterRm))) begin
			ForwardB = 2'b01;
		end else begin
			ForwardA = 2'b00;
			ForwardB = 2'b00;
		end
	end
endmodule