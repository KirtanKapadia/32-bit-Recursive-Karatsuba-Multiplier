module cla_8_tb;

	reg [7:0] a,b;
	reg cin;
	wire [7:0] s;
	wire cout;
	
	cla_8 cla_8(a,b,cin,s,cout);
	
	initial begin
	#30 a = 8'hFE; b = 8'hCD; cin = 8'h1;
	#30 a = 8'hEE; b = 8'hFF; cin = 8'h1;
	end

endmodule
