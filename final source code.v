`timescale 1ns / 1ps


module div(dividend,divisor,quotient,rc1,rc2,rc0,remainder,dvs_cb2,dvd_c2,dvd_c1,dvd_c0,b,c,dvs_cb1,dvs_cb0,dvd_c6,dvd_c5,dvd_c4,dvd_c3,dvd_c7,qc0,qc1,qc2,qc3,qc4,dvs_c2,dvs_c1,dvs_c0);
input [7:0]dividend;
input [3:0]divisor;
output [4:0] quotient;
output [2:0] remainder;
wire [15:0]divdc; 
wire [15:0]divc;
inout [4:0]b;
inout [4:0]c;
inout [1:0] dvs_cb2,dvs_cb1,dvs_cb0,dvd_c6,dvd_c5,dvd_c4,dvd_c3,dvd_c7,dvd_c2,dvd_c1,dvd_c0,qc0,qc1,qc2,qc3,qc4,dvs_c2,dvs_c1,dvs_c0,rc2,rc1,rc0;
wire [1:0] p1m2,p1m1,p1m0,p2m2,p2m1,p2m0,p3m2,p3m1,p4m2,a1out,a2out,a3out,a4out,a5out,a6out,a7out,p4m1,p4m0,p5m2,p5m1,p5m0;

crumb_encoding e1(dividend,divdc);
crumb_encoding e2({1'b0,1'b0,1'b0,1'b0,divisor},divc);
assign dvs_c2 = divc[5:4];
assign dvs_c1 = divc[3:2];
assign dvs_c0 = divc[1:0];

exor a1(dvs_c2,dvs_cb2);
exor a2(dvs_c1,dvs_cb1);
exor a3(dvs_c0,dvs_cb0);


assign dvd_c7 = divdc[15:14]; 

assign dvd_c6 = divdc[13:12]; 
assign dvd_c5 = divdc[11:10]; 

assign dvd_c4 = divdc[9:8]; 

assign dvd_c3 = divdc[7:6]; 

assign dvd_c2 = divdc[5:4]; 
assign dvd_c1 = divdc[3:2]; 
assign dvd_c0 = divdc[1:0]; 


mul s1(dvs_cb2,dvd_c7,p1m2);

mul s2(dvs_cb1,dvd_c7,p1m1);

mul s3(dvs_cb0,dvd_c7,p1m0);

add1 ad1(p1m2,dvd_c6,a1out);

assign qc4 = dvd_c7;
assign qc3 = a1out;

mul s4(dvs_cb2,qc3,p2m2);

mul s5(dvs_cb1,qc3,p2m1);

mul s6(dvs_cb0,qc3,p2m0);


add2 ad2(p1m1,p2m2,dvd_c5,a2out);

assign qc2 = a2out;

mul s9(dvs_cb2,qc2,p3m2);
mul s7(dvs_cb1,qc2,p3m1);

mul s8(dvs_cb0,qc2,p3m0);



add3 adn3(p1m0,p2m1,p3m2,dvd_c4,a3out);

assign qc1 = a3out;

////////////////////////////////////////////////////
mul s99(dvs_cb2,qc1,p4m2);
mul s98(dvs_cb1,qc1,p4m1);
mul s97(dvs_cb0,qc1,p4m0);


add4 ad4(p4m2,p3m1,p2m0,dvd_c3,a4out);

assign qc0 = a4out;

mul s9n(dvs_cb2,qc0,p5m2);
mul sb(dvs_cb1,qc0,p5m1);
mul sx7(dvs_cb0,qc0,p5m0);

assign rc2 = p5m2+p4m1+dvd_c2+p3m0;
//add3 ad5(p5m2,p4m1,p3m0,dvd_c2,a5out);
//assign rc2 = a5out;

assign rc1 = p5m1+p4m0+dvd_c1;
//add2 ad6(p5m1,p4m0,dvd_c1,a6out);
//assign rc1 = a6out;
assign rc0 = p5m0+dvd_c0;
//add1 ads(p5m0,dvd_c0,a7out);
//assign rc0 = a7out;









assign b[4]= qc4[1];
assign b[3]= qc3[1];
assign b[2]= qc2[1];
assign b[1]= qc1[1];
assign b[0]= qc0[1];

assign c[4] = qc4[0] ^ qc4[1] ;
assign c[3] = qc3[0] ^ qc3[1] ;
assign c[2] = qc2[0] ^ qc2[1] ;
assign c[1] = qc1[0] ^ qc1[1] ;
assign c[0] = qc0[0] ^ qc0[1] ;

assign quotient = c - b;
assign remainder[2] = rc2[0] ^ rc2[1] ;
assign remainder[1] = rc1[0] ^ rc1[1] ;
assign remainder[0] = rc0[0] ^ rc0[1] ;







endmodule

/////////////////////////////////////////////////////

module crumb_encoding(a,b);
input [7:0]a;
output [15:0]b;
reg [15:0]b;

always@(*)
begin
 case(a[0])
 
 1'b0:begin b[0] =0;b[1]=0 ;end
 1'b1:begin b[0] = 1;b[1] = 0; end
 endcase
  case(a[1])
 
 1'b0:begin b[2] =0;b[3]=0 ;end
 1'b1:begin b[2] = 1;b[3] = 0; end
 endcase
   case(a[2])
 
 1'b0:begin b[4] =0;b[5]=0 ;end
 1'b1:begin b[4] = 1;b[5] = 0; end
 endcase
 
   case(a[3])
 
 1'b0:begin b[6] =0;b[7]=0 ;end
 1'b1:begin b[6] = 1;b[7] = 0; end
 endcase
  case(a[4])
 
 1'b0:begin b[8] =0;b[9]=0 ;end
 1'b1:begin b[8] = 1;b[9] = 0; end
 endcase
  case(a[5])
 
 1'b0:begin b[10] =0;b[11]=0 ;end
 1'b1:begin b[10] = 1;b[11] = 0; end
 endcase
  case(a[6])
  
 1'b0:begin b[12] =0;b[13]=0 ;end
 1'b1:begin b[12] = 1;b[13] = 0; end
 endcase 
 case(a[7])
 
 1'b0:begin b[14] =0;b[15]=0 ;end
 1'b1:begin b[14] = 1;b[15] = 0; end
 endcase
 end
 endmodule
///////////////////////////////////////////////////
 
///////////////////////////////////////////////////
 module mul(x,y,z);                             
 input [1:0]x,y;
 output [1:0]z;
 assign z[0] = x[0] * y[0];
 assign z[1] = (x[1]*y[0]) + (x[0] * y[1]);
 endmodule
//////////////////////////////////////////////////

///////////////////////////////////////////////////

module exor(q,r);
input [1:0]q;
output [1:0] r;
assign r[0] = q[0];
assign r[1] = (q[0] ^ q[1]);
endmodule

/////////////////////////////////////////////////

module add1(v1,v2,v3);
input [1:0]v1,v2;
output [1:0] v3;
assign v3 = v1+v2;
endmodule
//////////////////////////////////////////////////

/////////////////////////////////////////////////

module add2(v11,v12,v13,v14);
input [1:0]v11,v12,v13;
output [1:0] v14;
assign v14 = v11+v12+v13;
endmodule
//////////////////////////////////////////////////

/////////////////////////////////////////////////

module add3(v111,v112,v113,v114,v115);
input [1:0]v111,v112,v113,v114;
output [1:0] v115;
assign v115 = v111+v112+v113+v114;
endmodule
//////////////////////////////////////////////////

/////////////////////////////////////////////////

module add4(v1111,v1112,v1113,v1114,v1115);
input [1:0]v1111,v1112,v1113,v1114;
output [1:0] v1115;
assign v1115 = v1111+v1112+v1113+v1114;
endmodule
//////////////////////////////////////////////////