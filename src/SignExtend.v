module SignExtend
(
  input [31:0] inputInstruction,
  output reg [63:0] outImmediate
);

    always @(*) begin

      if (inputInstruction[31:26] == 6'b000101) begin // B
        outImmediate[25:0] = inputInstruction[25:0];
        outImmediate[63:26] = {64{outImmediate[25]}};

      end else if (inputInstruction[31:24] == 8'b10110100) begin // CBZ
        outImmediate[19:0] = inputInstruction[23:5];
        outImmediate[63:20] = {64{outImmediate[19]}};

      end else begin // D Type
        outImmediate[9:0] = inputInstruction[20:12];
        outImmediate[63:10] = {64{outImmediate[9]}};
      end
    end
endmodule
