module csla_bec8(a,b,cin,sum,cout);
input [7:0] a,b;
input cin;
output [7:0] sum;
output cout;
wire cout_rca4;

rca_4 r1(a[3:0],b[3:0],cin,sum[3:0],cout_rca4);
group4 g1(a[7:4],b[7:4],cout_rca4,sum[7:4],cout);

endmodule



