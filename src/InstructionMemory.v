module InstructionMemory
(	
  input [63:0] programCounter,
  output reg [31:0] CPU_Instruction
);

  reg [8:0] instructionMemoryData[63:0];

  initial begin
        // LDUR X10, [X1,#40]
		instructionMemoryData[0] = 'b11111000; 
        instructionMemoryData[1] = 'b01000010; 
        instructionMemoryData[2] = 'b10000000; 
        instructionMemoryData[3] = 'b00101010; 
        			  
		//SUB X11, X2, X3
 		instructionMemoryData[4] = 'b11001011; 
        instructionMemoryData[5] = 'b00000011; 
        instructionMemoryData[6] = 'b00000000; 
        instructionMemoryData[7] = 'b01001011; 

		// ADD X12, X3, X4
		instructionMemoryData[8] = 'b10001011; 
        instructionMemoryData[9] = 'b00000100; 
        instructionMemoryData[10] = 'b00000000; 
        instructionMemoryData[11] = 'b01101100; 

		//LDUR X13, [X1,#48]
		instructionMemoryData[12] = 'b11111000; 
        instructionMemoryData[13] = 'b01000011; 
        instructionMemoryData[14] = 'b00000000; 
        instructionMemoryData[15] = 'b00101101;

		//ADD X14, X5, X6
		instructionMemoryData[16] = 'b10001011; 
        instructionMemoryData[17] = 'b00000110; 
        instructionMemoryData[18] = 'b00000000; 
        instructionMemoryData[19] = 'b10101110;
  end

  always @(programCounter) begin
    CPU_Instruction[8:0] = instructionMemoryData[programCounter+3];
    CPU_Instruction[16:8] = instructionMemoryData[programCounter+2];
    CPU_Instruction[24:16] = instructionMemoryData[programCounter+1];
    CPU_Instruction[31:24] = instructionMemoryData[programCounter];
  end
endmodule
