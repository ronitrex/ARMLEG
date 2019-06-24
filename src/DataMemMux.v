module DataMemMux
(
  input [63:0] readData,
  input [63:0] aluOutput,
  input MEM2REG,
  output reg [63:0] out
);

  always @(*) case (MEM2REG)
  0: out <= aluOutput;
  1: out <= readData;
  default: out <= 63'bz;
  endcase

endmodule
