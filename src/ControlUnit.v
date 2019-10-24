// Name : Ronit Kumar

`timescale 1ns / 1ps
module id(
  input [10:0] id_in,
  output reg Reg2Loc,
  output reg ALUSrc,
  output reg MemtoReg,
  output reg RegWrite,
  output reg MemRead,
  output reg MemWrite,
  output reg Branch,
  output reg [1:0] ALUOp
);

always @(*)
begin
  if (id_in[10:5] == 6'b000101) begin   // Control bits for B
  Reg2Loc<=0;
  ALUSrc <= 0;
  MemtoReg <= 0;
  RegWrite <= 0;
  MemRead <= 0;
  MemWrite <= 0;
  Branch <=0;
  ALUOp <= 01;

  end else if (id_in[10:3] == 8'b10110100) begin // Control bits for CBZ
  Reg2Loc<=0;
  ALUSrc <= 0;
  MemtoReg <= 0;
  RegWrite <= 0;
  MemRead <= 0;
  MemWrite <= 0;
  Branch <=1;
  ALUOp <= 01;

  end else case(id_in)
  //Load
  'b11111000010:    begin
                    Reg2Loc<=0;
                    ALUSrc <= 1;
                    MemtoReg <= 1;
                    RegWrite <= 1;
                    MemRead <= 1;
                    MemWrite <= 0;
                    Branch <=0;
                    ALUOp <= 00;
                    end
  //Store
  'b11111000000:  begin
                    Reg2Loc <= 1;
                    ALUSrc <= 1;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 1;
                    Branch <=0;
                    ALUOp <= 00;
                    end

  // R-Type (ADD, SUB, AND, ORR)
  'b10001011000,
  'b11001011000,
  'b10001010000,
  'b10101010000:  begin
                  Reg2Loc <= 0;
                  ALUSrc <= 0;
                  MemtoReg <= 0;
                  RegWrite <= 1;
                  MemRead <= 0;
                  MemWrite <= 0;
                  Branch <=0;
                  ALUOp <= 10;
                  end

  default: begin
                  Reg2Loc <= 1'hz;
                  ALUSrc <= 1'hz;
                  MemtoReg <= 1'hz;
                  RegWrite <= 1'hz;
                  MemRead <= 1'hz;
                  MemWrite <= 1'hz;
                  Branch <= 1'hz;
                  ALUOp <= 2'hz;
                  end
    endcase
end
endmodule
