module karatsuba8(x,y,prod);
input [7:0] x,y;
output [15:0] prod;
wire [7:0] product1,product2,p;
wire [4:0] sum_first,sum_second,sum_third;
wire [9:0] product3;
wire [15:0] T1,T2,T3;
wire [8:0] T4;
wire msbprod;
reg [3:0] a,b;
wire [15:0] p1; //Partial product 1
wire [16:0] p2; //Partial product 2
wire [16:0] s;  //Partial product sum

karatsuba4 k1(x[7:4],y[7:4],product1);
karatsuba4 k2(x[3:0],y[3:0],product2);

scb_rca4 s1(x[7:4],x[3:0],1'b0,sum_first[3:0],sum_first[4]);
scb_rca4 s2(y[7:4],y[3:0],1'b0,sum_second[3:0],sum_second[4]);

karatsuba4 k3(sum_first[3:0],sum_second[3:0],p);

always @(sum_first,sum_second)
begin
 if(sum_first[4]==1)
  begin
   a=sum_second[3:0];
  end
 else
  begin
   a=4'b0000;
  end
 if(sum_second[4]==1)
  begin
   b=sum_first[3:0];
  end
 else
  begin
   b=4'b0000;
  end
end

scb_rca4 s3(a,b,1'b0,sum_third[3:0],sum_third[4]);
assign msbprod=(sum_first[4])&(sum_second[4]);
assign product3={msbprod,8'h00}+{sum_third,4'h0}+p;

assign T1={product1,8'b00000000};
assign T4=product3-product1-product2;
assign T2={3'b000,T4,4'b0000};
assign T3={8'b00000000,product2};

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
scb_rca16 s4(p1,p2[15:0],1'b0,s[15:0],s[16]);

assign prod = s[15:0];

endmodule


