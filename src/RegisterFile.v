module RegisterFile
(
  input [4:0] read1,
  input [4:0] read2,
  input [4:0] writeReg,
  input [63:0] writeData,
  input REGWRITE,
  output reg [63:0] data1,
  output reg [63:0] data2
);

  reg [63:0] Data[31:0];

  integer initCount;

  initial begin

    for (initCount = 0; initCount < 31; initCount = initCount + 1) begin
      Data[initCount] = initCount;
    end

    Data[31] = 64'h00000000;
  end

  always @(read1, read2, writeReg, writeData, REGWRITE) begin

    data1 = Data[read1];
    data2 = Data[read2];

    if (REGWRITE == 1) begin
      Data[writeReg] = writeData;
    end
  end
endmodule
