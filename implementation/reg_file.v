`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:25:37 05/07/2016 
// Design Name: 
// Module Name:    regfile 
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
module reg_file(
  input clk,  
  input rst_n,
  input [4:0]r1_addr,  
  input [4:0]r2_addr,  
  input [4:0]r3_addr,  
  input [31:0]r3_din,  
  input r3_wr,  
  output reg [31:0]r1_dout,  
  output reg [31:0]r2_dout  
);  

reg [31:0]add[31:0]; 
integer i;  

always@(posedge clk or negedge rst_n)  
begin   
	if(!rst_n)    
	begin     
		for(i = 0; i < 32; i = i + 1)      
			add[i] <= 0;     
	end   
	else if(!r3_wr)    
	begin     
		r1_dout <= add[r1_addr];     //r3_wr = 0   out_put
		r2_dout <= add[r2_addr];     //r3_wr = 1   input
	end   
	else     
	begin     
		add[r3_addr] <= r3_din;    
	end  
end  
	
endmodule  


