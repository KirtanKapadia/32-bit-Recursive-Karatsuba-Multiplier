module sqrt_csla(x,y,cin,s,cout);

	output [31:0] s;
	input [31:0] x,y;
	output cout;
	input cin;
	wire [5:0] sel;
	
	wire [2:0] sum0;
	wire [3:0] temp0,temp0_1;
	wire [3:0] sum1;
	wire [4:0] temp1,temp1_1;
	wire [4:0] sum2;
	wire [5:0] temp2,temp2_1;
	wire [4:0] sum3;
	wire [5:0] temp3,temp3_1;
	wire [5:0] sum4;
	wire [6:0] temp4,temp4_1;
	wire [6:0] sum5;
	wire [7:0] temp5,temp5_1;
	
	wire carry0, carry1, carry2, carry3, carry4, carry5;

	//sum[0:1] (2)
	rca_2 r2(x[1:0],y[1:0],cin,s[1:0],sel[0]);

	//sum[2:4] (3)
	rca_3 r3(x[4:2],y[4:2],1'b0,sum0,carry0);
	assign temp0 = {carry0,sum0[2:0]};
	bec_4 b4(temp0,temp0_1);

	mux_2x1 m1(s[2],temp0[0],temp0_1[0],sel[0]);
	mux_2x1 m2(s[3],temp0[1],temp0_1[1],sel[0]);
	mux_2x1 m3(s[4],temp0[2],temp0_1[2],sel[0]);
	mux_2x1 m4(sel[1],temp0[3],temp0_1[3],sel[0]);
	
	//sum[5:8] (4)
	rca_4 r4(x[8:5],y[8:5],1'b0,sum1,carry1);
	assign temp1 = {carry1,sum1[3:0]};
	bec_5 b5(temp1,temp1_1);

	mux_2x1 m5(s[5],temp1[0],temp1_1[0],sel[1]);
	mux_2x1 m6(s[6],temp1[1],temp1_1[1],sel[1]);
	mux_2x1 m7(s[7],temp1[2],temp1_1[2],sel[1]);
	mux_2x1 m8(s[8],temp1[3],temp1_1[3],sel[1]);
	mux_2x1 m9(sel[2],temp1[4],temp1_1[4],sel[1]);

	//sum[9:13] (5)
	rca_5 r5(x[13:9],y[13:9],1'b0,sum2,carry2);
	assign temp2 = {carry2,sum2[4:0]};
	bec_6 b6(temp2,temp2_1);

	mux_2x1 m10(s[9],temp2[0],temp2_1[0],sel[2]);
	mux_2x1 m11(s[10],temp2[1],temp2_1[1],sel[2]);
	mux_2x1 m12(s[11],temp2[2],temp2_1[2],sel[2]);
	mux_2x1 m13(s[12],temp2[3],temp2_1[3],sel[2]);
	mux_2x1 m14(s[13],temp2[4],temp2_1[4],sel[2]);
	mux_2x1 m15(sel[3],temp2[5],temp2_1[5],sel[2]);
	
	//sum[14:18] (5)
	rca_5 r5_1(x[18:14],y[18:14],1'b0,sum3,carry3);
	assign temp3 = {carry3,sum3[4:0]};
	bec_6 b6_1(temp3,temp3_1);

	mux_2x1 m16(s[14],temp3[0],temp3_1[0],sel[3]);
	mux_2x1 m17(s[15],temp3[1],temp3_1[1],sel[3]);
	mux_2x1 m18(s[16],temp3[2],temp3_1[2],sel[3]);
	mux_2x1 m19(s[17],temp3[3],temp3_1[3],sel[3]);
	mux_2x1 m20(s[18],temp3[4],temp3_1[4],sel[3]);
	mux_2x1 m21(sel[4],temp3[5],temp3_1[5],sel[3]);
	
	//sum[19:24] (6)
	rca_6 r6(x[24:19],y[24:19],1'b0,sum4,carry4);
	assign temp4 = {carry4,sum4[5:0]};
	bec_7 b7(temp4,temp4_1);

	mux_2x1 m22(s[19],temp4[0],temp4_1[0],sel[4]);
	mux_2x1 m23(s[20],temp4[1],temp4_1[1],sel[4]);
	mux_2x1 m24(s[21],temp4[2],temp4_1[2],sel[4]);
	mux_2x1 m25(s[22],temp4[3],temp4_1[3],sel[4]);
	mux_2x1 m26(s[23],temp4[4],temp4_1[4],sel[4]);
	mux_2x1 m27(s[24],temp4[5],temp4_1[5],sel[4]);
	mux_2x1 m28(sel[5],temp4[6],temp4_1[6],sel[4]);
	
	//sum[25:31] (7)
	rca_7 r7(x[31:25],y[31:25],1'b0,sum5,carry5);
	assign temp5 = {carry5,sum5[6:0]};
	bec_8 b8(temp5,temp5_1);

	mux_2x1 m29(s[25],temp5[0],temp5_1[0],sel[5]);
	mux_2x1 m30(s[26],temp5[1],temp5_1[1],sel[5]);
	mux_2x1 m31(s[27],temp5[2],temp5_1[2],sel[5]);
	mux_2x1 m32(s[28],temp5[3],temp5_1[3],sel[5]);
	mux_2x1 m33(s[29],temp5[4],temp5_1[4],sel[5]);
	mux_2x1 m34(s[30],temp5[5],temp5_1[5],sel[5]);
	mux_2x1 m35(s[31],temp5[6],temp5_1[6],sel[5]);
	mux_2x1 m36(cout,temp5[7],temp5_1[7],sel[5]);

endmodule
