`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:07 05/08/2016 
// Design Name: 
// Module Name:    instruction_reg 
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
module instruction_reg(
	input [31:0]instr_in,
	input clk,
	input en,
	output reg [31:0]instr_out
);

always @ (posedge clk)
begin
	if(en)
	begin
		instr_out = instr_in;
	end
	else
	begin
		instr_out = instr_out;
	end
end

endmodule
