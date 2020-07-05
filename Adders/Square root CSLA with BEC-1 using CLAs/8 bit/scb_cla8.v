module scb_cla8(x,y,cin,s,cout);

	output [7:0] s;
	input [7:0] x,y;
	output cout;
	input cin;

	wire [1:0] sel;
	
	wire [2:0] sum0;
	wire [3:0] temp0,temp0_1;
	wire [2:0] sum1;
	wire [3:0] temp1,temp1_1;
	
	wire carry0, carry1;

	//sum[0:1] (2)
	cla_2 r2(x[1:0],y[1:0],cin,s[1:0],sel[0]);

	//sum[2:4] (3)
	cla_3 r3(x[4:2],y[4:2],1'b0,sum0,carry0);
	assign temp0 = {carry0,sum0[2:0]};
	bec_4 b4(temp0,temp0_1);

	mux_2x1 m1(s[2],temp0[0],temp0_1[0],sel[0]);
	mux_2x1 m2(s[3],temp0[1],temp0_1[1],sel[0]);
	mux_2x1 m3(s[4],temp0[2],temp0_1[2],sel[0]);
	mux_2x1 m4(sel[1],temp0[3],temp0_1[3],sel[0]);
	
	//sum[5:7] (3)
	cla_3 r4(x[7:5],y[7:5],1'b0,sum1,carry1);
	assign temp1 = {carry1,sum1[2:0]};
	bec_4 b4_1(temp1,temp1_1);

	mux_2x1 m5(s[5],temp1[0],temp1_1[0],sel[1]);
	mux_2x1 m6(s[6],temp1[1],temp1_1[1],sel[1]);
	mux_2x1 m7(s[7],temp1[2],temp1_1[2],sel[1]);
	mux_2x1 m8(cout,temp1[3],temp1_1[3],sel[1]);

endmodule

