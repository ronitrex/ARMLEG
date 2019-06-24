module DataMemory
(
  input [63:0] inputAddress,
  input [63:0] inputData,
  input MemRead,
  input MemWrite,
  output reg [63:0] outputData
);

  reg [63:0] Data[127:0];

  integer initCount;

  initial begin
//    for (initCount = 0; initCount < 32; initCount = initCount + 1) begin
//      Data[initCount] = initCount * 100;
//    end

   Data[0]  = 64'h0000000000000000;
   Data[8]  = 64'h1111111111111111;
   Data[16] = 64'h2222222222222222;
   Data[24] = 64'h3333333333333333;
   Data[32] = 64'h4444444444444444;
   Data[40] = 64'h5555555555555555;
   Data[48] = 64'h6666666666666666;
   Data[56] = 64'h7777777777777777;
   Data[64] = 64'h8888888888888888;
   Data[72] = 64'h9999999999999999;
   Data[80] = 64'haaaaaaaaaaaaaaaa;
   Data[88] = 64'hbbbbbbbbbbbbbbbb;
   Data[96] = 64'hcccccccccccccccc;
   
  end

    always @(inputAddress, inputData, MemRead, MemWrite) begin
      if (MemWrite == 1) begin
        Data[inputAddress] = inputData;
      end

      if (MemRead == 1) begin
        outputData = Data[inputAddress];
      end
    end
endmodule
