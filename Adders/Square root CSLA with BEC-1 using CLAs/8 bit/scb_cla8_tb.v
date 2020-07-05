module scb_cla8_tb;

	wire [7:0] s;
	wire cout;
	reg [7:0] x,y;
	reg cin;
	
	scb_cla8 scb_cla8(x,y,cin,s,cout);

  	initial
    	begin
      	#10 x = 8'h88; y = 8'h88; cin = 0;
      	#30 x = 8'hFA; y = 8'h4B; cin = 1;
	#30 x = 8'hFE; y = 8'hBB; cin = 1;
    	end
  
  	initial
    	$monitor(,$time,"x=%h,y=%h,cin=%h,s=%h,cout=%h",x,y,cin,s,cout);
  
endmodule

