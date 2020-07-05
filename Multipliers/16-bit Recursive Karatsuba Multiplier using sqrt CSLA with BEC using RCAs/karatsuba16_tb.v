module karatsuba16_tb;
reg [15:0] a,b;
wire [31:0] prod;

karatsuba16 karatsuba16(a,b,prod);

initial begin
#30 a=16'hABCD; b=16'hABCD;
#30 a=16'h3242; b=16'h2403;
#30 a=16'hFFFF; b=16'hFFFE;
end
endmodule
