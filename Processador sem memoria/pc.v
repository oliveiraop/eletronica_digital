module pc (pc, pc_wr, pc_inicio, bus, pc_inc);
	output reg [11:0] pc;
	input pc_inc, pc_wr, pc_inicio; 
	input [11:0] bus;


	always @ (posedge pc_inc, posedge pc_inicio, posedge pc_wr)
	begin
	if (pc_inicio) pc <= 0;
	else if (pc_wr) pc <= bus;
	else	pc <= pc+1;
	end
endmodule
