module cla_16(x,y,cin,s,cout);
	
	input [15:0] x,y;
	input cin;
	output cout;
	output [15:0] s;
	wire c;

	cla_8 c1(x[7:0],y[7:0],cin,s[7:0],c);
	cla_8 c2(x[15:8],y[15:8],c,s[15:8],cout);

endmodule
