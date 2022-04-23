module wallace_mult_16x16_bit (DA, DB, PROD);

	
	input [15:0] DA, DB;
	output [32:0] PROD;
	
	
	// ---------------------------------------------------------------------------------------------------------------------------------------------
	// Here, we define the internal SUM and CARRY signals. Nomenclature followed for SUM/CARRY is sXX_XX/cXX_XX.
	// The "XX" before "_" gives the C.S.A of which the s/c bits are the outputs, and the "XX" after "_" gives the bit number of particular s/c.
	
	// Level 1.
	// SUM Bits.
	wire s00_00, s00_01, s00_02, s00_03, s00_04, s00_05, s00_06, s00_07, s00_08, s00_09, s00_10, s00_11, s00_12, s00_13, s00_14, s00_15;																									// From C.S.A. 0.
	wire s01_00, s01_01, s01_02, s01_03, s01_04, s01_05, s01_06, s01_07, s01_08, s01_09, s01_10, s01_11, s01_12, s01_13, s01_14, s01_15;																									// From C.S.A. 1.
	wire s02_00, s02_01, s02_02, s02_03, s02_04, s02_05, s02_06, s02_07, s02_08, s02_09, s02_10, s02_11, s02_12, s02_13, s02_14, s02_15;																									// From C.S.A. 2.
	wire s03_00, s03_01, s03_02, s03_03, s03_04, s03_05, s03_06, s03_07, s03_08, s03_09, s03_10, s03_11, s03_12, s03_13, s03_14, s03_15;																									// From C.S.A. 3.
	wire s04_00, s04_01, s04_02, s04_03, s04_04, s04_05, s04_06, s04_07, s04_08, s04_09, s04_10, s04_11, s04_12, s04_13, s04_14, s04_15;																									// From C.S.A. 4.
	// CARRY Bits.
	wire c00_00, c00_01, c00_02, c00_03, c00_04, c00_05, c00_06, c00_07, c00_08, c00_09, c00_10, c00_11, c00_12, c00_13, c00_14, c00_15;																									// From C.S.A. 0.
	wire c01_00, c01_01, c01_02, c01_03, c01_04, c01_05, c01_06, c01_07, c01_08, c01_09, c01_10, c01_11, c01_12, c01_13, c01_14, c01_15;																									// From C.S.A. 1.
	wire c02_00, c02_01, c02_02, c02_03, c02_04, c02_05, c02_06, c02_07, c02_08, c02_09, c02_10, c02_11, c02_12, c02_13, c02_14, c02_15;																									// From C.S.A. 2.
	wire c03_00, c03_01, c03_02, c03_03, c03_04, c03_05, c03_06, c03_07, c03_08, c03_09, c03_10, c03_11, c03_12, c03_13, c03_14, c03_15;																									// From C.S.A. 3.
	wire c04_00, c04_01, c04_02, c04_03, c04_04, c04_05, c04_06, c04_07, c04_08, c04_09, c04_10, c04_11, c04_12, c04_13, c04_14, c04_15;																									// From C.S.A. 4.
	
	// Level 2.
	// SUM Bits.
	wire s05_00, s05_01, s05_02, s05_03, s05_04, s05_05, s05_06, s05_07, s05_08, s05_09, s05_10, s05_11, s05_12, s05_13, s05_14, s05_15;																									// From C.S.A. 5.
	wire s06_00, s06_01, s06_02, s06_03, s06_04, s06_05, s06_06, s06_07, s06_08, s06_09, s06_10, s06_11, s06_12, s06_13, s06_14, s06_15, s06_16, s06_17;																				// From C.S.A. 6.
	wire s07_00, s07_01, s07_02, s07_03, s07_04, s07_05, s07_06, s07_07, s07_08, s07_09, s07_10, s07_11, s07_12, s07_13, s07_14, s07_15;																									// From C.S.A. 2.
	// CARRY Bits.
	wire c05_00, c05_01, c05_02, c05_03, c05_04, c05_05, c05_06, c05_07, c05_08, c05_09, c05_10, c05_11, c05_12, c05_13, c05_14, c05_15;																									// From C.S.A. 5.
	wire c06_00, c06_01, c06_02, c06_03, c06_04, c06_05, c06_06, c06_07, c06_08, c06_09, c06_10, c06_11, c06_12, c06_13, c06_14, c06_15, c06_16, c06_17;																				// From C.S.A. 6.
	wire c07_00, c07_01, c07_02, c07_03, c07_04, c07_05, c07_06, c07_07, c07_08, c07_09, c07_10, c07_11, c07_12, c07_13, c07_14, c07_15;																									// From C.S.A. 7.
	
	// Level 3.
	// SUM Bits.
	wire s08_00, s08_01, s08_02, s08_03, s08_04, s08_05, s08_06, s08_07, s08_08, s08_09, s08_10, s08_11, s08_12, s08_13, s08_14, s08_15, s08_16, s08_17;																				// From C.S.A. 8.
	wire s09_00, s09_01, s09_02, s09_03, s09_04, s09_05, s09_06, s09_07, s09_08, s09_09, s09_10, s09_11, s09_12, s09_13, s09_14, s09_15, s09_16, s09_17, s09_18;																	// From C.S.A. 9.
	// CARRY Bits.
	wire c08_00, c08_01, c08_02, c08_03, c08_04, c08_05, c08_06, c08_07, c08_08, c08_09, c08_10, c08_11, c08_12, c08_13, c08_14, c08_15, c08_16, c08_17;																				// From C.S.A. 8.
	wire c09_00, c09_01, c09_02, c09_03, c09_04, c09_05, c09_06, c09_07, c09_08, c09_09, c09_10, c09_11, c09_12, c09_13, c09_14, c09_15, c09_16, c09_17, c09_18;																	// From C.S.A. 9.
	
	// Level 4.
	// SUM Bits.
	wire s10_00, s10_01, s10_02, s10_03, s10_04, s10_05, s10_06, s10_07, s10_08, s10_09, s10_10, s10_11, s10_12, s10_13, s10_14, s10_15, s10_16, s10_17, s10_18, s10_19;															// From C.S.A. 10.
	wire s11_00, s11_01, s11_02, s11_03, s11_04, s11_05, s11_06, s11_07, s11_08, s11_09, s11_10, s11_11, s11_12, s11_13, s11_14, s11_15;																									// From C.S.A. 11.
	// CARRY Bits.
	wire c10_00, c10_01, c10_02, c10_03, c10_04, c10_05, c10_06, c10_07, c10_08, c10_09, c10_10, c10_11, c10_12, c10_13, c10_14, c10_15, c10_16, c10_17, c10_18, c10_19;															// From C.S.A. 10.
	wire c11_00, c11_01, c11_02, c11_03, c11_04, c11_05, c11_06, c11_07, c11_08, c11_09, c11_10, c11_11, c11_12, c11_13, c11_14, c11_15;																									// From C.S.A. 11.
	
	// Level 5.
	// SUM Bits.
	wire s12_00, s12_01, s12_02, s12_03, s12_04, s12_05, s12_06, s12_07, s12_08, s12_09, s12_10, s12_11, s12_12, s12_13, s12_14, s12_15, s12_16, s12_17, s12_18, s12_19, s12_20, s12_21, s12_22, s12_23, s12_24;	// From C.S.A. 12.
	// CARRY Bits.
	wire c12_00, c12_01, c12_02, c12_03, c12_04, c12_05, c12_06, c12_07, c12_08, c12_09, c12_10, c12_11, c12_12, c12_13, c12_14, c12_15, c12_16, c12_17, c12_18, c12_19, c12_20, c12_21, c12_22, c12_23, c12_24;	// From C.S.A. 12.
	
	// Level 6.
	// SUM Bits.
	wire s13_00, s13_01, s13_02, s13_03, s13_04, s13_05, s13_06, s13_07, s13_08, s13_09, s13_10, s13_11, s13_12, s13_13, s13_14, s13_15, s13_16, s13_17, s13_18, s13_19, s13_20, s13_21, s13_22, s13_23, s13_24;	// From C.S.A. 13.
	// CARRY Bits.
	wire c13_00, c13_01, c13_02, c13_03, c13_04, c13_05, c13_06, c13_07, c13_08, c13_09, c13_10, c13_11, c13_12, c13_13, c13_14, c13_15, c13_16, c13_17, c13_18, c13_19, c13_20, c13_21, c13_22, c13_23, c13_24;	// From C.S.A. 13.
	
	// Level 7 (Carry Ripple Adder, provides final addition.)
	// SUM Bits.
	wire s14_00, s14_01, s14_02, s14_03, s14_04, s14_05, s14_06, s14_07, s14_08, s14_09, s14_10, s14_11, s14_12, s14_13, s14_14, s14_15, s14_16, s14_17, s14_18, s14_19, s14_20, s14_21, s14_22, s14_23, s14_24;	// From C.R.A. 14.
	// CARRY Bits.
	wire c14_00, c14_01, c14_02, c14_03, c14_04, c14_05, c14_06, c14_07, c14_08, c14_09, c14_10, c14_11, c14_12, c14_13, c14_14, c14_15, c14_16, c14_17, c14_18, c14_19, c14_20, c14_21, c14_22, c14_23, c14_24;	// From C.R.A. 14.
	// ---------------------------------------------------------------------------------------------------------------------------------------------	

	
	// ---------------------------------------------------------------------------------------------------------------------------------------------
	// Here, we define the internal partial product signals. Nomenclature followed is pXX.
	// The "XX" depicts the index of multiplier being multiplied by the multiplicand.
	
	wire [15:0] p00, p01, p02, p03, p04, p05, p06, p07, p08, p09, p10, p11, p12, p13, p14, p15;
	// ---------------------------------------------------------------------------------------------------------------------------------------------
	

	// ---------------------------------------------------------------------------------------------------------------------------------------------
	// Calculating Partial Products.
	// Nomenclature is, pXX. Here, the "XX" depicts the bit of the multiplier that is being multiplied with the multiplicand. One particular product term contains 16 elements, index as pXX[EE].
	// Thus the element p00[0] corresponds to element p00 in the paper-pen method. The element p00[10] corresponds to element p010 of the paper-pen method.
	// The element p07[7] corresponds to element p77 of the paper-pen method. The element p07[11] corresponds to element p711 of the paper-pen method.
	// The element p10[6] corresponds to element p1006 of the paper-pen method. The element p10[10] corresponds to element p1010 of the paper-pen method. (Somehow, I started following correct nomenclature from here on.)
	assign p00 = DA & {16{DB[0]}};
	assign p01 = DA & {16{DB[1]}};
	assign p02 = DA & {16{DB[2]}};
	assign p03 = DA & {16{DB[3]}};
	assign p04 = DA & {16{DB[4]}};
	assign p05 = DA & {16{DB[5]}};
	assign p06 = DA & {16{DB[6]}};
	assign p07 = DA & {16{DB[7]}};
	assign p08 = DA & {16{DB[8]}};
	assign p09 = DA & {16{DB[9]}};
	assign p10 = DA & {16{DB[10]}};
	assign p11 = DA & {16{DB[11]}};
	assign p12 = DA & {16{DB[12]}};
	assign p13 = DA & {16{DB[13]}};
	assign p14 = DA & {16{DB[14]}};
	assign p15 = DA & {16{DB[15]}};
	//----------------------------------------------------------------------------------------------------------------------------------------------
	
	
	//----------------------------------------------------------------------------------------------------------------------------------------------
	// Assigning the outputs of the final adder to the output of the multiplier.
	assign PROD[0] = p00[0];
	assign PROD[1] = s00_00;
	assign PROD[2] = s05_00;
	assign PROD[3] = s08_00;
	assign PROD[4] = s10_00;
	assign PROD[5] = s12_00;
	assign PROD[6] = s13_00;
	assign PROD[7] = s14_00;
	assign PROD[8] = s14_01;
	assign PROD[9] = s14_02;
	assign PROD[10] = s14_03;
	assign PROD[11] = s14_04;
	assign PROD[12] = s14_05;
	assign PROD[13] = s14_06;
	assign PROD[14] = s14_07;
	assign PROD[15] = s14_08;
	assign PROD[16] = s14_09;
	assign PROD[17] = s14_10;
	assign PROD[18] = s14_11;
	assign PROD[19] = s14_12;
	assign PROD[20] = s14_13;
	assign PROD[21] = s14_14;
	assign PROD[22] = s14_15;
	assign PROD[23] = s14_16;
	assign PROD[24] = s14_17;
	assign PROD[25] = s14_18;
	assign PROD[26] = s14_19;
	assign PROD[27] = s14_20;
	assign PROD[28] = s14_21;
	assign PROD[29] = s14_22;
	assign PROD[30] = s14_23;
	assign PROD[31] = s14_24;
	assign PROD[32] = c14_24;
	//----------------------------------------------------------------------------------------------------------------------------------------------
	
	
	//----------------------------------------------------------------------------------------------------------------------------------------------
	// Section for Adder Logic. Nomeclature HA/FAXX_XX is used. Numbers depict the SUM/CARRY output that particular HA/FA provides.

	// Stage 1, Adder 0 (Carry Save Adder).
	half_adder HA00_00 (p00[1],  p01[0],  			  s00_00, c00_00);
	full_adder FA00_01 (p00[2],  p01[1],  p02[0],  s00_01, c00_01);
	full_adder FA00_02 (p00[3],  p01[2],  p02[1],  s00_02, c00_02);
	full_adder FA00_03 (p00[4],  p01[3],  p02[2],  s00_03, c00_03);
	full_adder FA00_04 (p00[5],  p01[4],  p02[3],  s00_04, c00_04);
	full_adder FA00_05 (p00[6],  p01[5],  p02[4],  s00_05, c00_05);
	full_adder FA00_06 (p00[7],  p01[6],  p02[5],  s00_06, c00_06);
	full_adder FA00_07 (p00[8],  p01[7],  p02[6],  s00_07, c00_07);
	full_adder FA00_08 (p00[9],  p01[8],  p02[7],  s00_08, c00_08);
	full_adder FA00_09 (p00[10], p01[9],  p02[8],  s00_09, c00_09);
	full_adder FA00_10 (p00[11], p01[10], p02[9],  s00_10, c00_10);
	full_adder FA00_11 (p00[12], p01[11], p02[10], s00_11, c00_11);
	full_adder FA00_12 (p00[13], p01[12], p02[11], s00_12, c00_12);
	full_adder FA00_13 (p00[14], p01[13], p02[12], s00_13, c00_13);
	full_adder FA00_14 (p00[15], p01[14], p02[13], s00_14, c00_14);
	half_adder HA00_15 (			  p01[15], p02[14], s00_15, c00_15);
	
	// Stage 1, Adder 1 (Carry Save Adder).
	half_adder HA01_00 (p03[1],  p04[0],  			  s01_00, c01_00);
	full_adder FA01_01 (p03[2],  p04[1],  p05[0],  s01_01, c01_01);
	full_adder FA01_02 (p03[3],  p04[2],  p05[1],  s01_02, c01_02);
	full_adder FA01_03 (p03[4],  p04[3],  p05[2],  s01_03, c01_03);
	full_adder FA01_04 (p03[5],  p04[4],  p05[3],  s01_04, c01_04);
	full_adder FA01_05 (p03[6],  p04[5],  p05[4],  s01_05, c01_05);
	full_adder FA01_06 (p03[7],  p04[6],  p05[5],  s01_06, c01_06);
	full_adder FA01_07 (p03[8],  p04[7],  p05[6],  s01_07, c01_07);
	full_adder FA01_08 (p03[9],  p04[8],  p05[7],  s01_08, c01_08);
	full_adder FA01_09 (p03[10], p04[9],  p05[8],  s01_09, c01_09);
	full_adder FA01_10 (p03[11], p04[10], p05[9],  s01_10, c01_10);
	full_adder FA01_11 (p03[12], p04[11], p05[10], s01_11, c01_11);
	full_adder FA01_12 (p03[13], p04[12], p05[11], s01_12, c01_12);
	full_adder FA01_13 (p03[14], p04[13], p05[12], s01_13, c01_13);
	full_adder FA01_14 (p03[15], p04[14], p05[13], s01_14, c01_14);
	half_adder HA01_15 (			  p04[15], p05[14], s01_15, c01_15);
	
	// Stage 1, Adder 2 (Carry Save Adder).
	half_adder HA02_00 (p06[1],  p07[0],  			  s02_00, c02_00);
	full_adder FA02_01 (p06[2],  p07[1],  p08[0],  s02_01, c02_01);
	full_adder FA02_02 (p06[3],  p07[2],  p08[1],  s02_02, c02_02);
	full_adder FA02_03 (p06[4],  p07[3],  p08[2],  s02_03, c02_03);
	full_adder FA02_04 (p06[5],  p07[4],  p08[3],  s02_04, c02_04);
	full_adder FA02_05 (p06[6],  p07[5],  p08[4],  s02_05, c02_05);
	full_adder FA02_06 (p06[7],  p07[6],  p08[5],  s02_06, c02_06);
	full_adder FA02_07 (p06[8],  p07[7],  p08[6],  s02_07, c02_07);
	full_adder FA02_08 (p06[9],  p07[8],  p08[7],  s02_08, c02_08);
	full_adder FA02_09 (p06[10], p07[9],  p08[8],  s02_09, c02_09);
	full_adder FA02_10 (p06[11], p07[10], p08[9],  s02_10, c02_10);
	full_adder FA02_11 (p06[12], p07[11], p08[10], s02_11, c02_11);
	full_adder FA02_12 (p06[13], p07[12], p08[11], s02_12, c02_12);
	full_adder FA02_13 (p06[14], p07[13], p08[12], s02_13, c02_13);
	full_adder FA02_14 (p06[15], p07[14], p08[13], s02_14, c02_14);
	half_adder HA02_15 (			  p07[15], p08[14], s02_15, c02_15);
	
	// Stage 1, Adder 3 (Carry Save Adder).
	half_adder HA03_00 (p09[1],  p10[0],  			  s03_00, c03_00);
	full_adder FA03_01 (p09[2],  p10[1],  p11[0],  s03_01, c03_01);
	full_adder FA03_02 (p09[3],  p10[2],  p11[1],  s03_02, c03_02);
	full_adder FA03_03 (p09[4],  p10[3],  p11[2],  s03_03, c03_03);
	full_adder FA03_04 (p09[5],  p10[4],  p11[3],  s03_04, c03_04);
	full_adder FA03_05 (p09[6],  p10[5],  p11[4],  s03_05, c03_05);
	full_adder FA03_06 (p09[7],  p10[6],  p11[5],  s03_06, c03_06);
	full_adder FA03_07 (p09[8],  p10[7],  p11[6],  s03_07, c03_07);
	full_adder FA03_08 (p09[9],  p10[8],  p11[7],  s03_08, c03_08);
	full_adder FA03_09 (p09[10], p10[9],  p11[8],  s03_09, c03_09);
	full_adder FA03_10 (p09[11], p10[10], p11[9],  s03_10, c03_10);
	full_adder FA03_11 (p09[12], p10[11], p11[10], s03_11, c03_11);
	full_adder FA03_12 (p09[13], p10[12], p11[11], s03_12, c03_12);
	full_adder FA03_13 (p09[14], p10[13], p11[12], s03_13, c03_13);
	full_adder FA03_14 (p09[15], p10[14], p11[13], s03_14, c03_14);
	half_adder HA03_15 (			  p10[15], p11[14], s03_15, c03_15);
	
	// Stage 1, Adder 4 (Carry Save Adder).
	half_adder HA04_00 (p12[1],  p13[0],  			  s04_00, c04_00);
	full_adder FA04_01 (p12[2],  p13[1],  p14[0],  s04_01, c04_01);
	full_adder FA04_02 (p12[3],  p13[2],  p14[1],  s04_02, c04_02);
	full_adder FA04_03 (p12[4],  p13[3],  p14[2],  s04_03, c04_03);
	full_adder FA04_04 (p12[5],  p13[4],  p14[3],  s04_04, c04_04);
	full_adder FA04_05 (p12[6],  p13[5],  p14[4],  s04_05, c04_05);
	full_adder FA04_06 (p12[7],  p13[6],  p14[5],  s04_06, c04_06);
	full_adder FA04_07 (p12[8],  p13[7],  p14[6],  s04_07, c04_07);
	full_adder FA04_08 (p12[9],  p13[8],  p14[7],  s04_08, c04_08);
	full_adder FA04_09 (p12[10], p13[9],  p14[8],  s04_09, c04_09);
	full_adder FA04_10 (p12[11], p13[10], p14[9],  s04_10, c04_10);
	full_adder FA04_11 (p12[12], p13[11], p14[10], s04_11, c04_11);
	full_adder FA04_12 (p12[13], p13[12], p14[11], s04_12, c04_12);
	full_adder FA04_13 (p12[14], p13[13], p14[12], s04_13, c04_13);
	full_adder FA04_14 (p12[15], p13[14], p14[13], s04_14, c04_14);
	half_adder HA04_15 (			  p13[15], p14[14], s04_15, c04_15);
	
	// Stage 2, Adder 5 (Carry Save Adder).
	half_adder HA05_00 (s00_01,  c00_00,  			  s05_00, c05_00);
	full_adder FA05_01 (s00_02,  c00_01,  p03[0],  s05_01, c05_01);
	full_adder FA05_02 (s00_03,  c00_02,  s01_00,  s05_02, c05_02);
	full_adder FA05_03 (s00_04,  c00_03,  s01_01,  s05_03, c05_03);
	full_adder FA05_04 (s00_05,  c00_04,  s01_02,  s05_04, c05_04);
	full_adder FA05_05 (s00_06,  c00_05,  s01_03,  s05_05, c05_05);
	full_adder FA05_06 (s00_07,  c00_06,  s01_04,  s05_06, c05_06);
	full_adder FA05_07 (s00_08,  c00_07,  s01_05,  s05_07, c05_07);
	full_adder FA05_08 (s00_09,  c00_08,  s01_06,  s05_08, c05_08);
	full_adder FA05_09 (s00_10,  c00_09,  s01_07,  s05_09, c05_09);
	full_adder FA05_10 (s00_11,  c00_10,  s01_08,  s05_10, c05_10);
	full_adder FA05_11 (s00_12,  c00_11,  s01_09,  s05_11, c05_11);
	full_adder FA05_12 (s00_13,  c00_12,  s01_10,  s05_12, c05_12);
	full_adder FA05_13 (s00_14,  c00_13,  s01_11,  s05_13, c05_13);
	full_adder FA05_14 (s00_15,  c00_14,  s01_12,  s05_14, c05_14);
	full_adder FA05_15 (p02[15], c00_15,  s01_13,  s05_15, c05_15);
	
	// Stage 2, Adder 6 (Carry Save Adder).
	half_adder HA06_00 (c01_01,  p06[0],  			  s06_00, c06_00);
	half_adder HA06_01 (c01_02,  s02_00,  			  s06_01, c06_01);
	full_adder FA06_02 (c01_03,  s02_01,  c02_00,  s06_02, c06_02);
	full_adder FA06_03 (c01_04,  s02_02,  c02_01,  s06_03, c06_03);
	full_adder FA06_04 (c01_05,  s02_03,  c02_02,  s06_04, c06_04);
	full_adder FA06_05 (c01_06,  s02_04,  c02_03,  s06_05, c06_05);
	full_adder FA06_06 (c01_07,  s02_05,  c02_04,  s06_06, c06_06);
	full_adder FA06_07 (c01_08,  s02_06,  c02_05,  s06_07, c06_07);
	full_adder FA06_08 (c01_09,  s02_07,  c02_06,  s06_08, c06_08);
	full_adder FA06_09 (c01_10,  s02_08,  c02_07,  s06_09, c06_09);
	full_adder FA06_10 (c01_11,  s02_09,  c02_08,  s06_10, c06_10);
	full_adder FA06_11 (c01_12,  s02_10,  c02_09,  s06_11, c06_11);
	full_adder FA06_12 (c01_13,  s02_11,  c02_10,  s06_12, c06_12);
	full_adder FA06_13 (c01_14,  s02_12,  c02_11,  s06_13, c06_13);
	full_adder FA06_14 (c01_15,  s02_13,  c02_12,  s06_14, c06_14);
	half_adder HA06_15 (			  s02_14,  c02_13,  s06_15, c06_15);
	half_adder HA06_16 (			  s02_15,  c02_14,  s06_16, c06_16);
	half_adder HA06_17 (			  p08[15], c02_15,  s06_17, c06_17);
	
	// Stage 2, Adder 7 (Carry Save Adder).
	half_adder HA07_00 (s03_01,  c03_00,  			  s07_00, c07_00);
	full_adder FA07_01 (s03_02,  c03_01,  p12[0],  s07_01, c07_01);
	full_adder FA07_02 (s03_03,  c03_02,  s04_00,  s07_02, c07_02);
	full_adder FA07_03 (s03_04,  c03_03,  s04_01,  s07_03, c07_03);
	full_adder FA07_04 (s03_05,  c03_04,  s04_02,  s07_04, c07_04);
	full_adder FA07_05 (s03_06,  c03_05,  s04_03,  s07_05, c07_05);
	full_adder FA07_06 (s03_07,  c03_06,  s04_04,  s07_06, c07_06);
	full_adder FA07_07 (s03_08,  c03_07,  s04_05,  s07_07, c07_07);
	full_adder FA07_08 (s03_09,  c03_08,  s04_06,  s07_08, c07_08);
	full_adder FA07_09 (s03_10,  c03_09,  s04_07,  s07_09, c07_09);
	full_adder FA07_10 (s03_11,  c03_10,  s04_08,  s07_10, c07_10);
	full_adder FA07_11 (s03_12,  c03_11,  s04_09,  s07_11, c07_11);
	full_adder FA07_12 (s03_13,  c03_12,  s04_10,  s07_12, c07_12);
	full_adder FA07_13 (s03_14,  c03_13,  s04_11,  s07_13, c07_13);
	full_adder FA07_14 (s03_15,  c03_14,  s04_12,  s07_14, c07_14);
	full_adder FA07_15 (p11[15], c03_15,  s04_13,  s07_15, c07_15);
	
	// Stage 3, Adder 8 (Carry Save Adder).
	half_adder HA08_00 (s05_01,  c05_00,  			  s08_00, c08_00);
	half_adder HA08_01 (s05_02,  c05_01,  			  s08_01, c08_01);
	full_adder FA08_02 (s05_03,  c05_02,  c01_00,  s08_02, c08_02);
	full_adder FA08_03 (s05_04,  c05_03,  s06_00,  s08_03, c08_03);
	full_adder FA08_04 (s05_05,  c05_04,  s06_01,  s08_04, c08_04);
	full_adder FA08_05 (s05_06,  c05_05,  s06_02,  s08_05, c08_05);
	full_adder FA08_06 (s05_07,  c05_06,  s06_03,  s08_06, c08_06);
	full_adder FA08_07 (s05_08,  c05_07,  s06_04,  s08_07, c08_07);
	full_adder FA08_08 (s05_09,  c05_08,  s06_05,  s08_08, c08_08);
	full_adder FA08_09 (s05_10,  c05_09,  s06_06,  s08_09, c08_09);
	full_adder FA08_10 (s05_11,  c05_10,  s06_07,  s08_10, c08_10);
	full_adder FA08_11 (s05_12,  c05_11,  s06_08,  s08_11, c08_11);
	full_adder FA08_12 (s05_13,  c05_12,  s06_09,  s08_12, c08_12);
	full_adder FA08_13 (s05_14,  c05_13,  s06_10,  s08_13, c08_13);
	full_adder FA08_14 (s05_15,  c05_14,  s06_11,  s08_14, c08_14);		// Change Made
	full_adder FA08_15 (s01_14,  c05_15,  s06_12,  s08_15, c08_15);
	half_adder HA08_16 (s01_15,    		  s06_13,  s08_16, c08_16);
	half_adder HA08_17 (p05[15],			  s06_14,  s08_17, c08_17);
	
	// Stage 3, Adder 9 (Carry Save Adder).
	half_adder HA09_00 (c06_02,  p09[0],  			  s09_00, c09_00);
	half_adder HA09_01 (c06_03,  s03_00,  			  s09_01, c09_01);
	half_adder FA09_02 (c06_04,  s07_00,  			  s09_02, c09_02);
	full_adder FA09_03 (c06_05,  s07_01,  c07_00,  s09_03, c09_03);
	full_adder FA09_04 (c06_06,  s07_02,  c07_01,  s09_04, c09_04);
	full_adder FA09_05 (c06_07,  s07_03,  c07_02,  s09_05, c09_05);
	full_adder FA09_06 (c06_08,  s07_04,  c07_03,  s09_06, c09_06);
	full_adder FA09_07 (c06_09,  s07_05,  c07_04,  s09_07, c09_07);
	full_adder FA09_08 (c06_10,  s07_06,  c07_05,  s09_08, c09_08);
	full_adder FA09_09 (c06_11,  s07_07,  c07_06,  s09_09, c09_09);
	full_adder FA09_10 (c06_12,  s07_08,  c07_07,  s09_10, c09_10);
	full_adder FA09_11 (c06_13,  s07_09,  c07_08,  s09_11, c09_11);
	full_adder FA09_12 (c06_14,  s07_10,  c07_09,  s09_12, c09_12);
	full_adder FA09_13 (c06_15,  s07_11,  c07_10,  s09_13, c09_13);
	full_adder FA09_14 (c06_16,  s07_12,  c07_11,  s09_14, c09_14);
	full_adder FA09_15 (c06_17,  s07_13,  c07_12,  s09_15, c09_15);
	half_adder HA09_16 (			  s07_14,  c07_13,  s09_16, c09_16);
	half_adder HA09_17 (			  s07_15,  c07_14,  s09_17, c09_17);
	half_adder FA09_18 (			  s04_14,  c07_15,  s09_18, c09_18);
	
	// Stage 4, Adder 10 (Carry Save Adder).
	half_adder HA10_00 (s08_01,  c08_00,  			  s10_00, c10_00);
	half_adder HA10_01 (s08_02,  c08_01,  			  s10_01, c10_01);
	half_adder FA10_02 (s08_03,  c08_02,  			  s10_02, c10_02);
	full_adder FA10_03 (s08_04,  c08_03,  c06_00,  s10_03, c10_03);
	full_adder FA10_04 (s08_05,  c08_04,  c06_01,  s10_04, c10_04);
	full_adder FA10_05 (s08_06,  c08_05,  s09_00,  s10_05, c10_05);
	full_adder FA10_06 (s08_07,  c08_06,  s09_01,  s10_06, c10_06);
	full_adder FA10_07 (s08_08,  c08_07,  s09_02,  s10_07, c10_07);
	full_adder FA10_08 (s08_09,  c08_08,  s09_03,  s10_08, c10_08);
	full_adder FA10_09 (s08_10,  c08_09,  s09_04,  s10_09, c10_09);
	full_adder FA10_10 (s08_11,  c08_10,  s09_05,  s10_10, c10_10);
	full_adder FA10_11 (s08_12,  c08_11,  s09_06,  s10_11, c10_11);
	full_adder FA10_12 (s08_13,  c08_12,  s09_07,  s10_12, c10_12);
	full_adder FA10_13 (s08_14,  c08_13,  s09_08,  s10_13, c10_13);
	full_adder FA10_14 (s08_15,  c08_14,  s09_09,  s10_14, c10_14);
	full_adder FA10_15 (s08_16,  c08_15,  s09_10,  s10_15, c10_15);
	full_adder FA10_16 (s08_17,  c08_16,  s09_11,  s10_16, c10_16);
	full_adder FA10_17 (s06_15,  c08_17,  s09_12,  s10_17, c10_17);
	half_adder HA10_18 (s06_16,			  s09_13,  s10_18, c10_18);
	half_adder HA10_19 (s06_17,			  s09_14,  s10_19, c10_19);
	
	// Stage 4, Adder 11 (Carry Save Adder).
	half_adder HA11_00 (c09_04,  c04_00,  			  s11_00, c11_00);
	full_adder FA11_01 (c09_05,  c04_01,  p15[0],  s11_01, c11_01);
	full_adder FA11_02 (c09_06,  c04_02,  p15[1],  s11_02, c11_02);
	full_adder FA11_03 (c09_07,  c04_03,  p15[2],  s11_03, c11_03);
	full_adder FA11_04 (c09_08,  c04_04,  p15[3],  s11_04, c11_04);
	full_adder FA11_05 (c09_09,  c04_05,  p15[4],  s11_05, c11_05);
	full_adder FA11_06 (c09_10,  c04_06,  p15[5],  s11_06, c11_06);
	full_adder FA11_07 (c09_11,  c04_07,  p15[6],  s11_07, c11_07);
	full_adder FA11_08 (c09_12,  c04_08,  p15[7],  s11_08, c11_08);
	full_adder FA11_09 (c09_13,  c04_09,  p15[8],  s11_09, c11_09);
	full_adder FA11_10 (c09_14,  c04_10,  p15[9],  s11_10, c11_10);
	full_adder FA11_11 (c09_15,  c04_11,  p15[10], s11_11, c11_11);
	full_adder FA11_12 (c09_16,  c04_12,  p15[11], s11_12, c11_12);
	full_adder FA11_13 (c09_17,  c04_13,  p15[12], s11_13, c11_13);
	full_adder FA11_14 (c09_18,  c04_14,  p15[13], s11_14, c11_14);
	half_adder HA11_15 (			  c04_15,  p15[14], s11_15, c11_15);		// Change Made.
	
	// Stage 5, Adder 12 (Carry Save Adder).
	half_adder HA12_00 (s10_01,  c10_00,  			  s12_00, c12_00);
	half_adder HA12_01 (s10_02,  c10_01,  			  s12_01, c12_01);
	half_adder HA12_02 (s10_03,  c10_02,  			  s12_02, c12_02);
	half_adder HA12_03 (s10_04,  c10_03,  			  s12_03, c12_03);
	half_adder HA12_04 (s10_05,  c10_04,  			  s12_04, c12_04);
	full_adder FA12_05 (s10_06,  c10_05,  c09_00,  s12_05, c12_05);
	full_adder FA12_06 (s10_07,  c10_06,  c09_01,  s12_06, c12_06);
	full_adder FA12_07 (s10_08,  c10_07,  c09_02,  s12_07, c12_07);
	full_adder FA12_08 (s10_09,  c10_08,  c09_03,  s12_08, c12_08);
	full_adder FA12_09 (s10_10,  c10_09,  s11_00,  s12_09, c12_09);
	full_adder FA12_10 (s10_11,  c10_10,  s11_01,  s12_10, c12_10);
	full_adder FA12_11 (s10_12,  c10_11,  s11_02,  s12_11, c12_11);
	full_adder FA12_12 (s10_13,  c10_12,  s11_03,  s12_12, c12_12);
	full_adder FA12_13 (s10_14,  c10_13,  s11_04,  s12_13, c12_13);
	full_adder FA12_14 (s10_15,  c10_14,  s11_05,  s12_14, c12_14);
	full_adder FA12_15 (s10_16,  c10_15,  s11_06,  s12_15, c12_15);
	full_adder FA12_16 (s10_17,  c10_16,  s11_07,  s12_16, c12_16);
	full_adder FA12_17 (s10_18,  c10_17,  s11_08,  s12_17, c12_17);
	full_adder FA12_18 (s10_19,  c10_18,  s11_09,  s12_18, c12_18);
	full_adder FA12_19 (s09_15,  c10_19,  s11_10,  s12_19, c12_19);
	half_adder HA12_20 (s09_16,    		  s11_11,  s12_20, c12_20);
	half_adder HA12_21 (s09_17,    		  s11_12,  s12_21, c12_21);
	half_adder HA12_22 (s09_18,    		  s11_13,  s12_22, c12_22);
	half_adder HA12_23 (s04_15,    		  s11_14,  s12_23, c12_23);
	half_adder HA12_24 (p14[15],   		  s11_15,  s12_24, c12_24);
	
	// Stage 6, Adder 13 (Carry Save Adder).
	half_adder HA13_00 (s12_01,  c12_00,  			  s13_00, c13_00);
	half_adder HA13_01 (s12_02,  c12_01,  			  s13_01, c13_01);
	half_adder HA13_02 (s12_03,  c12_02,  			  s13_02, c13_02);
	half_adder HA13_03 (s12_04,  c12_03,  			  s13_03, c13_03);
	half_adder HA13_04 (s12_05,  c12_04,  			  s13_04, c13_04);
	half_adder FA13_05 (s12_06,  c12_05,    		  s13_05, c13_05);
	half_adder FA13_06 (s12_07,  c12_06,    		  s13_06, c13_06);
	half_adder FA13_07 (s12_08,  c12_07,    		  s13_07, c13_07);
	half_adder FA13_08 (s12_09,  c12_08,    		  s13_08, c13_08);
	full_adder FA13_09 (s12_10,  c12_09,  c11_00,  s13_09, c13_09);
	full_adder FA13_10 (s12_11,  c12_10,  c11_01,  s13_10, c13_10);
	full_adder FA13_11 (s12_12,  c12_11,  c11_02,  s13_11, c13_11);
	full_adder FA13_12 (s12_13,  c12_12,  c11_03,  s13_12, c13_12);
	full_adder FA13_13 (s12_14,  c12_13,  c11_04,  s13_13, c13_13);
	full_adder FA13_14 (s12_15,  c12_14,  c11_05,  s13_14, c13_14);
	full_adder FA13_15 (s12_16,  c12_15,  c11_06,  s13_15, c13_15);
	full_adder FA13_16 (s12_17,  c12_16,  c11_07,  s13_16, c13_16);
	full_adder FA13_17 (s12_18,  c12_17,  c11_08,  s13_17, c13_17);
	full_adder FA13_18 (s12_19,  c12_18,  c11_09,  s13_18, c13_18);
	full_adder FA13_19 (s12_20,  c12_19,  c11_10,  s13_19, c13_19);
	full_adder HA13_20 (s12_21,  c12_20,  c11_11,  s13_20, c13_20);
	full_adder HA13_21 (s12_22,  c12_21,  c11_12,  s13_21, c13_21);
	full_adder HA13_22 (s12_23,  c12_22,  c11_13,  s13_22, c13_22);
	full_adder HA13_23 (s12_24,  c12_23,  c11_14,  s13_23, c13_23);
	full_adder HA13_24 (p15[15], c12_24,  c11_15,  s13_24, c13_24);
	
	// Stage 7, Adder 14 (Carry Ripple Adder).
	half_adder HA14_00 (s13_01,  c13_00,  			  s14_00, c14_00);
	full_adder HA14_01 (s13_02,  c13_01,  c14_00,  s14_01, c14_01);
	full_adder HA14_02 (s13_03,  c13_02,  c14_01,  s14_02, c14_02);
	full_adder HA14_03 (s13_04,  c13_03,  c14_02,  s14_03, c14_03);
	full_adder HA14_04 (s13_05,  c13_04,  c14_03,  s14_04, c14_04);
	full_adder FA14_05 (s13_06,  c13_05,  c14_04,  s14_05, c14_05);
	full_adder FA14_06 (s13_07,  c13_06,  c14_05,  s14_06, c14_06);
	full_adder FA14_07 (s13_08,  c13_07,  c14_06,  s14_07, c14_07);
	full_adder FA14_08 (s13_09,  c13_08,  c14_07,  s14_08, c14_08);
	full_adder FA14_09 (s13_10,  c13_09,  c14_08,  s14_09, c14_09);
	full_adder FA14_10 (s13_11,  c13_10,  c14_09,  s14_10, c14_10);
	full_adder FA14_11 (s13_12,  c13_11,  c14_10,  s14_11, c14_11);
	full_adder FA14_12 (s13_13,  c13_12,  c14_11,  s14_12, c14_12);
	full_adder FA14_13 (s13_14,  c13_13,  c14_12,  s14_13, c14_13);
	full_adder FA14_14 (s13_15,  c13_14,  c14_13,  s14_14, c14_14);
	full_adder FA14_15 (s13_16,  c13_15,  c14_14,  s14_15, c14_15);
	full_adder FA14_16 (s13_17,  c13_16,  c14_15,  s14_16, c14_16);
	full_adder FA14_17 (s13_18,  c13_17,  c14_16,  s14_17, c14_17);
	full_adder FA14_18 (s13_19,  c13_18,  c14_17,  s14_18, c14_18);
	full_adder FA14_19 (s13_20,  c13_19,  c14_18,  s14_19, c14_19);
	full_adder HA14_20 (s13_21,  c13_20,  c14_19,  s14_20, c14_20);
	full_adder HA14_21 (s13_22,  c13_21,  c14_20,  s14_21, c14_21);
	full_adder HA14_22 (s13_23,  c13_22,  c14_21,  s14_22, c14_22);
	full_adder HA14_23 (s13_24,  c13_23,  c14_22,  s14_23, c14_23);
	half_adder HA14_24 (			  c13_24,  c14_23,  s14_24, c14_24);
	//----------------------------------------------------------------------------------------------------------------------------------------------
	
endmodule
