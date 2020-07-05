module karatsuba16(x,y,prod);

input [15:0] x,y;
output [31:0] prod;
wire [15:0] product1,product2,p;
wire [8:0] sum_first,sum_second,sum_third;
wire [17:0] product3;
wire [31:0] T1,T2,T3;
wire [16:0] T4;
wire msbprod;
reg [7:0] a,b;
wire [31:0] p1; //Partial product 1
wire [32:0] p2; //Partial product 2
wire [32:0] s;  //Partial product sum

karatsuba8 k1(x[15:8],y[15:8],product1);
karatsuba8 k2(x[7:0],y[7:0],product2);

scb_cla8 s1(x[15:8],x[7:0],1'b0,sum_first[7:0],sum_first[8]);
scb_cla8 s2(y[15:8],y[7:0],1'b0,sum_second[7:0],sum_second[8]);

karatsuba8 k3(sum_first[7:0],sum_second[7:0],p);

always @(sum_first,sum_second)
begin
 if(sum_first[8]==1)
  begin
   a=sum_second[7:0];
  end
 else
  begin
   a=8'b00000000;
  end
 if(sum_second[8]==1)
  begin
   b=sum_first[7:0];
  end
 else
  begin
   b=8'b00000000;
  end
end

scb_cla8 s3(a,b,1'b0,sum_third[7:0],sum_third[8]);
assign msbprod = (sum_first[8])&(sum_second[8]);
assign product3 = {msbprod,16'b0000000000000000}+{sum_third,8'b00000000}+p;

assign T1 = {product1,16'h0000};
assign T4 = product3 - product1 - product2;
assign T2 = {7'b0000000,T4,8'h00};
assign T3 = {16'h0000,product2};

assign p2[0] = 1'b0;

fulladder f1(T1[0],T2[0],T3[0],p1[0],p2[1]);
fulladder f2(T1[1],T2[1],T3[1],p1[1],p2[2]);
fulladder f3(T1[2],T2[2],T3[2],p1[2],p2[3]);
fulladder f4(T1[3],T2[3],T3[3],p1[3],p2[4]);
fulladder f5(T1[4],T2[4],T3[4],p1[4],p2[5]);
fulladder f6(T1[5],T2[5],T3[5],p1[5],p2[6]);
fulladder f7(T1[6],T2[6],T3[6],p1[6],p2[7]);
fulladder f8(T1[7],T2[7],T3[7],p1[7],p2[8]);
fulladder f9(T1[8],T2[8],T3[8],p1[8],p2[9]);
fulladder f10(T1[9],T2[9],T3[9],p1[9],p2[10]);
fulladder f11(T1[10],T2[10],T3[10],p1[10],p2[11]);
fulladder f12(T1[11],T2[11],T3[11],p1[11],p2[12]);
fulladder f13(T1[12],T2[12],T3[12],p1[12],p2[13]);
fulladder f14(T1[13],T2[13],T3[13],p1[13],p2[14]);
fulladder f15(T1[14],T2[14],T3[14],p1[14],p2[15]);
fulladder f16(T1[15],T2[15],T3[15],p1[15],p2[16]);
fulladder f17(T1[16],T2[16],T3[16],p1[16],p2[17]);
fulladder f18(T1[17],T2[17],T3[17],p1[17],p2[18]);
fulladder f19(T1[18],T2[18],T3[18],p1[18],p2[19]);
fulladder f20(T1[19],T2[19],T3[19],p1[19],p2[20]);
fulladder f21(T1[20],T2[20],T3[20],p1[20],p2[21]);
fulladder f22(T1[21],T2[21],T3[21],p1[21],p2[22]);
fulladder f23(T1[22],T2[22],T3[22],p1[22],p2[23]);
fulladder f24(T1[23],T2[23],T3[23],p1[23],p2[24]);
fulladder f25(T1[24],T2[24],T3[24],p1[24],p2[25]);
fulladder f26(T1[25],T2[25],T3[25],p1[25],p2[26]);
fulladder f27(T1[26],T2[26],T3[26],p1[26],p2[27]);
fulladder f28(T1[27],T2[27],T3[27],p1[27],p2[28]);
fulladder f29(T1[28],T2[28],T3[28],p1[28],p2[29]);
fulladder f30(T1[29],T2[29],T3[29],p1[29],p2[30]);
fulladder f31(T1[30],T2[30],T3[30],p1[30],p2[31]);
fulladder f32(T1[31],T2[31],T3[31],p1[31],p2[32]);
scb_cla32 s4(p1,p2[31:0],1'b0,s[31:0],s[32]);

assign prod = s[31:0];


endmodule


