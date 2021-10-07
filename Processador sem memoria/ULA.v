module ULA(ac, mbr, ula_sel, ula_re, result, flagz, flagn);

	input signed [15:0]ac;
	input signed [15:0]mbr;
	input [3:0]ula_sel;
	input ula_re;
	output reg flagz;
	output reg flagn;
	output reg signed [15:0]result;
	
	reg signed [15:0]resultInt;
	
	
	parameter add = 4'b0010;
	parameter sub = 4'b0011;
	parameter mul = 4'b0100;
	parameter div = 4'b0101;
	parameter andp = 4'b0110;
	parameter orp = 4'b0111;
	parameter notp = 4'b1000;
	
	always @ (*)
	begin
		if (ula_re) 
		begin
			result = resultInt;
			if (resultInt<0)		flagn = 1'b1;
			else		flagn=1'b0;
			if (resultInt == 0)		flagz = 1'b1;
			else flagz= 1'b0;
		end
		else result = 16'bZ;
		case (ula_sel)
			add:
				begin
				resultInt = ac+mbr;
				end
			sub:
				begin
				resultInt = ac - mbr;
				end
			mul:
				begin
				resultInt = ac*mbr;
				end
			div:
				begin
				resultInt = ac/mbr;
				end
			andp:
				begin
				resultInt = ac & mbr;
				end
			orp:
				begin
				resultInt = ac | mbr;
				end
			notp:
				begin
				resultInt = ~ac;
				end
			default:
			begin
			end
		endcase
	end
	
		
	
endmodule
	


	
	
	
	
	
	
	