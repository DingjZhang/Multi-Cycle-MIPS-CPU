`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:14 05/08/2016 
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
module reg_reg(
	input [31:0]rreg_in_a,
	input [31:0]rreg_in_b,
	input clk,
	output reg [31:0]rreg_out_a,
	output reg [31:0]rreg_out_b
);

always @ (posedge clk)
begin
	rreg_out_a = rreg_in_a;
	rreg_out_b = rreg_in_b;
end


endmodule
