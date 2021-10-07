module mar (mar, mar_wr, bus);
	output reg [11:0] mar;
	input mar_wr;
	input [11:0]bus;
	always @ (*)
	begin
		if (mar_wr) mar = bus;
	end
endmodule
