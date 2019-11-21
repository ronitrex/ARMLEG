module ControlUnit(
  input [10:0] controlInstruction_in,
  output reg reg2Loc,
  output reg ALUsrc,
  output reg memtoReg,
  output reg regWrite,
  output reg memRead,
  output reg memWrite,
  output reg branch,
  output reg [1:0] ALUop
);

always @(*)
begin
  if (controlInstruction_in[10:5] == 6'b000101) begin   // Control bits for B
  reg2Loc = 0;
  ALUsrc = 0;
  memtoReg = 0;
  regWrite = 0;
  memRead = 0;
  memWrite = 0;
  branch = 0;
  ALUop = 01;

  end else if (controlInstruction_in[10:3] == 8'b10110100) begin // Control bits for CBZ
  reg2Loc = 0;
  ALUsrc = 0;
  memtoReg = 0;
  regWrite = 0;
  memRead = 0;
  memWrite = 0;
  branch = 1;
  ALUop = 01;

  end else case(controlInstruction_in)
  //Load
  'b11111000010:    begin
                    reg2Loc = 1;
                    ALUsrc = 1;
                    memtoReg = 1;
                    regWrite = 1;
                    memRead = 1;
                    memWrite = 0;
                    branch = 0;
                    ALUop = 00;
                    end
  //Store
  'b11111000000:  begin
                    reg2Loc = 1;
                    ALUsrc = 1;
                    regWrite = 0;
                    memRead = 0;
                    memWrite = 1;
                    branch = 0;
                    ALUop = 00;
                    end

  // R-Type (ADD, SUB, AND, ORR)
  'b10001011000,
  'b11001011000,
  'b10001010000,
  'b10101010000:  begin
                  reg2Loc = 0;
                  ALUsrc = 0;
                  memtoReg = 0;
                  regWrite = 1;
                  memRead = 0;
                  memWrite = 0;
                  branch = 0;
                  ALUop = 10;
                  end

  default: begin
                  reg2Loc = 1'hz;
                  ALUsrc = 1'hz;
                  memtoReg = 1'hz;
                  regWrite = 1'hz;
                  memRead = 1'hz;
                  memWrite = 1'hz;
                  branch = 1'hz;
                  ALUop = 2'hz;
                  end
    endcase
end
endmodule
