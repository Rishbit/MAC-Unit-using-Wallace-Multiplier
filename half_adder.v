module half_adder (A, B, SUM, CARRY);

	input A, B;
	output SUM, CARRY;
	
	
	assign SUM = A ^ B;
	assign CARRY = A & B;
	
endmodule