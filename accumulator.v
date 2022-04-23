module accumulator (par_d_in, clk, clr, par_d_out);
	
	// Signal "par_d_in" is the parallel input given to the accumulator.
	// Signal "clk" is the external clock signal given to the accumulator.
	// Signal "clr" is the external asynchronous reset signal to the accumulator.
	// Signal "par_d_out" is the parallel output from the accumulator.
	
	input  clk, clr;
	input  [33:0] par_d_in;
	output [33:0] par_d_out;
	
	// 34 Bit PIPO Register Logic.
	d_flipflop D33 (par_d_in[33], clk, clr, par_d_out[33]);
	d_flipflop D32 (par_d_in[32], clk, clr, par_d_out[32]);
	d_flipflop D31 (par_d_in[31], clk, clr, par_d_out[31]);
	d_flipflop D30 (par_d_in[30], clk, clr, par_d_out[30]);
	d_flipflop D29 (par_d_in[29], clk, clr, par_d_out[29]);
	d_flipflop D28 (par_d_in[28], clk, clr, par_d_out[28]);
	d_flipflop D27 (par_d_in[27], clk, clr, par_d_out[27]);
	d_flipflop D26 (par_d_in[26], clk, clr, par_d_out[26]);
	d_flipflop D25 (par_d_in[25], clk, clr, par_d_out[25]);
	d_flipflop D24 (par_d_in[24], clk, clr, par_d_out[24]);
	d_flipflop D23 (par_d_in[23], clk, clr, par_d_out[23]);
	d_flipflop D22 (par_d_in[22], clk, clr, par_d_out[22]);
	d_flipflop D21 (par_d_in[21], clk, clr, par_d_out[21]);
	d_flipflop D20 (par_d_in[20], clk, clr, par_d_out[20]);
	d_flipflop D19 (par_d_in[19], clk, clr, par_d_out[19]);
	d_flipflop D18 (par_d_in[18], clk, clr, par_d_out[18]);
	d_flipflop D17 (par_d_in[17], clk, clr, par_d_out[17]);
	d_flipflop D16 (par_d_in[16], clk, clr, par_d_out[16]);
	d_flipflop D15 (par_d_in[15], clk, clr, par_d_out[15]);
	d_flipflop D14 (par_d_in[14], clk, clr, par_d_out[14]);
	d_flipflop D13 (par_d_in[13], clk, clr, par_d_out[13]);
	d_flipflop D12 (par_d_in[12], clk, clr, par_d_out[12]);
	d_flipflop D11 (par_d_in[11], clk, clr, par_d_out[11]);
	d_flipflop D10 (par_d_in[10], clk, clr, par_d_out[10]);
	d_flipflop D09 (par_d_in[9],  clk, clr,  par_d_out[9]);
	d_flipflop D08 (par_d_in[8],  clk, clr,  par_d_out[8]);
	d_flipflop D07 (par_d_in[7],  clk, clr,  par_d_out[7]);
	d_flipflop D06 (par_d_in[6],  clk, clr,  par_d_out[6]);
	d_flipflop D05 (par_d_in[5],  clk, clr,  par_d_out[5]);
	d_flipflop D04 (par_d_in[4],  clk, clr,  par_d_out[4]);
	d_flipflop D03 (par_d_in[3],  clk, clr,  par_d_out[3]);
	d_flipflop D02 (par_d_in[2],  clk, clr,  par_d_out[2]);
	d_flipflop D01 (par_d_in[1],  clk, clr,  par_d_out[1]);
	d_flipflop D00 (par_d_in[0],  clk, clr,  par_d_out[0]);
	
endmodule
