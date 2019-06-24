// Name : Ronit Kumar

`timescale 1ns / 1ps
`include "ProgramCounter.v"
`include "adder.v"
`include "InstructionMemory.v"
`include "id.v"
`include "RegisterFile.v"
`include "SignExtend.v"
`include "ALU_Control.v"
`include "ALU.v"
`include "ShiftLeft2.v"
`include "DataMemory.v"
`include "ALUMux.v"
`include "DataMemMux.v"
`include "RegisterMux.v"
`include "IFID.v"
`include "IDEX.v"
`include "EXMEM.v"
`include "MEMWB.v"

module ARMLEG (
	input clk,
	input reset,
	inout [63:0] pc_in,
	output wire [63:0] pc_out
);

output [4:0] MEMWB_write_reg;
output MEMWB_regwrite;

output [63:0] adder_out;

output [31:0] CPU_Instruction;

output Reg2Loc;
output ALUSrc;
output MemtoReg;
output RegWrite;
output MemRead;
output MemWrite;
output Branch;
output [1:0] ALUOp;

output [4:0] Regmux;

output [63:0] data1;
output [63:0] data2;
  
output [63:0] outImmediate;

output [3:0] ALU_operation;
  
output [63:0] ALUmux;  

output [63:0] ALUresult;
output ZEROFLAG;

output [63:0] outputShift;

output [63:0] shiftPC; 
output shiftPCZero;

output [63:0] readData;

output [63:0] DataMemMuxout;

ProgramCounter pc (clk, reset, pc_in,  pc_out);

adder adder (4'b0100, pc_out, adder_out);

InstructionMemory IM(pc_out, CPU_Instruction);

//IFID pipeline register
output [63:0] IFID_PC;
output [31:0] IFID_IC;
IFID IFID (clk, pc_out, CPU_Instruction, IFID_PC, IFID_IC);

id InstructionDecoder(IFID_IC[31:21], Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);

RegisterMux regmux(IFID_IC[20:16], IFID_IC[4:0], Reg2Loc, Regmux);

RegisterFile registers(IFID_IC[9:5], Regmux, MEMWB_write_reg, DataMemMuxout, MEMWB_regwrite, data1, data2);

SignExtend SignExtend(IFID_IC, outImmediate);

//IDEX pipeline register
output [1:0] IDEX_aluop; 	// EX Stage
output IDEX_alusrc; 		    // EX Stage
output IDEX_isBranch; 	// M Stage
output IDEX_memRead;		  // M Stage
output IDEX_memwrite; 		  // M Stage
output IDEX_regwrite;	  // WB Stage
output IDEX_mem2reg;		    // WB Stage
output [63:0] IDEX_PC;
output [63:0] IDEX_reg1_data;
output [63:0] IDEX_reg2_data;
output [63:0] IDEX_sign_extend;
output [10:0] IDEX_alu_control;
output  [4:0] IDEX_write_reg;
IDEX IDEX(clk, ALUOp, ALUSrc, Branch, MemRead, MemWrite, RegWrite, MemtoReg, IFID_PC, data1, data2, outImmediate, IFID_IC[31:21], IFID_IC[4:0], IDEX_aluop, IDEX_alusrc, IDEX_isBranch, IDEX_memRead, IDEX_memwrite, IDEX_regwrite, IDEX_mem2reg, IDEX_PC, IDEX_reg1_data, IDEX_reg2_data, IDEX_sign_extend, IDEX_alu_control, IDEX_write_reg);

ALU_Control ALU_Control(IDEX_aluop, IDEX_alu_control, ALU_operation);

ALUMux ALUMux(IDEX_reg2_data, IDEX_sign_extend, IDEX_alusrc, ALUmux);

ALU ALU(IDEX_reg1_data, ALUmux, ALU_operation, ALUresult, ZEROFLAG);

ShiftLeft2 ShiftLeft2(IDEX_sign_extend, outputShift);

ALU adderShiftPC(IDEX_PC, outputShift, 4'b0010, shiftPC, shiftPCZero);

//EXMEM pipeline register
output EXMEM_isBranch; 	// M Stage
output EXMEM_memread; 		// M Stage
output EXMEM_memwrite; 		// M Stage
output EXMEM_regwrite;		// WB Stage
output EXMEM_mem2reg;		// WB Stage
output [63:0] EXMEM_shifted_PC_out;
output EXMEM_alu_zero;
output [63:0] EXMEM_address_out;
output [63:0] EXMEM_data_out;
output [4:0] EXMEM_write_reg;
EXMEM EXMEM(clk, IDEX_isBranch, IDEX_memRead, IDEX_memwrite, IDEX_regwrite, IDEX_mem2reg, shiftPC, ZEROFLAG, ALUresult, IDEX_reg2_data, IDEX_write_reg, EXMEM_isBranch, EXMEM_memread, EXMEM_memwrite, EXMEM_regwrite, EXMEM_mem2reg, EXMEM_shifted_PC_out, EXMEM_alu_zero, EXMEM_address_out, EXMEM_data_out, EXMEM_write_reg);


ALUMux ALUMuxPC(adder_out, EXMEM_shifted_PC_out, (EXMEM_isBranch&EXMEM_alu_zero), pc_in);

DataMemory DataMem(EXMEM_address_out, EXMEM_data_out, EXMEM_memread, EXMEM_memwrite, readData);

//MEMWB Pipeline Register
output [63:0] MEMWB_address;
output [63:0] MEMWB_read_data;


output MEMWB_mem2reg;
MEMWB MEMWB(clk, EXMEM_address_out, readData, EXMEM_write_reg, EXMEM_regwrite, EXMEM_mem2reg, MEMWB_address, MEMWB_read_data, MEMWB_write_reg, MEMWB_regwrite, MEMWB_mem2reg);


DataMemMux DataMemMux(MEMWB_read_data, MEMWB_address, MEMWB_mem2reg, DataMemMuxout);

endmodule


