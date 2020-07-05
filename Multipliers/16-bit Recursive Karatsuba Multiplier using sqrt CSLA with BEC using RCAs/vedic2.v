module vedic2(a,b,sum);
input [1:0] a,b;
output [3:0] sum;
wire prod1,prod2,prod3,cout1;

and a1(sum[0],a[0],b[0]);
and a2(prod1,a[1],b[0]);
and a3(prod2,a[0],b[1]);
halfadder h1(prod1,prod2,sum[1],cout1);
and a4(prod3,a[1],b[1]);
halfadder h2(prod3,cout1,sum[2],sum[3]);

endmodule
