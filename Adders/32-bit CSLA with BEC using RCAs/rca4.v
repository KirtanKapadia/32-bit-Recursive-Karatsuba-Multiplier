module rca4_1(a,b,cin,sum,cout);
input cin;
input [3:0] a,b;
output [3:0] sum;
output cout;
wire [2:0] c;

fulladder fa1(a[0],b[0],cin,sum[0],c[0]);
fulladder fa2(a[1],b[1],c[0],sum[1],c[1]);
fulladder fa3(a[2],b[2],c[1],sum[2],c[2]);
fulladder fa4(a[3],b[3],c[2],sum[3],cout);

endmodule
