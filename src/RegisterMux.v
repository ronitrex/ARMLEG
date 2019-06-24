module RegisterMux
(
  input [4:0] instruction1,
  input [4:0] instruction2,
  input REG2LOC,
  output reg [4:0] muxOutput
);

  always @(*) case (REG2LOC)
  0: muxOutput <= instruction1;
  1: muxOutput <= instruction2;
  default: muxOutput <= 5'bz;
  endcase

endmodule
