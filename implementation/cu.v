


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:47 05/07/2016 
// Design Name: 
// Module Name:    cu 
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
module cu(
	input clk,
	input rst_n,
	input [5:0]instr,
	output reg [2:0]curr_state,
	output reg IorD,
	output reg Branch,
	output reg j_en,
	output reg bgtz_en,
	output reg RegDst,
	output reg ALUSrc,
	output reg [2:0]ALUControl,
	output reg MemtoReg,
	output reg RegWrite,
	output reg MemWrite
);


reg [2:0] next_state;

parameter S0 = 0;
parameter S1 = 1;
parameter S2 = 2;
parameter S3 = 3;

parameter ADD = 6'b000000;
parameter ADDI = 6'b001000;
parameter SW = 6'b101011;
parameter LW = 6'b100011;
parameter BGTZ = 6'b000111;
parameter J = 6'b000010;

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		IorD <= 0;
	end
	else
	begin
		case(instr)
			ADD:
				if(curr_state == S1)
				begin
					IorD <= 0;
					RegDst <= 1;
					ALUSrc <= 0;
					ALUControl <= 1;
					Branch <= 0;
					MemWrite <= 0;
					MemtoReg <= 0;
					RegWrite <= 0;
					j_en <= 0;
					bgtz_en <= 0;
				end
				else if(curr_state == S2)
				begin
					RegWrite <= 1;
				end
				else if(curr_state == S3)
				begin
					RegWrite <= 0;
				end
			ADDI:
				if(curr_state == S1) 
				begin
					IorD <= 0;
					RegDst <= 0;
					ALUSrc <= 1;
					ALUControl <= 1;
					Branch <= 0;
					MemWrite <= 0;
					MemtoReg <= 0;
					RegWrite <= 0;
					j_en <= 0;
					bgtz_en <= 0;
				end
				else if(curr_state == S2)
				begin
					RegWrite <= 1;
				end
				else if(curr_state == S3)
				begin
					RegWrite <= 0;
				end
			SW:
				if(curr_state == S1)
				begin
					IorD <= 1;
					RegDst <= 1;
					ALUSrc <= 1;
					ALUControl <= 1;
					Branch <= 0;
					RegWrite <= 0;
					MemtoReg <= 0;
					MemWrite <= 1;
					j_en <= 0;
					bgtz_en <= 0;
				end
				else if(curr_state == S2)
				begin
					IorD <= 0;
					MemWrite <= 0;
				end
			LW:
				if(curr_state == S1)
				begin
					IorD <= 1;
					RegDst <= 0;
					ALUSrc <= 1;
					ALUControl <= 1;
					Branch <= 0;
					MemWrite <= 0;
					MemtoReg <= 1;
					RegWrite <= 0;		
					j_en <= 0;
					bgtz_en <= 0;
				end
				else if(curr_state == S2)
				begin
					IorD <= 0;
					RegWrite <= 1;
				end
				else if(curr_state == S3)
				begin
					RegWrite <= 0;
				end
			BGTZ:
				if(curr_state == S1)
				begin
					IorD <= 0;
					RegDst <= 1;
					ALUSrc <= 0;
					ALUControl <= 1;
					Branch <= 1;
					RegWrite <= 0;
					MemWrite <= 0;
					MemtoReg <= 0;
					bgtz_en <= 1;
					j_en <= 0;
				end
				else
				begin
					Branch <= 0;
				end
			J:
				if(curr_state == S1)
				begin
					IorD <= 0;
					RegDst <= 1;
					ALUSrc <= 0;
					ALUControl <= 7;
					Branch <= 1;
					RegWrite <= 0;
					MemWrite <= 0;
					MemtoReg <= 0;
					j_en <= 1;
					bgtz_en <= 0;
				end
				else
				begin
					Branch <= 0;
				end
		endcase
	end
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		curr_state <= S0;
	else
		curr_state <= next_state;
end

always@(*)
begin
	case(curr_state)
		S0:
			next_state = S1;
		S1:
			next_state = S2;
		S2:
			next_state = S3;
		S3:
			next_state = S0;
	endcase
end

endmodule
