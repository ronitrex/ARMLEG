module RegisterMux
(
  input [4:0] instructionMemory,
  input [4:0] targetAddress,
  input reg2Loc,
  output reg [4:0] registerMUXout
);

  always @(*) case (reg2Loc)
  0: registerMUXout = instructionMemory;
  1: registerMUXout = targetAddress;
  default: registerMUXout = instructionMemory;
  endcase

endmodule
