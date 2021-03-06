`timescale	 1ns/1ns
module Harvard_Processor_tb;

	reg	clock;
	reg	reset;
	reg [15:0]out_mi;
	reg signed [15:0]out_md;
	wire	clk_md;
	wire	clk_mi;
	wire	wren;
	wire	[11:0]mar;
	wire	signed [15:0]mbr;
	wire	[11:0]pc;



	Harvard_Processor Harvard_Processor_inst
	(
		.clock(clock) ,	// input  clock_sig
		.reset(reset) ,	// input  reset_sig
		.out_md(out_md) ,	// input [15:0] out_md_sig
		.out_mi(out_mi) ,	// input [15:0] out_mi_sig
		.clk_md(clk_md) ,	// output  clk_md_sig
		.clk_mi(clk_mi) ,	// output  clk_mi_sig
		.wren(wren) ,	// output  wren_sig
		.mar(mar) ,	// output [11:0] mar_sig
		.mbr(mbr) ,	// output [15:0] mbr_sig
		.pc(pc) 	// output [11:0] pc_sig
	);

	reg [15:0]mem_i[0:255];
	reg signed [15:0]mem_d[0:255];
	reg signed [15:0]mem_d_final[0:255];
	initial
	begin
		$readmemb("operacoes.mem", mem_i);
		$readmemb("memo antes.mem", mem_d);
		$readmemb("memo depois.mem", mem_d_final);
	end
	
	
	initial
	begin
		clock= 0;
		forever
			begin
				#100 clock = ~clock;
			end
	end
	
	initial
	begin
		reset = 0;
		#50 reset = 1;
		#99 reset = 0;
	end
	
	always @ (posedge clk_mi)
	begin
		out_mi = mem_i[pc];
	end
	 
	always @ (posedge clk_md)
	begin
		if (wren)
		begin
			mem_d[mar] = mbr;
		end
		else out_md = mem_d[mar];
	end
	
	
	always @ (pc)
	begin
			if (out_mi == 16'b1111111111111111) // sinalizar final do processo
			begin
			Comparar_memo;
			end
	end

	task Comparar_memo;
	integer i;
		begin
			for(i=0; i<256; i= i+1)
			begin
				if (mem_d[i] != mem_d_final[i])
				begin
				$display("Deu ruim na mem_d posicao %d, esperado era %d e veio %d", i, mem_d_final[i], mem_d[i]);
				end
			end 
			$display("Final do codigo");
			$stop;
		end
	endtask 
	
endmodule 