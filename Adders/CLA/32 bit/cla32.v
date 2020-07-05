module cla_slice_part(g,p,a,b);

   input a, b;
   output g; // Generate
   output p; // Propagate

   assign g = a & b;

   assign p = a ^ b;

endmodule

module four_bit_block_cla(P,G,carry,p,g,cin);

	input [3:0] p,g;
	input cin;
	output [2:0] carry;
	output P,G;

assign carry[0] = g[0] |

              	  cin & p[0];

assign carry[1] = g[1] |

              	  g[0] & p[1] |

                  cin  &  p[0] & p[1];

assign carry[2] = g[2] |

              	  g[1] & p[2] |

             	  g[0] & p [1] & p[2] |

              	  cin  & p[0] & p[1] & p[2];

assign P  =  p[0] & p[1] & p[2] & p[3];

assign G = g[3] |

           g[2] & p[3] |

           g[1] & p[2] & p[3] |

           g[0] & p[1] & p[2] & p[3];

endmodule

module CarryPropagateGenerateUnit( g,p,a,b); 

    input  [31:0] a,b;
    output [31:0] g,p;

    cla_slice_part s0(g[0],p[0],a[0],b[0]);

    cla_slice_part s1(g[1],p[1],a[1],b[1]);

    cla_slice_part s2(g[2],p[2],a[2],b[2]);

    cla_slice_part s3(g[3],p[3],a[3],b[3]);

    cla_slice_part s4(g[4],p[4],a[4],b[4]);

    cla_slice_part s5(g[5],p[5],a[5],b[5]);

    cla_slice_part s6(g[6],p[6],a[6],b[6]);

    cla_slice_part s7(g[7],p[7],a[7],b[7]);

    cla_slice_part s8(g[8],p[8],a[8],b[8]);

    cla_slice_part s9(g[9],p[9],a[9],b[9]);

    cla_slice_part s10(g[10],p[10],a[10],b[10]);

    cla_slice_part s11(g[11],p[11],a[11],b[11]);

    cla_slice_part s12(g[12],p[12],a[12],b[12]);

    cla_slice_part s13(g[13],p[13],a[13],b[13]);

    cla_slice_part s14(g[14],p[14],a[14],b[14]);

    cla_slice_part s15(g[15],p[15],a[15],b[15]);

    cla_slice_part s16(g[16],p[16],a[16],b[16]);

    cla_slice_part s17(g[17],p[17],a[17],b[17]);

    cla_slice_part s18(g[18],p[18],a[18],b[18]);

    cla_slice_part s19(g[19],p[19],a[19],b[19]);

    cla_slice_part s20(g[20],p[20],a[20],b[20]);

    cla_slice_part s21(g[21],p[21],a[21],b[21]);

    cla_slice_part s22(g[22],p[22],a[22],b[22]);

    cla_slice_part s23(g[23],p[23],a[23],b[23]);

    cla_slice_part s24(g[24],p[24],a[24],b[24]);

    cla_slice_part s25(g[25],p[25],a[25],b[25]);

    cla_slice_part s26(g[26],p[26],a[26],b[26]);

    cla_slice_part s27(g[27],p[27],a[27],b[27]);

    cla_slice_part s28(g[28],p[28],a[28],b[28]);

    cla_slice_part s29(g[29],p[29],a[29],b[29]);

    cla_slice_part s30(g[30],p[30],a[30],b[30]);

    cla_slice_part s31(g[31],p[31],a[31],b[31]);

endmodule

