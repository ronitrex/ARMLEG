module RegisterFile
(
  input [4:0] read1,
  input [4:0] read2,
  input [4:0] writeReg,
  input [63:0] writeData,
  input regwrite,
  output reg [63:0] data1,
  output reg [63:0] data2
);

  reg [63:0] Data[31:0];

  initial begin
    Data[31] = 64'h00000000;
  end

  always @(*) begin

    data1 = Data[read1];
    data2 = Data[read2];

    if (regwrite == 1) begin
      Data[writeReg] = writeData;
    end
  end
endmodule
