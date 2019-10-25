module RegisterModule
(	
  input [4:0] readAddress1,
  input [4:0] readAddress2,
  input [4:0] writeAddress,
  input [63:0] writeData,
  input regwrite,
  output reg [63:0] regData1,
  output reg [63:0] regData2
);

  reg [63:0] registerData[31:0];

  initial begin
    registerData[31] <= 64'h00000000;
  end

  always @(*) begin

    regData1 <= registerData[readAddress1];
    regData2 <= registerData[readAddress2];

    if (regwrite == 1) begin
      registerData[writeAddress] <= writeData;
    end
  end
endmodule
