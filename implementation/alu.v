`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:05:55 05/07/2016 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
	input signed [31:0] alu_a,
   input signed [31:0] alu_b,
   input [2:0]	alu_op,
	output reg zero,
   output reg [31:0] alu_out
);

parameter A_MOV = 0; 	
parameter A_ADD = 1;
parameter A_SUB = 2;
parameter A_AND = 3;
parameter A_OR  = 4;
parameter A_XOR = 5;
parameter A_NOR = 6;
parameter A_JMP = 7;

always @ (*)
	case(alu_op)
		A_MOV:
		begin
			alu_out = alu_b << 15;
			zero = 0;
		end
		A_ADD:
		begin
			if(alu_b[15])
				alu_out = alu_a - (~{16'hffff, alu_b[15:0]} + 1);
			else
				alu_out = alu_a + alu_b;
			if(!alu_out[31] && alu_out != 0)
				zero = 1;
			else
				zero = 0;
		end
		A_SUB:
		begin
			alu_out = alu_a - alu_b;
			zero = 0;
		end
		A_AND:
		begin
			alu_out = alu_a & alu_b;
			zero = 0;
		end
		A_OR:
		begin
			alu_out = alu_a | alu_b;
			zero = 0;
		end
		A_XOR:
		begin
			alu_out = alu_a ^ alu_b;
			zero = 0;
		end
		A_NOR:
		begin
			alu_out = ~(alu_a | alu_b);
			zero = 0;
		end
		A_JMP:
		begin
			zero = 1;
		end
	endcase

endmodule
