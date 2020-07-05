module scb_cla16(x,y,cin,s,cout);

	output [15:0] s;
	input [15:0] x,y;
	output cout;
	input cin;

	wire [3:0] sel;
	
	wire [1:0] sum0;
	wire [2:0] temp0,temp0_1;
	wire [2:0] sum1;
	wire [3:0] temp1,temp1_1;
	wire [3:0] sum2;
	wire [4:0] temp2,temp2_1;
	wire [4:0] sum3;
	wire [5:0] temp3,temp3_1;
	
	wire carry0, carry1, carry2, carry3;

	//sum[0:1] (2)
	cla_2 r2(x[1:0],y[1:0],cin,s[1:0],sel[0]);

	//sum[2:3] (2)
	cla_2 r3(x[3:2],y[3:2],1'b0,sum0,carry0);
	assign temp0 = {carry0,sum0[1:0]};
	bec_3 b3(temp0,temp0_1);

	mux_2x1 m1(s[2],temp0[0],temp0_1[0],sel[0]);
	mux_2x1 m2(s[3],temp0[1],temp0_1[1],sel[0]);
	mux_2x1 m3(sel[1],temp0[2],temp0_1[2],sel[0]);
	
	//sum[4:6] (3)
	cla_3 r4(x[6:4],y[6:4],1'b0,sum1,carry1);
	assign temp1 = {carry1,sum1[2:0]};
	bec_4 b4(temp1,temp1_1);

	mux_2x1 m4(s[4],temp1[0],temp1_1[0],sel[1]);
	mux_2x1 m5(s[5],temp1[1],temp1_1[1],sel[1]);
	mux_2x1 m6(s[6],temp1[2],temp1_1[2],sel[1]);
	mux_2x1 m7(sel[2],temp1[3],temp1_1[3],sel[1]);

	//sum[7:10] (4)
	cla_4 r5(x[10:7],y[10:7],1'b0,sum2,carry2);
	assign temp2 = {carry2,sum2[3:0]};
	bec_5 b5(temp2,temp2_1);

	mux_2x1 m8(s[7],temp2[0],temp2_1[0],sel[2]);
	mux_2x1 m9(s[8],temp2[1],temp2_1[1],sel[2]);
	mux_2x1 m10(s[9],temp2[2],temp2_1[2],sel[2]);
	mux_2x1 m11(s[10],temp2[3],temp2_1[3],sel[2]);
	mux_2x1 m12(sel[3],temp2[4],temp2_1[4],sel[2]);
	
	//sum[11:15] (5)
	cla_5 r5_1(x[15:11],y[15:11],1'b0,sum3,carry3);
	assign temp3 = {carry3,sum3[4:0]};
	bec_6 b6_1(temp3,temp3_1);

	mux_2x1 m13(s[11],temp3[0],temp3_1[0],sel[3]);
	mux_2x1 m14(s[12],temp3[1],temp3_1[1],sel[3]);
	mux_2x1 m15(s[13],temp3[2],temp3_1[2],sel[3]);
	mux_2x1 m16(s[14],temp3[3],temp3_1[3],sel[3]);
	mux_2x1 m17(s[15],temp3[4],temp3_1[4],sel[3]);
	mux_2x1 m18(cout,temp3[5],temp3_1[5],sel[3]);

endmodule

