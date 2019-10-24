module IDEX
(
  input CLOCK,
  input [1:0] aluop_in, 	      		// EX Stage
  input alusrc_in, 			         	// EX Stage
  input isBranch_in, 	       			// M Stage
  input memRead_in, 		         	// M Stage
  input memwrite_in, 		         	// M Stage
  input regwrite_in, 		         	// WB Stage
  input mem2reg_in, 		         	// WB Stage
  input [63:0] PC_in,
  input [63:0] regdata1_in,
  input [63:0] regdata2_in,
  input [63:0] sign_extend_in,
  input [10:0] alu_control_in,
  input [4:0] write_reg_in,
  output reg [1:0] aluop_out, 			// EX Stage
  output reg alusrc_out, 		    	// EX Stage
  output reg isBranch_out, 				// M Stage
  output reg memRead_out, 		  		// M Stage
  output reg memwrite_out, 		  		// M Stage
  output reg regwrite_out,		  		// WB Stage
  output reg mem2reg_out,		    	// WB Stage
  output reg [63:0] PC_out,
  output reg [63:0] regdata1_out,
  output reg [63:0] regdata2_out,
  output reg [63:0] sign_extend_out,
  output reg [10:0] alu_control_out,
  output reg [4:0] write_reg_out
);

  always @(*) begin
    /* Values for EX */
    aluop_out <= aluop_in;
    alusrc_out <= alusrc_in;

    /* Values for M */
  	isBranch_out <= isBranch_in;
  	memRead_out <= memRead_in;
 	memwrite_out <= memwrite_in;

    /* Values for WB */
    regwrite_out <= regwrite_in;
  	mem2reg_out <= mem2reg_in;

    /* Values for all Stages */
    PC_out <= PC_in;
    regdata1_out <= regdata1_in;
    regdata2_out <= regdata2_in;

    /* Values for variable stages */
    sign_extend_out <= sign_extend_in;
  	alu_control_out <= alu_control_in;
  	write_reg_out <= write_reg_in;
  end
endmodule

