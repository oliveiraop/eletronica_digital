module ir (out_ir, ir_re, ir_wr, out_mem_instrucao);
	output reg [15:0]out_ir;
	input ir_re, ir_wr;
	input [15:0]out_mem_instrucao;
	reg [15:0]valor;
	always @ (*)
	begin
	out_ir=16'bZ;
		if (ir_wr) valor = out_mem_instrucao;
		if (ir_re) out_ir = valor;
	end
endmodule
