module mux_2x1 (out,x,y,sel);

	output out;
	input x, y, sel;
	
	assign out = (sel) ? y : x; 
	
endmodule
