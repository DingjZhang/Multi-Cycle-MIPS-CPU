`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:11 05/08/2016 
// Design Name: 
// Module Name:    mux_4 
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
module mux_3(
	input [31:0]mux3_1,
	input [31:0]mux3_2,
	input [31:0]mux3_3,
	input [1:0]select_3,
	output reg [31:0]mux_out_3
);

always @ (*)
begin
	case(select_4)
		2'b00: mux_out_3 = mux3_1;
		2'b01: mux_out_3 = mux3_2;
		2'b10: mux_out_3 = mux3_3;
		default: mux_out_3 = mux3_1;
	endcase
end


endmodule
