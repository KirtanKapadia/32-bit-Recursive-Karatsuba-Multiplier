module LadnerFischer32 (A, B, Cin, S, Cout);
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
    wire [1:0] r4c31, r4c29, r4c23, r4c21, r4c15, r4c13;
    wire r4c7, r4c5;

    black ir3c31(r3c31, r3c27, r4c31);
    black ir3c29(r2c29, r3c27, r4c29);
    black ir3c23(r3c23, r3c19, r4c23);
    black ir3c21(r2c21, r3c19, r4c21);
    black ir3c15(r3c15, r3c11, r4c15);
    black ir3c13(r2c13, r3c11, r4c13);
    gray ir3c7(r3c7, r3c3, r4c7);
    gray ir3c5(r2c5, r3c3, r4c5);

    /* Fourth row */
    wire [1:0] r5c31, r5c29, r5c27, r5c25;
    wire r5c15, r5c13, r5c11, r5c9;

    black ir4c31(r4c31, r4c23, r5c31);
    black ir4c29(r4c29, r4c23, r5c29);
    black ir4c27(r3c27, r4c23, r5c27);
    black ir4c25(r2c25, r4c23, r5c25);
    gray ir4c15(r4c15, r4c7, r5c15);
    gray ir4c13(r4c13, r4c7, r5c13);
    gray ir4c11(r3c11, r4c7, r5c11);
    gray ir4c9(r2c9, r4c7, r5c9);

    /* Fifth row */
    wire r6c31, r6c29, r6c27, r6c25, r6c23, r6c21, r6c19, r6c17;

    gray ir5c31(r5c31, r5c15, r6c31);
    gray ir5c29(r5c29, r5c15, r6c29);
    gray ir5c27(r5c27, r5c15, r6c27);
    gray ir5c25(r5c25, r5c15, r6c25);
    gray ir5c23(r4c23, r5c15, r6c23);
    gray ir5c21(r4c21, r5c15, r6c21);
    gray ir5c19(r3c19, r5c15, r6c19);
    gray ir5c17(r2c17, r5c15, r6c17);

    /* Sixth row */
    wire r7c30, r7c28, r7c26, r7c24, r7c22, r7c20, r7c18, r7c16; 
    wire r7c14, r7c12, r7c10, r7c8, r7c6, r7c4, r7c2;

    gray ir6c30(r1c30, r6c29, r7c30);
    gray ir6c28(r1c28, r6c27, r7c28);
    gray ir6c26(r1c26, r6c25, r7c26);
    gray ir6c24(r1c24, r6c23, r7c24);
    gray ir6c22(r1c22, r6c21, r7c22);
    gray ir6c20(r1c20, r6c19, r7c20);
    gray ir6c18(r1c18, r6c17, r7c18);
    gray ir6c16(r1c16, r5c15, r7c16);
    gray ir6c14(r1c14, r5c13, r7c14);
    gray ir6c12(r1c12, r5c11, r7c12);
    gray ir6c10(r1c10, r5c9, r7c10);
    gray ir6c8(r1c8, r4c7, r7c8);
    gray ir6c6(r1c6, r4c5, r7c6);
    gray ir6c4(r1c4, r3c3, r7c4);
    gray ir6c2(r1c2, r2c1, r7c2);

    /* Finaly produce the sum */
    xor32 ixor32({r6c31,r7c30,r6c29,r7c28,r6c27,r7c26,r6c25,r7c24,
        r6c23,r7c22,r6c21,r7c20,r6c19,r7c18,r6c17,r7c16,r5c15,r7c14,
	r5c13,r7c12,r5c11,r7c10,r5c9,r7c8,r4c7,r7c6,r4c5,r7c4,r3c3,
	r7c2,r2c1,Cin}, {r1c32[1], r1c31[1],r1c30[1],r1c29[1],
	r1c28[1],r1c27[1],r1c26[1],r1c25[1],r1c24[1],r1c23[1],r1c22[1],
	r1c21[1],r1c20[1],r1c19[1],r1c18[1],r1c17[1],r1c16[1],r1c15[1],
	r1c14[1],r1c13[1],r1c12[1],r1c11[1],r1c10[1],r1c9[1],r1c8[1],
	r1c7[1],r1c6[1],r1c5[1],r1c4[1],r1c3[1],r1c2[1],r1c1[1]}, S);

    /* Generate Cout */
    gray gcout(r1c32, r6c31, Cout);

endmodule

