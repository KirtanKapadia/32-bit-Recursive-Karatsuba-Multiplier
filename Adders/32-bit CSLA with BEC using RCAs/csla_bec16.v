module csla_bec16(a,b,cin,sum,cout);
input [15:0] a,b;
input cin;
output [15:0] sum;
output cout;
wire cout_rca4,cout_bec_1,cout_bec_2;

rca4_1 r1(a[3:0],b[3:0],cin,sum[3:0],cout_rca4);
group4 g1(a[7:4],b[7:4],cout_rca4,sum[7:4],cout_bec_1);
group4 g2(a[11:8],b[11:8],cout_bec_1,sum[11:8],cout_bec_2);
group4 g3(a[15:12],b[15:12],cout_bec_2,sum[15:12],cout);

endmodule

module tb_csla_bec16;
reg [15:0] a,b;
reg cin;
wire [15:0] sum;
wire cout;
parameter stop_time=200;

csla_bec16 c1(a,b,cin,sum,cout);

initial begin
a=16'h0100;
b=16'h5687;
cin=0;
#20 b=16'hFFFE;
#20 a=16'hABCF;
#20 a=16'hFFFF;
#20 b=16'hFFFF;
#20 a=16'h7898;
#20 cin=1;
end
endmodule