module ThirtyTwoBitSummationUnit(sum,p,carry,cin);

  input [30:0] carry;

  input cin;

  input [31:0] p;

  output [31:0] sum;

  assign sum[0] = p[0] ^ cin;

  assign sum[1] = p[1] ^ carry[0];

  assign sum[2] = p[2] ^ carry[1];

  assign sum[3] = p[3] ^ carry[2];

  assign sum[4] = p[4] ^ carry[3];

  assign sum[5] = p[5] ^ carry[4];

  assign sum[6] = p[6] ^ carry[5];

  assign sum[7] = p[7] ^ carry[6];

  assign sum[8] = p[8] ^ carry[7];

  assign sum[9] = p[9] ^ carry[8];

  assign sum[10] = p[10] ^ carry[9];

  assign sum[11] = p[11] ^ carry[10];

  assign sum[12] = p[12] ^ carry[11];

  assign sum[13] = p[13] ^ carry[12];

  assign sum[14] = p[14] ^ carry[13];

  assign sum[15] = p[15] ^ carry[14];

  assign sum[16] = p[16] ^ carry[15];

  assign sum[17] = p[17] ^ carry[16];

  assign sum[18] = p[18] ^ carry[17];

  assign sum[19] = p[19] ^ carry[18];

  assign sum[20] = p[20] ^ carry[19];

  assign sum[21] = p[21] ^ carry[20];

  assign sum[22] = p[22] ^ carry[21];

  assign sum[23] = p[23] ^ carry[22];

  assign sum[24] = p[24] ^ carry[23];

  assign sum[25] = p[25] ^ carry[24];

  assign sum[26] = p[26] ^ carry[25];

  assign sum[27] = p[27] ^ carry[26];

  assign sum[28] = p[28] ^ carry[27];

  assign sum[29] = p[29] ^ carry[28];

  assign sum[30] = p[30] ^ carry[29];

  assign sum[31] = p[31] ^ carry[30];

endmodule

module cla32 (a,b,cin,sum,cout);

	input [31:0] a, b;
	input cin;
	output [31:0] sum;
	output  cout;
	wire [31:0]   g, p,carry; 
	wire [7:0]  G,P;

    assign carry[3]  = G[0] | cin & P[0];

    assign carry[7]  = G[1] | G[0] & P[1] | cin & P[0] & P[1]; 

    assign carry[11] = G[2] |

                       G[1] & P[2] |

                       G[0] & P[1] & P[2] |

                       cin  & P[0] & P[1] & P[2];

    assign carry[15] = G[3] |

                       G[2] & P[3] |

                       G[1] & P[2] & P[3] |

                       G[0] & P[1] & P[2] & P[3] |

                       cin   & P[0] & P[1] & P[2] & P[3];

    assign carry[19] = G[4] |

                       G[3] & P[4] |

                       G[2] & P[3] & P[4] |

                       G[1] & P[2] & P[3] & P[4] |

                       G[0] & P[1] & P[2] & P[3] & P[4] |

                       cin   & P[0] & P[1] & P[2] & P[3] & P[4];

    assign carry[23] = G[5] |

                       G[4] & P[5] |

                       G[3] & P[4] & P[5] |

                       G[2] & P[3] & P[4] & P[5] |

                       G[1] & P[2] & P[3] & P[4] & P[5] |

                       G[0] & P[1] & P[2] & P[3] & P[4] & P[5] |

                       cin   & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] ;

    assign carry[27] = G[6] |

                       G[5] & P[6] |

                       G[4] & P[5] & P[6] |

                       G[3] & P[4] & P[5] & P[6] |

                       G[2] & P[3] & P[4] & P[5] & P[6] |

                       G[1] & P[2] & P[3] & P[4] & P[5] & P[6] |

                       G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] |

                       cin  & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6];

    // This is  carry[31];

    assign cout  =     G[7]  |

                       G[6] & P[7] |

                       G[5] & P[6] & P[7] |

                       G[4] & P[5] & P[6] & P[7] |

                       G[3] & P[4] & P[5] & P[6] & P[7] |

                       G[2] & P[3] & P[4] & P[5] & P[6] & P[7] |

                       G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] |

                       G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] |

                       cin  & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7];

    CarryPropagateGenerateUnit CPGU( g,p,a,b);

    four_bit_block_cla FBBC0(P[0],G[0],carry[2:0],p[3:0],g[3:0],cin);     

    four_bit_block_cla FBBC1(P[1],G[1],carry[6:4],p[7:4],g[7:4],carry[3]);   

    four_bit_block_cla FBBC2(P[2],G[2],carry[10:8],p[11:8],g[11:8],carry[7]);

    four_bit_block_cla FBBC3(P[3],G[3],carry[14:12],p[15:12],g[15:12],carry[11]); 

    four_bit_block_cla FBBC4(P[4],G[4],carry[18:16],p[19:16],g[19:16],carry[15]); 

    four_bit_block_cla FBBC5(P[5],G[5],carry[22:20],p[23:20],g[23:20],carry[19]);

    four_bit_block_cla FBBC6(P[6],G[6],carry[26:24],p[27:24],g[27:24],carry[23]);

    four_bit_block_cla FBBC7(P[7],G[7],carry[30:28],p[31:28],g[31:28],carry[27]);

    ThirtyTwoBitSummationUnit TTBSU(sum,p,carry[30:0],cin);

endmodule
