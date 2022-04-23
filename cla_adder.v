module cla_adder (A, B, S);	// Carry output won't be generated in this system.
	
	
	input [32:0] A;
	input [33:0] B;
	output [33:0] S;
	
	wire G00, G01, G02, G03, G04, G05, G06, G07, G08, G09;
	wire G10, G11, G12, G13, G14, G15, G16, G17, G18, G19;
	wire G20, G21, G22, G23, G24, G25, G26, G27, G28, G29;
	wire G30, G31, G32, G33;
	
	wire P00, P01, P02, P03, P04, P05, P06, P07, P08, P09;
	wire P10, P11, P12, P13, P14, P15, P16, P17, P18, P19;
	wire P20, P21, P22, P23, P24, P25, P26, P27, P28, P29;
	wire P30, P31, P32, P33;
	
	wire C00, C01, C02, C03, C04, C05, C06, C07, C08, C09;
	wire C10, C11, C12, C13, C14, C15, C16, C17, C18, C19;
	wire C20, C21, C22, C23, C24, C25, C26, C27, C28, C29;
	wire C30, C31, C32, C33, C34;
	
	
	assign G00 = A[0]  & B[0];
	assign G01 = A[1]  & B[1];
	assign G02 = A[2]  & B[2];
	assign G03 = A[3]  & B[3];
	assign G04 = A[4]  & B[4];
	assign G05 = A[5]  & B[5];
	assign G06 = A[6]  & B[6];
	assign G07 = A[7]  & B[7];
	assign G08 = A[8]  & B[8];
	assign G09 = A[9]  & B[9];
	assign G10 = A[10] & B[10];
	assign G11 = A[11] & B[11];
	assign G12 = A[12] & B[12];
	assign G13 = A[13] & B[13];
	assign G14 = A[14] & B[14];
	assign G15 = A[15] & B[15];
	assign G16 = A[16] & B[16];
	assign G17 = A[17] & B[17];
	assign G18 = A[18] & B[18];
	assign G19 = A[19] & B[19];
	assign G20 = A[20] & B[20];
	assign G21 = A[21] & B[21];
	assign G22 = A[22] & B[22];
	assign G23 = A[23] & B[23];
	assign G24 = A[24] & B[24];
	assign G25 = A[25] & B[25];
	assign G26 = A[26] & B[26];
	assign G27 = A[27] & B[27];
	assign G28 = A[28] & B[28];
	assign G29 = A[29] & B[29];
	assign G30 = A[30] & B[30];
	assign G31 = A[31] & B[31];
	assign G32 = A[32] & B[32];
	assign G33 = 1'b0  & B[33];
	
	
	assign P00 = A[0]  ^ B[0];
	assign P01 = A[1]  ^ B[1];
	assign P02 = A[2]  ^ B[2];
	assign P03 = A[3]  ^ B[3];
	assign P04 = A[4]  ^ B[4];
	assign P05 = A[5]  ^ B[5];
	assign P06 = A[6]  ^ B[6];
	assign P07 = A[7]  ^ B[7];
	assign P08 = A[8]  ^ B[8];
	assign P09 = A[9]  ^ B[9];
	assign P10 = A[10] ^ B[10];
	assign P11 = A[11] ^ B[11];
	assign P12 = A[12] ^ B[12];
	assign P13 = A[13] ^ B[13];
	assign P14 = A[14] ^ B[14];
	assign P15 = A[15] ^ B[15];
	assign P16 = A[16] ^ B[16];
	assign P17 = A[17] ^ B[17];
	assign P18 = A[18] ^ B[18];
	assign P19 = A[19] ^ B[19];
	assign P20 = A[20] ^ B[20];
	assign P21 = A[21] ^ B[21];
	assign P22 = A[22] ^ B[22];
	assign P23 = A[23] ^ B[23];
	assign P24 = A[24] ^ B[24];
	assign P25 = A[25] ^ B[25];
	assign P26 = A[26] ^ B[26];
	assign P27 = A[27] ^ B[27];
	assign P28 = A[28] ^ B[28];
	assign P29 = A[29] ^ B[29];
	assign P30 = A[30] ^ B[30];
	assign P31 = A[31] ^ B[31];
	assign P32 = A[32] ^ B[32];
	assign P33 = 1'b0  ^ B[33];
	
	
	assign C00 = 1'b0;
	assign C01 = G00 | (P00 & C00);
	assign C02 = G01 | (P01 & C01);
	assign C03 = G02 | (P02 & C02);
	assign C04 = G03 | (P03 & C03);
	assign C05 = G04 | (P04 & C04);
	assign C06 = G05 | (P05 & C05);
	assign C07 = G06 | (P06 & C06);
	assign C08 = G07 | (P07 & C07);
	assign C09 = G08 | (P08 & C08);
	assign C10 = G09 | (P09 & C09);
	assign C11 = G10 | (P10 & C10);
	assign C12 = G11 | (P11 & C11);
	assign C13 = G12 | (P12 & C12);
	assign C14 = G13 | (P13 & C13);
	assign C15 = G14 | (P14 & C14);
	assign C16 = G15 | (P15 & C15);
	assign C17 = G16 | (P16 & C16);
	assign C18 = G17 | (P17 & C17);
	assign C19 = G18 | (P18 & C18);
	assign C20 = G19 | (P19 & C19);
	assign C21 = G20 | (P20 & C20);
	assign C22 = G21 | (P21 & C21);
	assign C23 = G22 | (P22 & C22);
	assign C24 = G23 | (P23 & C23);
	assign C25 = G24 | (P24 & C24);
	assign C26 = G25 | (P25 & C25);
	assign C27 = G26 | (P26 & C26);
	assign C28 = G27 | (P27 & C27);
	assign C29 = G28 | (P28 & C28);
	assign C30 = G29 | (P29 & C29);
	assign C31 = G30 | (P30 & C30);
	assign C32 = G31 | (P31 & C31);
	assign C33 = G32 | (P32 & C32);
	assign C34 = G33 | (P33 & C33);		//This one is the output carry of the last full adder block in the CLA.
	// assign C_OUT = C34;
	
	
	assign S[0]  = P00 ^ C00;
	assign S[1]  = P01 ^ C01;
	assign S[2]  = P02 ^ C02;
	assign S[3]  = P03 ^ C03;
	assign S[4]  = P04 ^ C04;
	assign S[5]  = P05 ^ C05;
	assign S[6]  = P06 ^ C06;
	assign S[7]  = P07 ^ C07;
	assign S[8]  = P08 ^ C08;
	assign S[9]  = P09 ^ C09;
	assign S[10] = P10 ^ C10;
	assign S[11] = P11 ^ C11;
	assign S[12] = P12 ^ C12;
	assign S[13] = P13 ^ C13;
	assign S[14] = P14 ^ C14;
	assign S[15] = P15 ^ C15;
	assign S[16] = P16 ^ C16;
	assign S[17] = P17 ^ C17;
	assign S[18] = P18 ^ C18;
	assign S[19] = P19 ^ C19;
	assign S[20] = P20 ^ C20;
	assign S[21] = P21 ^ C21;
	assign S[22] = P22 ^ C22;
	assign S[23] = P23 ^ C23;
	assign S[24] = P24 ^ C24;
	assign S[25] = P25 ^ C25;
	assign S[26] = P26 ^ C26;
	assign S[27] = P27 ^ C27;
	assign S[28] = P28 ^ C28;
	assign S[29] = P29 ^ C29;
	assign S[30] = P30 ^ C30;
	assign S[31] = P31 ^ C31;
	assign S[32] = P32 ^ C32;
	assign S[33] = P33 ^ C33;
	
endmodule
