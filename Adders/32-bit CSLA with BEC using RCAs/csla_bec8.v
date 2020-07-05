module csla_bec8(a,b,cin,sum,cout);
input [7:0] a,b;
input cin;
output [7:0] sum;
output cout;
wire cout_rca4;

rca4_1 r1(a[3:0],b[3:0],cin,sum[3:0],cout_rca4);
group4 g1(a[7:4],b[7:4],cout_rca4,sum[7:4],cout);

endmodule

module tb_csla_bec8;
reg [7:0] a,b;
reg cin;
wire [7:0] sum;
wire cout;
parameter stop_time=200;

csla_bec8 c1(a,b,cin,sum,cout);

initial begin
a=8'h01;
b=8'h56;
cin=0;
#20 b=8'hFE;
#20 a=8'hAB;
#20 b=8'hFF;
#20 a=8'hFF;
#20 b=8'h78;
#20 cin=1;
end
endmodule


