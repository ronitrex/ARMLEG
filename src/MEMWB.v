module MEMWB
(
  input CLOCK,
  input [63:0] mem_address_in,
  input [63:0] mem_data_in,
  input [4:0] write_reg_in,
  input regwrite_in,
  input mem2reg_in,
  output reg [63:0] mem_address_out,
  output reg [63:0] mem_data_out,
  output reg [4:0] write_reg_out,
  output reg regwrite_out,
  output reg mem2reg_out
);

  always @(*) begin
    regwrite_out <= regwrite_in;
    mem2reg_out <= mem2reg_in;
    mem_address_out <= mem_address_in;
    mem_data_out <= mem_data_in;
    write_reg_out <= write_reg_in;
  end
endmodule