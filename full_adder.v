module full_adder (A, B, C_IN, SUM, C_OUT);
	
	input A, B, C_IN;
	output SUM, C_OUT;
	
	wire X, Y, Z;
	
	half_adder h1 (.A(A), .B(B), .SUM(X), .CARRY(Y));
	half_adder h2 (.A(X), .B(C_IN), .SUM(SUM), .CARRY(Z));
	assign C_OUT = Y | Z;
	
endmodule