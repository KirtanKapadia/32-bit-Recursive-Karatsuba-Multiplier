module cla32_tb;

	wire [31:0] s;
	wire cout;
	reg [31:0] x,y;
	reg cin;
	
	cla32 cla32(x,y,cin,s,cout);

  	initial
    	begin
      	#10 x = 32'h42884743; y = 32'h42884743; cin = 0;
      	#30 x = 32'hF28A47B3; y = 32'h4B8B47A3; cin = 1;
	#30 x = 32'hF28E47BC; y = 32'h9B8B47AB; cin = 1;
    	end
  
  	initial
    	$monitor(,$time,"x=%h,y=%h,cin=%h,s=%h,cout=%h",x,y,cin,s,cout);
  
endmodule
