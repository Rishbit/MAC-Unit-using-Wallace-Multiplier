module mac_unit(in_data_1, in_data_2, clk, clr, out_data);
	
	
	// Signals in_data_1 and in_data_2 are 16 bit data inputs to the MAC Unit.
	// Signal "CLK" is an external clock signal provided to synchronize the accumulator registers.
	// Signal "CLR" is an external clock signal provided to clear the accumulator registers.
	// Signal "out_data" is the 34 bit output signal of the MAC Unit.
	
	input clr, clk;
	input [15:0] in_data_1, in_data_2;
	output [33:0] out_data;
	
	wire [32:0] interm_prd;				// Intermediate output signal from multiplier.
	wire [33:0] interm_sum;				// Intermediate output signal from adder.
	
	
	wallace_mult_16x16_bit MULTIPLIER (in_data_1, in_data_2, interm_prd);
	cla_adder ADDER (interm_prd, out_data, interm_sum);
	accumulator ACCUMULATOR (interm_sum, clk, clr, out_data);
	
endmodule
