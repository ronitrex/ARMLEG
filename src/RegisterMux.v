module RegisterMux
(
  input [4:0] instructionMemory,
  input [4:0] targetAddress,
  input reg2loc,
  output reg [4:0] muxOutput
);

  always @(*) case (reg2loc)
  0: muxOutput = instructionMemory;
  1: muxOutput = targetAddress;
  default: muxOutput = instructionMemory;
  endcase

endmodule
