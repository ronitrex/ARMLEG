module ALUControl
(
  input [1:0] ALU_Op,
  input [10:0] Opcode_field,
  output reg [3:0] ALU_operation
);

  always @(*) case (ALU_Op)
      2'b00 : ALU_operation = 4'b0010;
      2'b01 : ALU_operation = 4'b0111;
      2'b10 : case (Opcode_field)
          11'b10001011000 : ALU_operation = 4'b0010; // ADD
          11'b11001011000 : ALU_operation = 4'b0110; // SUB
          11'b10001010000 : ALU_operation = 4'b0000; // AND
          11'b10101010000 : ALU_operation = 4'b0001; // ORR
        endcase
  endcase

endmodule
