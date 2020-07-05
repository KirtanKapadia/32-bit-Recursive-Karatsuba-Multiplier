module rca_2(x,y,cin,s,cout);
	
	input [1:0] x,y;
	input cin;
	output cout;
	output [1:0] s;
	wire [2:0] temp;

	assign temp = x + y + cin;
	assign s = temp[1:0];
	assign cout = temp[2];

endmodule

module rca_3(x,y,cin,s,cout);

	input [2:0] x,y;
	input cin;
	output cout;
	output [2:0] s;
	wire [3:0] temp;

	assign temp = x + y + cin;
	assign s = temp[2:0];
	assign cout = temp[3];

endmodule

module rca_4(x,y,cin,s,cout);

	input [3:0] x,y;
	input cin;
	output cout;
	output [3:0] s;
	wire [4:0] temp;

	assign temp = x + y + cin;
	assign s = temp[3:0];
	assign cout = temp[4];

endmodule

module rca_5(x,y,cin,s,cout);

	input [4:0] x,y;
	input cin;
	output cout;
	output [4:0] s;
	wire [5:0] temp;

	assign temp = x + y + cin;
	assign s = temp[4:0];
	assign cout = temp[5];

endmodule

module rca_6(x,y,cin,s,cout);

	input [5:0] x,y;
	input cin;
	output cout;
	output [5:0] s;
	wire [6:0] temp;

	assign temp = x + y + cin;
	assign s = temp[5:0];
	assign cout = temp[6];

endmodule

module rca_7(x,y,cin,s,cout);

	input [6:0] x,y;
	input cin;
	output cout;
	output [6:0] s;
	wire [7:0] temp;

	assign temp = x + y + cin;
	assign s = temp[6:0];
	assign cout = temp[7];

endmodule
