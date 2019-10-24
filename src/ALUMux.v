module ALUMux
(
  input [63:0] data1,
  input [63:0] data2,
  input alusrc,
  output reg [63:0] out
);

  always @(*) case (alusrc)
  0: out <= data1;
  1: out <= data2;
  default: out <= 64'bz;
  endcase

endmodule
