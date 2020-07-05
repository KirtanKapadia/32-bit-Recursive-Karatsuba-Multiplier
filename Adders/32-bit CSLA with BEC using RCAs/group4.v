module group4(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire [3:0] sum_rca,sum_bec;
wire cout_rca,cout_bec;


rca4_1 r1(a,b,0,sum_rca,cout_rca);
bec4 b1(sum_rca,cout_rca,sum_bec,cout_bec);

mux_21 m1(sum_rca[0],sum_bec[0],cin,sum[0]);
mux_21 m2(sum_rca[1],sum_bec[1],cin,sum[1]);
mux_21 m3(sum_rca[2],sum_bec[2],cin,sum[2]);
mux_21 m4(sum_rca[3],sum_bec[3],cin,sum[3]);
mux_21 m5(cout_rca,cout_bec,cin,cout);

endmodule

module tb_group4;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

group4 g1(a,b,cin,sum,cout);

initial begin
a=4'b0110;
b=4'b0001;
cin=0;
#20 a=4'b1001;
#20 cin=1;
#20 b=4'hF;
#20 a=4'hF;
#20 cin=0;
end
endmodule

