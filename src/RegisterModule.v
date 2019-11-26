`timescale 1ns / 1ps

module RegisterModule
(
	input CLOCK,
	input [4:0] readAddress1,
	input [4:0] readAddress2,
	input [4:0] writeAddress,
	input [63:0] writeData,
	input regWrite,
	output reg [63:0] regData1,
	output reg [63:0] regData2
);

	reg [63:0] registerData[31:0];

	initial begin
		registerData[31] = 64'b0;
		registerData[1] = 64'd16;
		registerData[2] = 64'd12;
		registerData[3] = 64'd3;
		registerData[4] = 64'd4;
		registerData[5] = 64'd5;
		registerData[6] = 64'd6;
	end

	always @(negedge CLOCK) begin
		regData1 <= registerData[readAddress1];
		regData2 <= registerData[readAddress2];
	end

	always @(posedge CLOCK) begin
		if (regWrite == 1) begin
			registerData[writeAddress] <= writeData;
		end
	end
endmodule