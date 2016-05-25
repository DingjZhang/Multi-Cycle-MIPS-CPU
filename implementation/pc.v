`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:05:43 05/07/2016 
// Design Name: 
// Module Name:    pc 
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
module pc(
	input clk,
	input rst_n,
	input j_en,
	input bgtz_en,
	input PCSrc,
	input [17:0] offset,
	output reg [31:0] pc
);

reg [2:0]curr_state;
reg [2:0]next_state;

parameter S0 = 0;
parameter S1 = 1;
parameter S2 = 2;
parameter S3 = 3;

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		pc <= 0;
	end
	else if(PCSrc)
	begin
		if(j_en)
			begin
				if(!offset[17])
					pc <= pc & 18'b0 + offset;
				else
					pc <= pc & 18'b0 - (~{14'h3fff, offset} + 1);
			end
			else if(bgtz_en)
			begin
				if(!offset[17])
					pc <= pc + offset;
				else
					pc <= pc - (~{14'h3fff, offset} + 1);
			end
		end
	else if(!PCSrc && curr_state == S1)
		pc <= pc + 4;
end

always @ (posedge clk or negedge rst_n)
begin
if(!rst_n)
	curr_state <= S0;
else
	curr_state <= next_state;
end

always @ (*)
begin
	case(curr_state)
		S0: next_state = S1;
		S1: next_state = S2;
		S2: next_state = S3;
		S3: next_state = S0;
	endcase
end

endmodule
