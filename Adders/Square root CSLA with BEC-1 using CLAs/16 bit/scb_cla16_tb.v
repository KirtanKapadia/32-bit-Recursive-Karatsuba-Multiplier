module scb_cla16_tb;

	wire [15:0] s;
	wire cout;
	reg [15:0] x,y;
	reg cin;
	
	scb_cla16 scb_cla16(x,y,cin,s,cout);

  	initial
    	begin
      	#10 x = 16'h4288; y = 16'h4288; cin = 0;
      	#30 x = 16'hF28A; y = 16'h4B8B; cin = 1;
	#30 x = 16'hF28E; y = 16'h9B8B; cin = 1;
    	end
  
  	initial
    	$monitor(,$time,"x=%h,y=%h,cin=%h,s=%h,cout=%h",x,y,cin,s,cout);
  
endmodule

