module ProgramCounterMUX
(
  input [63:0] adderResult,
  input [63:0] branch,
  input PCsrc,
  output reg [63:0] out
);

  always @(*) case (PCsrc)
  0: out = adderResult;
  1: out = branch;
  default: out = adderResult;
  endcase

endmodule