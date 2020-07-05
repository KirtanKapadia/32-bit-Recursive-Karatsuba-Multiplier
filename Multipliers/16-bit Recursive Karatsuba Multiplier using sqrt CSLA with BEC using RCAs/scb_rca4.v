module scb_rca4(x,y,cin,s,cout);

	output [3:0] s;
	input [3:0] x,y;
	output cout;
	input cin;

	wire sel;
	
	wire [1:0] sum0;
	wire [2:0] temp0,temp0_1;
	
	wire carry0, carry1;

	//sum[0:1] (2)
	rca_2 r2(x[1:0],y[1:0],cin,s[1:0],sel);

	//sum[2:3] (2)
	rca_2 r3(x[3:2],y[3:2],1'b0,sum0,carry0);
	assign temp0 = {carry0,sum0[1:0]};
	bec_3 b3(temp0,temp0_1);

	mux_2x1 m1(s[2],temp0[0],temp0_1[0],sel);
	mux_2x1 m2(s[3],temp0[1],temp0_1[1],sel);
	mux_2x1 m3(cout,temp0[2],temp0_1[2],sel);

endmodule

