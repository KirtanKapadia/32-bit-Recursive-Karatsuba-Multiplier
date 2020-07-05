module karatsuba4(x,y,prod);
input [3:0] x,y;        //a3a2a1a0
output [7:0] prod;      //b3b2b1b0
wire [3:0] product1,product2,p;
wire [2:0] sum_first,sum_second,sum_third;
wire [5:0] product3;
wire [7:0] T1, T2, T3;
wire [4:0] T4;
wire msbprod;
reg [1:0] a,b;
wire [7:0] p1; //Partial product 1
wire [8:0] p2; //Partial product 2
wire [8:0] s;  //Partial product sum

vedic2 v1(x[3:2],y[3:2],product1);
vedic2 v2(x[1:0],y[1:0],product2);

rca_2 r1(x[3:2],x[1:0],1'b0,sum_first[1:0],sum_first[2]);
rca_2 r2(y[3:2],y[1:0],1'b0,sum_second[1:0],sum_second[2]);

vedic2 v3(sum_first[1:0],sum_second[1:0],p);

always @(sum_first,sum_second)
begin
 if(sum_first[2]==1)
  begin
   a=sum_second[1:0];
  end
 else
  begin
   a=2'b00;
  end
 if(sum_second[2]==1)
  begin
   b=sum_first[1:0];
  end
 else
  begin
   b=2'b00;
  end
end

rca_2 r3(a,b,1'b0,sum_third[1:0],sum_third[2]);
assign msbprod=(sum_first[2])&(sum_second[2]);
assign product3={msbprod,4'b0000}+{sum_third,2'b00}+p;

assign T1={product1,4'b0000};
assign T4=product3-product1-product2;
assign T2={1'b0,T4,2'b00};
assign T3={4'b0000,product2};

assign p2[0] = 1'b0;

fulladder f1(T1[0],T2[0],T3[0],p1[0],p2[1]);
fulladder f2(T1[1],T2[1],T3[1],p1[1],p2[2]);
fulladder f3(T1[2],T2[2],T3[2],p1[2],p2[3]);
fulladder f4(T1[3],T2[3],T3[3],p1[3],p2[4]);
fulladder f5(T1[4],T2[4],T3[4],p1[4],p2[5]);
fulladder f6(T1[5],T2[5],T3[5],p1[5],p2[6]);
fulladder f7(T1[6],T2[6],T3[6],p1[6],p2[7]);
fulladder f8(T1[7],T2[7],T3[7],p1[7],p2[8]);
csla_bec8 s1(p1,p2[7:0],1'b0,s[7:0],s[8]);

assign prod = s[7:0];

endmodule


