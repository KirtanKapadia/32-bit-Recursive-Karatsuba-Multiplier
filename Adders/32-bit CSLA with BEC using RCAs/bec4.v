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


module tb_bec4;
reg [3:0] a;
reg cin;
wire [3:0] sum;
wire cout;
parameter stop_time = 200;

bec4 b1(a,cin,sum,cout);

initial begin
a=4'hF;
#20 a=4'hE;
#20 a=4'hD;
#20 a=4'h3;
#20 a=4'h7;
end
endmodule
 


