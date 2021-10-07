module mbr (out_mbr_b, mbr, mbr_re_b, mbr_wr_b, mbr_wr_m, bus, out_mem_dados);
	output reg signed[15:0] mbr;
	output reg signed [15:0] out_mbr_b;
	input mbr_re_b, mbr_wr_b, mbr_wr_m; 
	input signed [15:0] bus;
	input signed [15:0] out_mem_dados;
	always @ (*)
	begin
		out_mbr_b=16'bZ;
		if (mbr_wr_b) mbr = bus;
		else if (mbr_wr_m) mbr = out_mem_dados;
		if (mbr_re_b) out_mbr_b = mbr;
	end
endmodule

