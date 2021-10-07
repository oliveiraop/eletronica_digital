`timescale 1ns/1ns
module Harvard_Processor_tb;

reg	clock;
reg	reset;
reg	signed [15:0] out_md;
reg	[15:0] out_mi;
wire	clk_md;
wire	clk_mi;
wire	wren;
wire	[11:0] mar;
wire	[15:0] mbr;
wire	[11:0] pc;

wire	signed [15:0] ac;
wire	[15:0] bus;
wire	signed [15:0] mbr_ALTERA_SYNTHESIZED;
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





processador_fsm	b2v_inst(
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
	defparam	b2v_inst.add = 4'b0010;
	defparam	b2v_inst.andp = 4'b0110;
	defparam	b2v_inst.dec_opcode_1 = 5'b00010;
	defparam	b2v_inst.dec_opcode_2 = 5'b00011;
	defparam	b2v_inst.div = 4'b0101;
	defparam	b2v_inst.inicio = 5'b00000;
	defparam	b2v_inst.jmp = 4'b1001;
	defparam	b2v_inst.jn = 4'b1010;
	defparam	b2v_inst.jump = 5'b10100;
	defparam	b2v_inst.jz = 4'b1011;
	defparam	b2v_inst.lda = 4'b0000;
	defparam	b2v_inst.ler_ir = 5'b00001;
	defparam	b2v_inst.load_1 = 5'b00100;
	defparam	b2v_inst.load_2 = 5'b00101;
	defparam	b2v_inst.load_3 = 5'b00110;
	defparam	b2v_inst.load_4 = 5'b00111;
	defparam	b2v_inst.load_5 = 5'b01000;
	defparam	b2v_inst.mul = 4'b0100;
	defparam	b2v_inst.nop = 4'b1100;
	defparam	b2v_inst.notp = 4'b1000;
	defparam	b2v_inst.orp = 4'b0111;
	defparam	b2v_inst.pc_incre = 5'b10101;
	defparam	b2v_inst.sta = 4'b0001;
	defparam	b2v_inst.store_1 = 5'b01001;
	defparam	b2v_inst.store_2 = 5'b01010;
	defparam	b2v_inst.store_3 = 5'b01011;
	defparam	b2v_inst.store_4 = 5'b01100;
	defparam	b2v_inst.store_5 = 5'b01101;
	defparam	b2v_inst.sub = 4'b0011;
	defparam	b2v_inst.ula_op_1 = 5'b01110;
	defparam	b2v_inst.ula_op_2 = 5'b01111;
	defparam	b2v_inst.ula_op_3 = 5'b10000;
	defparam	b2v_inst.ula_op_4 = 5'b10001;
	defparam	b2v_inst.ula_op_5 = 5'b10010;
	defparam	b2v_inst.ula_op_6 = 5'b10011;


pc	b2v_inst1(
	.pc_wr(pc_wr),
	.pc_inicio(pc_inicio),
	.pc_inc(pc_inc),
	.bus(bus[11:0]),
	.pc(pc));


ir	b2v_inst2(
	.ir_re(ire_re),
	.ir_wr(ir_wr),
	.out_mem_instrucao(out_mi),
	.out_ir(bus));


ac	b2v_inst3(
	.ac_re(ac_wr),
	.ac_wr(ac_re),
	.bus(bus),
	.ac(ac)
	);


mbr	b2v_inst4(
	.mbr_re_b(mbr_re_b),
	.mbr_wr_b(mbr_wr_b),
	.mbr_wr_m(mbr_wr_m),
	.bus(bus),
	.out_mem_dados(out_md),
	.mbr(mbr_ALTERA_SYNTHESIZED)
	);


ULA	b2v_inst5(
	.ula_re(ula_re),
	.ac(ac),
	.mbr(mbr_ALTERA_SYNTHESIZED),
	.ula_sel(ula_sel),
	.flagz(flagz),
	.flagn(flagn),
	.result(bus));
	defparam	b2v_inst5.add = 4'b0010;
	defparam	b2v_inst5.andp = 4'b0110;
	defparam	b2v_inst5.div = 4'b0101;
	defparam	b2v_inst5.mul = 4'b0100;
	defparam	b2v_inst5.notp = 4'b1000;
	defparam	b2v_inst5.orp = 4'b0111;
	defparam	b2v_inst5.sub = 4'b0011;
	
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

mar	b2v_inst6(
	.mar_wr(mar_wr),
	.bus(bus[11:0]),
	.mar(mar));

assign	mbr = mbr_ALTERA_SYNTHESIZED;


// Parte estrutural
// Definir entradas e saídas, tipos, e instanciar os módulos




	always @ (ula_re)
	begin
		case (ula_sel)
			add:
			begin
				#1 TesteAdd;
			end
			sub:
			begin
				#3 TesteSub;
			end
			mul:
			begin
				#3 TesteMul;
			end
			div:
			begin
				#3 TesteDiv;
			end
			andp:
			begin
				#3 TesteAnd;
			end
			orp:
			begin
				#3 TesteOr;
			end
			notp:
			begin
				#3 TesteNot;
			end
		endcase
			
	end

	task TesteAdd;
	reg signed [15:0]testeR;
	begin
		testeR = ac + mbr;
		
		if (bus == testeR)
		begin
			if (bus < 0)
			begin
				if (flagn != 1'b1) $display("deu ruim na flag da soma");
			end
			if (bus == 0)
			begin
				if (flagz != 1'b1) $display("deu ruim na flag da soma");
			end
		end
		else $display("deu ruim na soma");
	end
	endtask
	
	task TesteSub;
	reg signed [15:0]testeR;
	begin
		testeR = ac - mbr;
		
		if (bus == testeR)
		begin
			if (bus < 0)
			begin
				if (flagn != 1'b1) $display("deu ruim na flag da sub");
			end
			if (bus == 0)
			begin
				if (flagz != 1'b1) $display("deu ruim na flag da sub");
			end
		end
		else $display("deu ruim na sub");
	end
	endtask
	
	task TesteMul;
	reg signed [15:0]testeR;
	begin
		testeR = ac *	mbr;
		
		if (bus == testeR)
		begin
			if (bus < 0)
			begin
				if (flagn != 1'b1) $display("deu ruim na flag da mul");
			end
			if (bus == 0)
			begin
				if (flagz != 1'b1) $display("deu ruim na flag da mul");
			end
		end
		else $display("deu ruim na mul");
	end
	endtask
	
	task TesteDiv;
	reg signed [15:0]testeR;
	begin
		testeR = ac / mbr;
		
		if (bus == testeR)
		begin
			if (bus < 0)
			begin
				if (flagn != 1'b1) $display("deu ruim na flag da div");
			end
			if (bus == 0)
			begin
				if (flagz != 1'b1) $display("deu ruim na flag da div");
			end
		end
		else $display("deu ruim na div");
	end
	endtask
	
	task TesteAnd;
	reg signed [15:0]testeR;
	begin
		testeR = ac & mbr;
		
		if (bus == testeR)
		begin
			if (bus < 0)
			begin
				if (flagn != 1'b1) $display("deu ruim na flag da and");
			end
			if (bus == 0)
			begin
				if (flagz != 1'b1) $display("deu ruim na flag da and");
			end
		end
		else $display("deu ruim na and");
	end
	endtask
	
	task TesteOr;
	reg signed [15:0]testeR;
	begin
		testeR = ac | mbr;
		
		if (bus == testeR)
		begin
			if (bus < 0)
			begin
				if (flagn != 1'b1) $display("deu ruim na flag da or");
			end
			if (bus == 0)
			begin
				if (flagz != 1'b1) $display("deu ruim na flag da or");
			end
		end
		else $display("deu ruim na or");
	end
	endtask
	
	task TesteNot;
	reg signed [15:0]testeR;
	begin
		testeR = ~ac;
		
		if (bus == testeR)
		begin
			if (bus < 0)
			begin
				if (flagn != 1'b1) $display("deu ruim na flag da not");
			end
			if (bus == 0)
			begin
				if (flagz != 1'b1) $display("deu ruim na flag da not");
			end
		end
		else $display("deu ruim na not");
	end
	endtask


always @ (ac_wr, mbr_re_m) validando_mbr;


always @ (ir_re)
	begin
		if(compara_mem_i) 
			$display("Comparacao entre IR e MEM OK");
		else 
			$display("Deu ruim na comparacao entre IR e MEM"); 
			$stop;
	end
	
always @ (mar_wr)
	begin
		if(compara_mar_ir) 
			$display("Comparacao entre MAR e IR OK");
		else 
			$display("Deu ruim na comparacao entre MAR e IR"); 
			$stop;
	end
always @ (pc_wr)
	begin
		if(checando_jump) 
			$display("PC recebeu jump de boa");
		else 
			$display("Deu ruim no PC"); 
			$stop;
	end
	
function compara_mem_i;
	input [15:0] out_ir;
	input [15:0] mem_dados;
	begin
		compara_mem_i = 1;
		if (out_mi != out_ir)
		compara_mem_i = 0;
	end
endfunction

function compara_mar_ir;
	input [11:0] mar;
	input [15:0] out_ir;
	begin
		compara_mar_ir = 1;
		if (mar != out_ir[11:0])
		compara_mar_ir = 0;
	end
endfunction

function checando_jump;
	input [11:0] pc;
	input [15:0] out_ir;
	begin
		checando_jump = 1;
		if (pc != out_ir[11:0])
		checando_jump = 0;
	end
endfunction

task validando_mbr;
	begin
		case (bus[15:12])
			lda :
				begin
					if (ac==mbr)
						$display("acumulador recebeu mbr");
					else 
						$display("deu pau no load"); 
						$stop;
				end
			sta:
				begin
					if (mem_dados[mar]==ac)
						$display("Store funcionando");
					else 
						$display("Store deu pau"); 
						$stop;
				end
			(add || sub || mul || div || andp || orp):
				begin
					if (mbr==mbr)
						$display("valor foi pra ula");
					else 
						$display("ula pegou valor errado"); 
						$stop;
				end
		endcase
	end
	endtask

	endmodule 