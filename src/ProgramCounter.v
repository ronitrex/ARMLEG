module ProgramCounter
(
  input clk,
  input reset,
  input [63:0] pc_in,
  output reg [63:0] pc_out
);

  initial begin
      pc_out = 0;
  end

  always @(posedge clk) begin
      pc_out = pc_in;
  end

  always @(reset) begin
    pc_out = 0;
  end

endmodule
