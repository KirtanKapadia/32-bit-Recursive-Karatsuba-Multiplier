module cla_16_tb;

	reg [15:0] a,b;
	reg cin;
	wire [15:0] s;
	wire cout;
	
	cla_16 cla_16(a,b,cin,s,cout);
	
	initial begin
	#30 a = 16'hFEFE; b = 16'hCDCD; cin = 8'h1;
	#30 a = 16'hEEFF; b = 16'hDDFF; cin = 8'h1;
	end

endmodule
