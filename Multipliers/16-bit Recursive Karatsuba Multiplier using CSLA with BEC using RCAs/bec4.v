module bec4(a,cin,sum,cout);
input [3:0] a;
input cin;
output [3:0] sum;
output cout;

assign sum[0]=~a[0];
assign sum[1]=(a[0])^(a[1]);
assign sum[2]=(a[2]^((a[0])&(a[1])));
assign sum[3]=(a[3]^((a[0])&(a[1])&(a[2])));
assign cout=(cin^((a[0])&(a[1])&(a[2])&(a[3]))) ;

endmodule


