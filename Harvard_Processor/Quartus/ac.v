module ac (out_ac_b, ac, ac_re, ac_wr, bus);
	output reg signed [15:0]out_ac_b;
	input ac_re, ac_wr;
	input signed [15:0]bus;
	output reg signed [15:0]ac;
	always @ (*)
	begin
		out_ac_b = 16'bZ;
		if (ac_wr) ac = bus;
		if (ac_re) out_ac_b = ac;
	end
endmodule
