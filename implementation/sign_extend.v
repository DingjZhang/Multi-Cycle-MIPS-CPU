`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:06:13 05/07/2016 
// Design Name: 
// Module Name:    sign_extend 
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
module sign_extend(
	input [5:0] instr,
	input [15:0] imm,
	output reg [17:0] offset
);

parameter BGTZ = 6'b000111;
parameter J = 6'b000010;

always@(*)
begin
	case(instr)
		BGTZ:
			offset <= imm << 2;
		J:
			offset <= imm << 2;
		default:
			offset <= {2'b0, imm};
	endcase
end

endmodule
