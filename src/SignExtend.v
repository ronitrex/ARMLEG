module SignExtend
(			
  input [31:0] inputInstruction,
  output reg [63:0] signExtendedInstruction
);

    always @(*) begin
      if (inputInstruction[31:26] == 6'b000101) begin // B
        signExtendedInstruction[25:0] = inputInstruction[25:0];
        signExtendedInstruction[63:26] = {64{signExtendedInstruction[25]}};

      end else if (inputInstruction[31:24] == 8'b10110100) begin // CBZ
        signExtendedInstruction[19:0] = inputInstruction[23:5];
        signExtendedInstruction[63:20] = {64{signExtendedInstruction[19]}};

      end else begin // D Type
        signExtendedInstruction[9:0] = inputInstruction[20:12];
        signExtendedInstruction[63:10] = {64{signExtendedInstruction[9]}};
      end
    end
endmodule
