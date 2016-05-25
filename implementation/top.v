`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:58:00 05/06/2016 
// Design Name: 
// Module Name:    top 
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
module top(
	input clk, rst_n
);

wire IorD;
wire Branch;
wire j_en;
wire bgtz_en;
wire RegDst;
wire ALUSrc;
wire [2:0] ALUControl;
wire MemtoReg;
wire RegWrite;
wire MemWrite;
wire [31:0] pc;
wire [31:0] pc_word;
wire [31:0] ir;
wire [4:0] r3_addr;
wire [31:0] r3_din;
wire [31:0] Memout;
wire [31:0] alu_out;
wire [31:0] r1_dout;
wire [31:0] r2_dout;
wire [31:0] alu_b;
wire PCSrc;
wire Zero;
wire clk_reg; 
wire [17:0] offset;
wire [5:0] addrb;
wire [2:0] state;

parameter S0 = 0;

assign clk_reg = ~clk;
assign PCSrc = Branch & Zero;
assign r3_addr = RegDst ? ir[15:11] : ir[20:16];
assign r3_din = MemtoReg ? Memout : alu_out;
assign alu_b = ALUSrc ? ir[15:0] : r2_dout;
assign addrb = IorD ? alu_out[5:0] : pc_word[5:0];
assign pc_word = pc >> 2;
assign ir = (state == S0) ? Memout : ir;

sign_extend se(
	.instr(ir[31:26]),
	.imm(ir[15:0]),
	.offset(offset)
	);


reg_file register(
	.clk(clk_reg),
	.rst_n(rst_n),
	.r1_addr(ir[25:21]),
	.r2_addr(ir[20:16]),
	.r3_addr(r3_addr),
	.r3_din(r3_din),
	.r3_wr(RegWrite),
	.r1_dout(r1_dout),
	.r2_dout(r2_dout)
);

alu alu_1(
	.alu_a(r1_dout),   
	.alu_b(alu_b),      
	.alu_op(ALUControl), 
	.zero(Zero),       
	.alu_out(alu_out)     
);

memory MM(
	.clka(clk),				
	.wea(MemWrite),		
	.addra(alu_out[5:0]),	
	.dina(r2_dout),			
	.clkb(clk),				
	.addrb(addrb),			
	.doutb(Memout)			
);

pc pc_1(
	.clk(clk),		
	.rst_n(rst_n),	
	.j_en(j_en),	
	.bgtz_en(bgtz_en),
	.PCSrc(PCSrc),
	.offset(offset),
	.pc(pc)
);

cu control_unit(
	.clk(clk),			
	.rst_n(rst_n),		
	.instr(ir[31:26]),	
	.curr_state(state),		
	.IorD(IorD),			
	.Branch(Branch),
	.j_en(j_en),
	.bgtz_en(bgtz_en),	
	.RegDst(RegDst),
	.ALUSrc(ALUSrc),
	.ALUControl(ALUControl),
	.MemtoReg(MemtoReg),
	.RegWrite(RegWrite),
	.MemWrite(MemWrite)	
);

endmodule
