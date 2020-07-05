module BrentKung32 (A, B, Cin, S, Cout);
    input [31:0] A, B;
    input Cin;
    output [31:0] S;
    output Cout;

    /* Propagate and generate signals for each bit */
    wire [1:0] r1c32, r1c31, r1c30, r1c29, r1c28, r1c27, r1c26, r1c25; 
    wire [1:0] r1c24, r1c23, r1c22, r1c21, r1c20, r1c19, r1c18, r1c17;
    wire [1:0] r1c16, r1c15, r1c14, r1c13, r1c12, r1c11, r1c10, r1c9;
    wire [1:0] r1c8, r1c7, r1c6, r1c5, r1c4, r1c3, r1c2, r1c1;

    pg32 ipg32(A, B, r1c32, r1c31, r1c30,
         r1c29, r1c28, r1c27, r1c26, r1c25,
         r1c24, r1c23, r1c22, r1c21, r1c20,
         r1c19, r1c18, r1c17, r1c16, r1c15,
         r1c14, r1c13, r1c12, r1c11, r1c10,
         r1c9, r1c8, r1c7, r1c6, r1c5, r1c4,
         r1c3, r1c2, r1c1);

    /* First row */
    wire [1:0] r2c31, r2c29, r2c27, r2c25, r2c23, r2c21, r2c19, r2c17;
    wire [1:0] r2c15, r2c13, r2c11, r2c9, r2c7, r2c5, r2c3;
    wire r2c1;

    black ir1c31(r1c31, r1c30, r2c31);
    black ir1c29(r1c29, r1c28, r2c29);
    black ir1c27(r1c27, r1c26, r2c27);
    black ir1c25(r1c25, r1c24, r2c25);
    black ir1c23(r1c23, r1c22, r2c23);
    black ir1c21(r1c21, r1c20, r2c21);
    black ir1c19(r1c19, r1c18, r2c19);
    black ir1c17(r1c17, r1c16, r2c17);
    black ir1c15(r1c15, r1c14, r2c15);
    black ir1c13(r1c13, r1c12, r2c13);
    black ir1c11(r1c11, r1c10, r2c11);
    black ir1c9(r1c9, r1c8, r2c9);
    black ir1c7(r1c7, r1c6, r2c7);
    black ir1c5(r1c5, r1c4, r2c5);
    black ir1c3(r1c3, r1c2, r2c3);
    gray ir1c1(r1c1, Cin, r2c1);

    /* Second row */
    wire [1:0] r3c31, r3c27, r3c23, r3c19, r3c15, r3c11, r3c7;
    wire r3c3;

    black ir2c31(r2c31, r2c29, r3c31);
    black ir2c27(r2c27, r2c25, r3c27);
    black ir2c23(r2c23, r2c21, r3c23);
    black ir2c19(r2c19, r2c17, r3c19);
    black ir2c15(r2c15, r2c13, r3c15);
    black ir2c11(r2c11, r2c9, r3c11);
    black ir2c7(r2c7, r2c5, r3c7);
    gray ir2c3(r2c3, r2c1, r3c3);

    /* Third row */
    wire [1:0] r4c31, r4c23, r4c15;
    wire r4c7;

    black ir3c31(r3c31, r3c27, r4c31);
    black ir3c23(r3c23, r3c19, r4c23);
    black ir3c15(r3c15, r3c11, r4c15);
    gray ir3c7(r3c7, r3c3, r4c7);

    /* Fourth row */
    wire [1:0] r5c31;
    wire r5c15;

    black ir4c31(r4c31, r4c23, r5c31);
    gray ir4c15(r4c15, r4c7, r5c15);

    /* Fifth row */
    wire r6c31, r6c23;

    gray ir5c31(r5c31, r5c15, r6c31);
    gray ir5c23(r4c23, r5c15, r6c23);

    /* Sixth row */
    wire r7c27, r7c19, r7c11;

    gray ir6c27(r3c27, r6c23, r7c27);
    gray ir6c19(r3c19, r5c15, r7c19);
    gray ir6c11(r3c11, r4c7, r7c11);

    /* Seventh row */
    wire r8c29, r8c25, r8c21, r8c17, r8c13, r8c9, r8c5;

    gray ir7c29(r2c29, r7c27, r8c29);
    gray ir7c25(r2c25, r6c23, r8c25);
    gray ir7c21(r2c21, r7c19, r8c21);
    gray ir7c17(r2c17, r5c15, r8c17);
    gray ir7c13(r2c13, r7c11, r8c13);
    gray ir7c9(r2c9, r4c7, r8c9);
    gray ir7c5(r2c5, r3c3, r8c5);

    /* Eighth row */
    wire r9c30, r9c28, r9c26, r9c24, r9c22, r9c20, r9c18, r9c16; 
    wire r9c14, r9c12, r9c10, r9c8, r9c6, r9c4, r9c2;

    gray ir8c30(r1c30, r8c29, r9c30);
    gray ir8c28(r1c28, r7c27, r9c28);
    gray ir8c26(r1c26, r8c25, r9c26);
    gray ir8c24(r1c24, r6c23, r9c24);
    gray ir8c22(r1c22, r8c21, r9c22);
    gray ir8c20(r1c20, r7c19, r9c20);
    gray ir8c18(r1c18, r8c17, r9c18);
    gray ir8c16(r1c16, r5c15, r9c16);
    gray ir8c14(r1c14, r8c13, r9c14);
    gray ir8c12(r1c12, r7c11, r9c12);
    gray ir8c10(r1c10, r8c9, r9c10);
    gray ir8c8(r1c8, r4c7, r9c8);
    gray ir8c6(r1c6, r8c5, r9c6);
    gray ir8c4(r1c4, r3c3, r9c4);
    gray ir8c2(r1c2, r2c1, r9c2);

    /* Finaly produce the sum */
    xor32 ixor32({r6c31,r9c30,r8c29,r9c28,r7c27,r9c26,r8c25,r9c24,r6c23,
        r9c22,r8c21,r9c20,r7c19,r9c18,r8c17,r9c16,r5c15,r9c14,r8c13,r9c12,
	r7c11,r9c10,r8c9,r9c8,r4c7,r9c6,r8c5,r9c4,r3c3,r9c2,r2c1,Cin},
	{r1c32[1], r1c31[1],r1c30[1],r1c29[1],r1c28[1],r1c27[1],r1c26[1],
	r1c25[1],r1c24[1],r1c23[1],r1c22[1],r1c21[1],r1c20[1],r1c19[1],
	r1c18[1],r1c17[1],r1c16[1],r1c15[1],r1c14[1],r1c13[1],r1c12[1],
	r1c11[1],r1c10[1],r1c9[1],r1c8[1],r1c7[1],r1c6[1],r1c5[1],r1c4[1],
	r1c3[1],r1c2[1],r1c1[1]}, S);

    /* Generate Cout */
    gray gcout(r1c32, r6c31, Cout);

endmodule

