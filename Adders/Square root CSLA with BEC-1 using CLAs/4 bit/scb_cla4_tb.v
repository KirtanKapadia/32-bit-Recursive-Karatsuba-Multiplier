module scb_cla4_tb;

	wire [3:0] s;
	wire cout;
	reg [3:0] x,y;
	reg cin;
	
	scb_cla4 scb_cla4(x,y,cin,s,cout);

  	initial
    	begin
      	#10 x = 4'h8; y = 4'h8; cin = 0;
      	#30 x = 4'hA; y = 4'hB; cin = 1;
	#30 x = 4'hF; y = 4'hF; cin = 1;
    	end
  
  	initial
    	$monitor(,$time,"x=%h,y=%h,cin=%h,s=%h,cout=%h",x,y,cin,s,cout);
  
endmodule

