module ALUMux
(
  input [63:0] registerData,
  input [63:0] signExtendedData,
  input alusrc,
  output reg [63:0] out
);

  always @(*) case (alusrc)
  0: out = registerData;
  1: out = signExtendedData;
  default: out = registerData;
  endcase

endmodule
