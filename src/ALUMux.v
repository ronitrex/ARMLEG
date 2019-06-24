module ALUMux
(
  input [63:0] data1,
  input [63:0] data2,
  input ALUSRC,
  output reg [63:0] out
);

  always @(*) case (ALUSRC)
  0: out <= data1;
  1: out <= data2;
  default: out <= 63'bz;
  endcase

endmodule
