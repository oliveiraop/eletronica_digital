module processador_fsm (flagz, flagn, opcode, clock, reset,pc_inicio, pc_inc, pc_wr, ir_wr, ir_re, mar_wr, clk_md, clk_mi, mbr_wr_m, mbr_wr_b, mbr_re_b, ac_wr, ac_re, ula_sel, ula_re, wren);

	//Saidas
	output reg pc_inicio;
	output reg pc_inc;
	output reg pc_wr;
	output reg ir_wr;
	output reg ir_re;
	output reg mar_wr;
	output reg clk_md;
	output reg clk_mi;
	output reg mbr_wr_m;
	output reg mbr_wr_b;
	output reg mbr_re_b;
	output reg ac_wr;
	output reg ac_re;
	output reg [3:0]ula_sel;
	output reg ula_re;
	output reg wren;

	//Entradas
	input flagz;
	input flagn;
	input [3:0]opcode;
	input clock;
	input reset;
	
	//Regs
	reg [4:0]est_f;
	reg [4:0]est_a;
	reg [3:0]opcodeInter;

	//Parametros (estados)
	parameter inicio = 5'b00000;
	parameter ler_ir = 5'b00001;
	parameter dec_opcode_1 = 5'b00010;
	parameter dec_opcode_2 = 5'b00011;
	parameter load_1 = 5'b00100;
	parameter load_2 = 5'b00101;
	parameter load_3 = 5'b00110;
	parameter load_4 = 5'b00111;
	parameter load_5 = 5'b01000;
	parameter store_1 = 5'b01001;
	parameter store_2 = 5'b01010;
	parameter store_3 = 5'b01011;
	parameter store_4 = 5'b01100;
	parameter store_5 = 5'b01101;
	parameter ula_op_1 = 5'b01110;
	parameter ula_op_2 = 5'b01111;
	parameter ula_op_3 = 5'b10000;
	parameter ula_op_4 = 5'b10001;
	parameter ula_op_5 = 5'b10010;
	parameter ula_op_6 = 5'b10011;
	parameter jump = 5'b10100;
	parameter pc_incre = 5'b10101;
	
	//Parametros (opcodes)
	parameter lda = 4'b0000;
	parameter sta = 4'b0001;
	parameter add = 4'b0010;
	parameter sub = 4'b0011;
	parameter mul = 4'b0100;
	parameter div = 4'b0101;
	parameter andp = 4'b0110;
	parameter orp = 4'b0111;
	parameter notp = 4'b1000;
	parameter jmp = 4'b1001;
	parameter jn = 4'b1010;
	parameter jz = 4'b1011;
	parameter nop = 4'b1100;
	
	// Decodificador de próximo estado
	always @ (est_a, opcode, flagn, flagz)
	begin
		// Atribuicoes default
		est_f=inicio;
		case (est_a)
			inicio: 
				est_f=ler_ir;
			pc_incre:
				est_f=ler_ir;
			ler_ir:
				est_f=dec_opcode_1;
			dec_opcode_1: 
				est_f=dec_opcode_2;
			dec_opcode_2:
				begin
					case (opcode)
						lda: 
							est_f = load_1;
						sta: 
							est_f = store_1;
						add: 
							est_f = ula_op_1;
						sub: 
							est_f = ula_op_1;
						mul:
							est_f = ula_op_1;
						div: 
							est_f = ula_op_1;
						andp: 
							est_f = ula_op_1;
						orp: 
							est_f = ula_op_1;
						notp: 
							est_f = ula_op_4;
						jmp: 
							est_f = jump;
						nop: 
							est_f = pc_incre;
						jz:
							begin 
								if (flagz) est_f = jump;
								else est_f = pc_incre;
							end
						jn :
							begin 
								if (flagn) est_f = jump;
								else est_f=pc_incre;
							end
						default:	;
						
					endcase
				end
			load_1:	
				est_f=load_2;
			load_2: 
				est_f=load_3;
			load_3: 
				est_f=load_4;
			load_4: 
				est_f=load_5;
			load_5: 
				est_f=pc_incre;
			store_1: 
				est_f=store_2;
			store_2: 
				est_f=store_3;
			store_3: 
				est_f=store_4;
			store_4: 
				est_f=store_5;
			store_5: 
				est_f=pc_incre;
			ula_op_1: 
				est_f=ula_op_2;
			ula_op_2: 
				est_f=ula_op_3;
			ula_op_3: 
				est_f=ula_op_4;
			ula_op_4: 
				est_f=ula_op_5;
			ula_op_5: 
				est_f=ula_op_6;
			ula_op_6: 
				est_f=pc_incre;
			jump: 
				est_f=ler_ir;
			default:;
		endcase
	end	
	always @ (est_a)
	begin
		// Atribuicoes default
		pc_inicio = 1'b0;
		pc_inc = 1'b0;
		pc_wr = 1'b0;
		ir_wr = 1'b0;
		ir_re = 1'b0;
		mar_wr = 1'b0;
		clk_md = 1'b0;
		clk_mi = 1'b0;
		mbr_wr_m = 1'b0;
		mbr_wr_b = 1'b0;
		mbr_re_b = 1'b0;
		ac_wr = 1'b0;
		ac_re = 1'b0;
		ula_sel = 4'b0000;
		ula_re = 1'b0;
		wren=1'b0;
		case (est_a)
				inicio: 
					pc_inicio=1'b1;
				pc_incre:
					pc_inc=1'b1;
				ler_ir:
					clk_mi=1'b1;
				dec_opcode_1:
					ir_wr=1'b1;
				dec_opcode_2:
					begin
					ir_re=1'b1;
					opcodeInter=opcode;
					end
				load_1:
					begin
						mar_wr=1'b1;
						ir_re=1'b1;
					end
				load_2:
						clk_md=1'b1;
				load_3:
						mbr_wr_m=1'b1;
				load_4:
						mbr_re_b=1'b1;
				load_5:
					begin
						ac_wr=1'b1;
						mbr_re_b=1'b1;
					end
				store_1:
					begin
						mar_wr=1'b1;
						ir_re=1'b1;
					end
				store_2:
					begin
						ac_re=1'b1;
						clk_md=1'b1;
					end
				store_3:
					begin
						ac_re=1'b1;
						mbr_wr_b=1'b1;
					end
				store_4:
					begin
						clk_md=1'b1;
						wren=1'b1;
					end
				store_5:
					begin
						clk_md=1'b1;
						wren=1'b1;
					end
				ula_op_1:
					begin
						mar_wr=1'b1;
						ir_re=1'b1;
					end
				ula_op_2:
						clk_md=1'b1;
				ula_op_3:
						mbr_wr_m=1'b1;
				ula_op_4:
						ula_sel=opcodeInter;
				ula_op_5:
						ula_re=1'b1;
				ula_op_6:
					begin
						ula_re=1'b1;
						ac_wr=1'b1;
					end
				jump:
					begin
						pc_wr=1'b1;
						ir_re=1'b1;
					end
				default:;
			endcase
	
	end	
	always @ (posedge clock)
		begin
			if (reset) est_a<=inicio;
			else est_a<=est_f;
		end
endmodule