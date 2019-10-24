module IFID
(
  input CLOCK,
  input [63:0] PC_in,
  input [31:0] IC_in,
  output reg [63:0] PC_out,
  output reg [31:0] IC_out
);

  always @(*) begin
    PC_out <= PC_in;
    IC_out <= IC_in;
  end
endmodule