`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:47 05/08/2016 
// Design Name: 
// Module Name:    data_reg 
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
module data_reg(
	input [31:0]data_in,
	input clk,
	output reg [31:0]data_out
);

always @ (posedge clk)
begin
	data_out = data_in;
end


endmodule
