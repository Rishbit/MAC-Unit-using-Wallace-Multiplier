module d_flipflop (d, clk, clr, q);
	
	input d, clk, clr;
	output reg q;
	
	always @(posedge clk)	begin
		if (clr == 1)
		begin
			q <= 0;
		end
		
		else
		begin
			q <= d;
		end
	end
	
endmodule