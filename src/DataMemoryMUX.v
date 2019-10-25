module DataMemoryMUX
(
  input [63:0] readData,
  input [63:0] ALUresult,
  input memToReg,
  output reg [63:0] out
);

  always @(*) case (memToReg)
  0: out = ALUresult;
  1: out = readData;
  default: out = ALUresult;
  endcase

endmodule
