module csla_bec32(a,b,cin,sum,cout);
input [31:0] a,b;
input cin;
output [31:0] sum;
output cout;
wire cout_bec_1,cout_bec_2,cout_bec_3,cout_bec_4;

csla_bec16 c1(a[15:0],b[15:0],cin,sum[15:0],cout_bec_1);
group4 g1(a[19:16],b[19:16],cout_bec_1,sum[19:16],cout_bec_2);
group4 g2(a[23:20],b[23:20],cout_bec_2,sum[23:20],cout_bec_3);
group4 g3(a[27:24],b[27:24],cout_bec_3,sum[27:24],cout_bec_4);
group4 g4(a[31:28],b[31:28],cout_bec_4,sum[31:28],cout);

endmodule



