`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:46:35 05/08/2016 
// Design Name: 
// Module Name:    alu_reg 
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
module alu_reg(
	input [31:0]alu_reg_in,
	output reg [31:0]alu_reg_out,
	input clk
);

always @ (posedge clk)
begin
	alu_reg_out = alu_reg_in;
end 

endmodule
