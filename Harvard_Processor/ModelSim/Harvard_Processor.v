// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"
// CREATED		"Sat Jul 28 21:19:51 2018"

module Processador_Completo(
	clock,
	reset,
	out_md,
	out_mi,
	clk_md,
	clk_mi,
	wren,
	mar,
	mbr,
	pc
);


input wire	clock;
input wire	reset;
input wire	signed [15:0] out_md;
input wire	[15:0] out_mi;
output wire	clk_md;
output wire	clk_mi;
output wire	wren;
output wire	[11:0] mar;
output wire	signed [15:0] mbr;
output wire	[11:0] pc;

wire	signed [15:0] ac;
wire	[15:0] bus;
wire	signed [15:0] out_ac_b;
wire	signed [15:0] out_mbr_b;
wire	flagz;
wire	flagn;
wire	pc_wr;
wire	pc_inicio;
wire	pc_inc;
wire	ir_re;
wire	ir_wr;
wire	ac_wr;
wire	ac_re;
wire	mbr_re_b;
wire	mbr_wr_b;
wire	mbr_wr_m;
wire	ula_re;
wire	[3:0] ula_sel;
wire	mar_wr;





processador_fsm FSM(
	.flagz(flagz),
	.flagn(flagn),
	.clock(clock),
	.reset(reset),
	.opcode(bus[15:12]),
	.pc_inicio(pc_inicio),
	.pc_inc(pc_inc),
	.pc_wr(pc_wr),
	.ir_wr(ir_wr),
	.ir_re(ir_re),
	.mar_wr(mar_wr),
	.clk_md(clk_md),
	.clk_mi(clk_mi),
	.mbr_wr_m(mbr_wr_m),
	.mbr_wr_b(mbr_wr_b),
	.mbr_re_b(mbr_re_b),
	.ac_wr(ac_wr),
	.ac_re(ac_re),
	.ula_re(ula_re),
	.wren(wren),
	.ula_sel(ula_sel));
	defparam	FSM.add = 4'b0010;
	defparam	FSM.andp = 4'b0110;
	defparam	FSM.dec_opcode_1 = 5'b00010;
	defparam	FSM.dec_opcode_2 = 5'b01101;
	defparam	FSM.dec_opcode_3 = 5'b00011;
	defparam	FSM.div = 4'b0101;
	defparam	FSM.inicio = 5'b00000;
	defparam	FSM.jmp = 4'b1001;
	defparam	FSM.jn = 4'b1010;
	defparam	FSM.jump = 5'b10100;
	defparam	FSM.jz = 4'b1011;
	defparam	FSM.lda = 4'b0000;
	defparam	FSM.ler_ir = 5'b00001;
	defparam	FSM.load_1 = 5'b00100;
	defparam	FSM.load_2 = 5'b00101;
	defparam	FSM.load_3 = 5'b00110;
	defparam	FSM.load_4 = 5'b00111;
	defparam	FSM.load_5 = 5'b01000;
	defparam	FSM.mul = 4'b0100;
	defparam	FSM.nop = 4'b1100;
	defparam	FSM.notp = 4'b1000;
	defparam	FSM.orp = 4'b0111;
	defparam	FSM.pc_incre = 5'b10101;
	defparam	FSM.sta = 4'b0001;
	defparam	FSM.store_1 = 5'b01001;
	defparam	FSM.store_2 = 5'b01010;
	defparam	FSM.store_3 = 5'b01011;
	defparam	FSM.store_4 = 5'b01100;
	defparam	FSM.sub = 4'b0011;
	defparam	FSM.ula_op_1 = 5'b01110;
	defparam	FSM.ula_op_2 = 5'b01111;
	defparam	FSM.ula_op_3 = 5'b10000;
	defparam	FSM.ula_op_4 = 5'b10001;
	defparam	FSM.ula_op_5 = 5'b10010;
	defparam	FSM.ula_op_6 = 5'b10011;


pc	PC(
	.pc_wr(pc_wr),
	.pc_inicio(pc_inicio),
	.pc_inc(pc_inc),
	.bus(bus[11:0]),
	.pc(pc));


ir	IR(
	.ir_re(ir_re),
	.ir_wr(ir_wr),
	.out_mem_instrucao(out_mi),
	.out_ir(bus));


ac	AC(
	.ac_re(ac_re),
	.ac_wr(ac_wr),
	.bus(bus),
	.ac(ac),
	.out_ac_b(bus));


mbr MBR(
	.mbr_re_b(mbr_re_b),
	.mbr_wr_b(mbr_wr_b),
	.mbr_wr_m(mbr_wr_m),
	.bus(bus),
	.out_mem_dados(out_md),
	.mbr(mbr),
	.out_mbr_b(bus));


ULA ULA(
	.ula_re(ula_re),
	.ac(ac),
	.mbr(mbr),
	.ula_sel(ula_sel),
	.flagz(flagz),
	.flagn(flagn),
	.result(bus));
	defparam	ULA.add = 4'b0010;
	defparam	ULA.andp = 4'b0110;
	defparam	ULA.div = 4'b0101;
	defparam	ULA.mul = 4'b0100;
	defparam	ULA.notp = 4'b1000;
	defparam	ULA.orp = 4'b0111;
	defparam	ULA.sub = 4'b0011;


mar MAR(
	.mar_wr(mar_wr),
	.bus(bus[11:0]),
	.mar(mar));


endmodule
