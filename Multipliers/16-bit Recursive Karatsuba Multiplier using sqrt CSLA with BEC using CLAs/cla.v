module cla_2(x,y,cin,s,cout);
	
	input [1:0] x,y;
	input cin;
	output cout;
	output [1:0] s;
	wire [1:0] p,g,c;

	assign p = x^y; //propagate
	assign g = x&y; //generate

	assign c[0] = cin;
	assign c[1] = g[0]|(p[0]&c[0]);
	assign cout = g[1]|(p[1]&g[0])|(p[1]&p[0]&c[0]);
	assign s = p^c;

endmodule

module cla_3(x,y,cin,s,cout);
	
	input [2:0] x,y;
	input cin;
	output cout;
	output [2:0] s;
	wire [2:0] p,g,c;

	assign p = x^y; //propagate
	assign g = x&y; //generate

	assign c[0] = cin;
	assign c[1] = g[0]|(p[0]&c[0]);
	assign c[2] = g[1]|(p[1]&g[0])|(p[1]&p[0]&c[0]);
	assign cout = g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c[0]);
	assign s = p^c;

endmodule

module cla_4(x,y,cin,s,cout);
	
	input [3:0] x,y;
	input cin;
	output cout;
	output [3:0] s;
	wire [3:0] p,g,c;

	assign p = x^y; //propagate
	assign g = x&y; //generate

	assign c[0] = cin;
	assign c[1] = g[0]|(p[0]&c[0]);
	assign c[2] = g[1]|(p[1]&g[0])|(p[1]&p[0]&c[0]);
	assign c[3] = g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c[0]);
	assign cout = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c[0]);
	assign s = p^c;

endmodule

module cla_5(x,y,cin,s,cout);
	
	input [4:0] x,y;
	input cin;
	output cout;
	output [4:0] s;
	wire [4:0] p,g,c;

	assign p = x^y; //propagate
	assign g = x&y; //generate

	assign c[0] = cin;
	assign c[1] = g[0]|(p[0]&c[0]);
	assign c[2] = g[1]|(p[1]&g[0])|(p[1]&p[0]&c[0]);
	assign c[3] = g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c[0]);
	assign c[4] = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c[0]);
	assign cout = g[4]|(p[4]&g[3])|(p[4]&p[3]&g[2])|(p[4]&p[3]&p[2]&g[1])|(p[4]&p[3]&p[2]&p[1]&g[0])|(p[4]&p[3]&p[2]&p[1]&p[0]&c[0]);
	assign s = p^c;

endmodule

module cla_6(x,y,cin,s,cout);
	
	input [5:0] x,y;
	input cin;
	output cout;
	output [5:0] s;
	wire [5:0] p,g,c;

	assign p = x^y; //propagate
	assign g = x&y; //generate

	assign c[0] = cin;
	assign c[1] = g[0]|(p[0]&c[0]);
	assign c[2] = g[1]|(p[1]&g[0])|(p[1]&p[0]&c[0]);
	assign c[3] = g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c[0]);
	assign c[4] = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c[0]);
	assign c[5] = g[4]|(p[4]&g[3])|(p[4]&p[3]&g[2])|(p[4]&p[3]&p[2]&g[1])|(p[4]&p[3]&p[2]&p[1]&g[0])|(p[4]&p[3]&p[2]&p[1]&p[0]&c[0]);
	assign cout = g[5]|(p[5]&g[4])|(p[5]&p[4]&g[3])|(p[5]&p[4]&p[3]&g[2])|(p[5]&p[4]&p[3]&p[2]&g[1])|(p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&c[0]);
	
	assign s = p^c;

endmodule

module cla_7(x,y,cin,s,cout);
	
	input [6:0] x,y;
	input cin;
	output cout;
	output [6:0] s;
	wire [6:0] p,g,c;

	assign p = x^y; //propagate
	assign g = x&y; //generate

	assign c[0] = cin;
	assign c[1] = g[0]|(p[0]&c[0]);
	assign c[2] = g[1]|(p[1]&g[0])|(p[1]&p[0]&c[0]);
	assign c[3] = g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c[0]);
	assign c[4] = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c[0]);
	assign c[5] = g[4]|(p[4]&g[3])|(p[4]&p[3]&g[2])|(p[4]&p[3]&p[2]&g[1])|(p[4]&p[3]&p[2]&p[1]&g[0])|(p[4]&p[3]&p[2]&p[1]&p[0]&c[0]);
	assign c[6] = g[5]|(p[5]&g[4])|(p[5]&p[4]&g[3])|(p[5]&p[4]&p[3]&g[2])|(p[5]&p[4]&p[3]&p[2]&g[1])|(p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&c[0]);
	assign cout = g[6]|(p[6]&g[5])|(p[6]&p[5]&g[4])|(p[6]&p[5]&p[4]&g[3])|(p[6]&p[5]&p[4]&p[3]&g[2])|(p[6]&p[5]&p[4]&p[3]&p[2]&g[1])|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&c[0]);
	
	assign s = p^c;

endmodule
