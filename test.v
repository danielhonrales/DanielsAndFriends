//=============================================
// Half Adder
//=============================================
module HalfAdder(A,B,carry,sum);
	input A;
	input B;
	output carry;
	output sum;
	reg carry;
	reg sum;
//---------------------------------------------	
	always @(*) 
	  begin
	    sum= A ^ B;
	    carry= A & B;
	  end
//---------------------------------------------
endmodule


//=============================================
// Full Adder
//=============================================
module FullAdder(A,B,C,carry,sum);
	input A;
	input B;
	input C;
	output carry;
	output sum;
	reg carry;
	reg sum;
//---------------------------------------------	
	wire c0;
	wire s0;
	wire c1;
	wire s1;
//---------------------------------------------
	HalfAdder ha1(A ,B,c0,s0);
	HalfAdder ha2(s0,C,c1,s1);
//---------------------------------------------
	always @(*) 
	  begin
	    sum=s1;//
		sum= A^B^C;
	    carry=c1|c0;//
		carry= ((A^B)&C)|(A&B);  
	  end
//---------------------------------------------
	
endmodule

module AddSub(inputA,inputB,mode,sum,carry,overflow);
    input [15:0] inputA;
    input [15:0] inputB;
    input mode;
    output [31:0] sum;
    output carry;
    output overflow;
	wire a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31;
    wire b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31; //XOR Interfaces
	wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32; //Carry Interfaces

    assign b0 = inputB[0] ^ mode;
    assign b1 = inputB[1] ^ mode;
    assign b2 = inputB[2] ^ mode;
    assign b3 = inputB[3] ^ mode;
    assign b4 = inputB[4] ^ mode;
    assign b5 = inputB[5] ^ mode;
    assign b6 = inputB[6] ^ mode;
    assign b7 = inputB[7] ^ mode;
    assign b8 = inputB[8] ^ mode;
    assign b9 = inputB[9] ^ mode;
    assign b10 = inputB[10] ^ mode;
    assign b11 = inputB[11] ^ mode;
    assign b12 = inputB[12] ^ mode;
    assign b13 = inputB[13] ^ mode;
    assign b14 = inputB[14] ^ mode;
    assign b15 = inputB[15] ^ mode;
	assign b16 = 1'b0 ^ mode;
	assign b17 = 1'b0 ^ mode;
	assign b18 = 1'b0 ^ mode;
	assign b19 = 1'b0 ^ mode;
	assign b20 = 1'b0 ^ mode;
	assign b21 = 1'b0 ^ mode;
	assign b22 = 1'b0 ^ mode;
	assign b23 = 1'b0 ^ mode;
	assign b24 = 1'b0 ^ mode;
	assign b25 = 1'b0 ^ mode;
	assign b26 = 1'b0 ^ mode;
	assign b27 = 1'b0 ^ mode;
	assign b28 = 1'b0 ^ mode;
	assign b29 = 1'b0 ^ mode;
	assign b30 = 1'b0 ^ mode;
	assign b31 = 1'b0 ^ mode;

	assign a16 = 1'b0;
	assign a17 = 1'b0;
	assign a18 = 1'b0;
	assign a19 = 1'b0;
	assign a20 = 1'b0;
	assign a21 = 1'b0;
	assign a22 = 1'b0;
	assign a23 = 1'b0;
	assign a24 = 1'b0;
	assign a25 = 1'b0;
	assign a26 = 1'b0;
	assign a27 = 1'b0;
	assign a28 = 1'b0;
	assign a29 = 1'b0;
	assign a30 = 1'b0;
	assign a31 = 1'b0;

    FullAdder FA0(inputA[0],	b0,		mode,c1,sum[0]);
    FullAdder FA1(inputA[1],	b1,  	c1,c2,sum[1]);
    FullAdder FA2(inputA[2],	b2,  	c2,c3,sum[2]);
    FullAdder FA3(inputA[3],	b3,  	c3,c4,sum[3]);
    FullAdder FA4(inputA[4],	b4,  	c4,c5,sum[4]);
    FullAdder FA5(inputA[5],	b5,  	c5,c6,sum[5]);
    FullAdder FA6(inputA[6],	b6,  	c6,c7,sum[6]);
    FullAdder FA7(inputA[7],	b7,  	c7,c8,sum[7]);
    FullAdder FA8(inputA[8],	b8,  	c8,c9,sum[8]);
    FullAdder FA9(inputA[9],	b9,  	c9,c10,sum[9]);
    FullAdder FA10(inputA[10],	b10,  	c10,c11,sum[10]);
    FullAdder FA11(inputA[11],	b11,  	c11,c12,sum[11]);
    FullAdder FA12(inputA[12],	b12, 	c12,c13,sum[12]);
    FullAdder FA13(inputA[13],	b13,  	c13,c14,sum[13]);
    FullAdder FA14(inputA[14],	b14, 	c14,c15,sum[14]);
    FullAdder FA15(inputA[15],	b15, 	c15,c16,sum[15]);
	FullAdder FA16(a16,		b16, 		c16,c17,sum[16]);
	FullAdder FA17(a17,		b17, 		c17,c18,sum[17]);
	FullAdder FA18(a18,		b18, 		c18,c19,sum[18]);
	FullAdder FA19(a19,		b19,  	c19,c20,sum[19]);
	FullAdder FA20(a20,		b20,  	c20,c21,sum[20]);
	FullAdder FA21(a21,		b21,  	c21,c22,sum[21]);
	FullAdder FA22(a22,		b22,  	c22,c23,sum[22]);
	FullAdder FA23(a23,		b23,  	c23,c24,sum[23]);
	FullAdder FA24(a24,		b24,  	c24,c25,sum[24]);
	FullAdder FA25(a25,		b25,  	c25,c26,sum[25]);
	FullAdder FA26(a26,		b26,  	c26,c27,sum[26]);
	FullAdder FA27(a27,		b27,  	c27,c28,sum[27]);
	FullAdder FA28(a28,		b28,  	c28,c29,sum[28]);
	FullAdder FA29(a29,		b29,  	c29,c30,sum[29]);
	FullAdder FA30(a30,		b30,  	c30,c31,sum[30]);
	FullAdder FA31(a31,		b31,  	c31,c32,sum[31]);

    assign carry=c32;
    assign overflow=c32^c31;
 
endmodule


//Multiply
//Notes for continuation: Need to implement half/full adders I believe so that we can add these numbers dawg. 16 numbers at the most?
module Multiply(input1,input2,product);

input [15:0]input1;
input [15:0]input2;
output[31:0]product;
wire m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15;
wire n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15;
wire d0,d1,d2_1,d2_2,d3_1,d3_2,d3_3,d4_1,d4_2,d4_3,d4_4,d5_1,d5_2,d5_3,d5_4,d5_5,d6_1,d6_2,d6_3,d6_4,d6_5,d6_6,
d7_1,d7_2,d7_3,d7_4,d7_5,d7_6,d7_7,d8_1,d8_2,d8_3,d8_4,d8_5,d8_6,d8_7,d8_8,d9_1,d9_2,d9_3,d9_4,d9_5,d9_6,d9_7,d9_8,d9_9,
d10_1,d10_2,d10_3,d10_4,d10_5,d10_6,d10_7,d10_8,d10_9,d10_10,d11_1,d11_2,d11_3,d11_4,d11_5,d11_6,d11_7,d11_8,d11_9,d11_10,d11_11,
d12_1,d12_2,d12_3,d12_4,d12_5,d12_6,d12_7,d12_8,d12_9,d12_10,d12_11,d12_12,d13_1,d13_2,d13_3,d13_4,d13_5,d13_6,d13_7,d13_8,d13_9,d13_10,d13_11,d13_12,d13_13,
d14_1,d14_2,d14_3,d14_4,d14_5,d14_6,d14_7,d14_8,d14_9,d14_10,d14_11,d14_12,d14_13,d14_14,
d15_1,d15_2,d15_3,d15_4,d15_5,d15_6,d15_7,d15_8,d15_9,d15_10,d15_11,d15_12,d15_13,d15_14,d15_15,
d16_1,d16_2,d16_3,d16_4,d16_5,d16_6,d16_7,d16_8,d16_9,d16_10,d16_11,d16_12,d16_13,d16_14,d16_15,d16_16,
d17_1,d17_2,d17_3,d17_4,d17_5,d17_6,d17_7,d17_8,d17_9,d17_10,d17_11,d17_12,d17_13,d17_14,d17_15,d17_16,d17_17,
d18_1,d18_2,d18_3,d18_4,d18_5,d18_6,d18_7,d18_8,d18_9,d18_10,d18_11,d18_12,d18_13,d18_14,d18_15,d18_16,d18_17,d18_18,
d19_1,d19_2,d19_3,d19_4,d19_5,d19_6,d19_7,d19_8,d19_9,d19_10,d19_11,d19_12,d19_13,d19_14,d19_15,d19_16,d19_17,d19_18,d19_19,
d20_1,d20_2,d20_3,d20_4,d20_5,d20_6,d20_7,d20_8,d20_9,d20_10,d20_11,d20_12,d20_13,d20_14,d20_15,d20_16,d20_17,d20_18,d20_19,d20_20,
d21_1,d21_2,d21_3,d21_4,d21_5,d21_6,d21_7,d21_8,d21_9,d21_10,d21_11,d21_12,d21_13,d21_14,d21_15,d21_16,d21_17,d21_18,d21_19,d21_20,d21_21,
d22_1,d22_2,d22_3,d22_4,d22_5,d22_6,d22_7,d22_8,d22_9,d22_10,d22_11,d22_12,d22_13,d22_14,d22_15,d22_16,d22_17,d22_18,d22_19,d22_20,d22_21,d22_22,
d23_1,d23_2,d23_3,d23_4,d23_5,d23_6,d23_7,d23_8,d23_9,d23_10,d23_11,d23_12,d23_13,d23_14,d23_15,d23_16,d23_17,d23_18,d23_19,d23_20,d23_21,d23_22,d23_23,
d24_1,d24_2,d24_3,d24_4,d24_5,d24_6,d24_7,d24_8,d24_9,d24_10,d24_11,d24_12,d24_13,d24_14,d24_15,d24_16,d24_17,d24_18,d24_19,d24_20,d24_21,d24_22,d24_23,d24_24,
d25_1,d25_2,d25_3,d25_4,d25_5,d25_6,d25_7,d25_8,d25_9,d25_10,d25_11,d25_12,d25_13,d25_14,d25_15,d25_16,d25_17,d25_18,d25_19,d25_20,d25_21,d25_22,d25_23,d25_24,d25_25,
d26_1,d26_2,d26_3,d26_4,d26_5,d26_6,d26_7,d26_8,d26_9,d26_10,d26_11,d26_12,d26_13,d26_14,d26_15,d26_16,d26_17,d26_18,d26_19,d26_20,d26_21,d26_22,d26_23,d26_24,d26_25,d26_26,
d27_1,d27_2,d27_3,d27_4,d27_5,d27_6,d27_7,d27_8,d27_9,d27_10,d27_11,d27_12,d27_13,d27_14,d27_15,d27_16,d27_17,d27_18,d27_19,d27_20,d27_21,d27_22,d27_23,d27_24,d27_25,d27_26,d27_27,
d28_1,d28_2,d28_3,d28_4,d28_5,d28_6,d28_7,d28_8,d28_9,d28_10,d28_11,d28_12,d28_13,d28_14,d28_15,d28_16,d28_17,d28_18,d28_19,d28_20,d28_21,d28_22,d28_23,d28_24,d28_25,d28_26,d28_27,d28_28,
d29_1,d29_2,d29_3,d29_4,d29_5,d29_6,d29_7,d29_8,d29_9,d29_10,d29_11,d29_12,d29_13,d29_14,d29_15,d29_16,d29_17,d29_18,d29_19,d29_20,d29_21,d29_22,d29_23,d29_24,d29_25,d29_26,d29_27,d29_28,d29_29,
d30_1,d30_2,d30_3,d30_4,d30_5,d30_6,d30_7,d30_8,d30_9,d30_10,d30_11,d30_12,d30_13,d30_14,d30_15,d30_16,d30_17,d30_18,d30_19,d30_20,d30_21,d30_22,d30_23,d30_24,d30_25,d30_26,d30_27,d30_28,d30_29,d30_30,
d31_1,d31_2,d31_3,d31_4,d31_5,d31_6,d31_7,d31_8,d31_9,d31_10,d31_11,d31_12,d31_13,d31_14,d31_15,d31_16,d31_17,d31_18,d31_19,d31_20,d31_21,d31_22,d31_23,d31_24,d31_25,d31_26,d31_27,d31_28,d31_29,d31_30,d31_31;

wire p2,p3_1,p3_2,p4_1,p4_2,p4_3,p5_1,p5_2,p5_3,p5_4,p6_1,p6_2,p6_3,p6_4,p6_5,p7_1,p7_2,p7_3,p7_4,p7_5,p7_6,
p8_1,p8_2,p8_3,p8_4,p8_5,p8_6,p8_7,p9_1,p9_2,p9_3,p9_4,p9_5,p9_6,p9_7,p9_8,p10_1,p10_2,p10_3,p10_4,p10_5,p10_6,p10_7,p10_8,p10_9,
p11_1,p11_2,p11_3,p11_4,p11_5,p11_6,p11_7,p11_8,p11_9,p11_10,p12_1,p12_2,p12_3,p12_4,p12_5,p12_6,p12_7,p12_8,p12_9,p12_10,p12_11,
p13_1,p13_2,p13_3,p13_4,p13_5,p13_6,p13_7,p13_8,p13_9,p13_10,p13_11,p13_12,p14_1,p14_2,p14_3,p14_4,p14_5,p14_6,p14_7,p14_8,p14_9,p14_10,p14_11,p14_12,p14_13,
p15_1,p15_2,p15_3,p15_4,p15_5,p15_6,p15_7,p15_8,p15_9,p15_10,p15_11,p15_12,p15_13,p15_14,
p16_1,p16_2,p16_3,p16_4,p16_5,p16_6,p16_7,p16_8,p16_9,p16_10,p16_11,p16_12,p16_13,p16_14,p16_15,
p17_1,p17_2,p17_3,p17_4,p17_5,p17_6,p17_7,p17_8,p17_9,p17_10,p17_11,p17_12,p17_13,p17_14,p17_15,p17_16,
p18_1,p18_2,p18_3,p18_4,p18_5,p18_6,p18_7,p18_8,p18_9,p18_10,p18_11,p18_12,p18_13,p18_14,p18_15,p18_16,p18_17,
p19_1,p19_2,p19_3,p19_4,p19_5,p19_6,p19_7,p19_8,p19_9,p19_10,p19_11,p19_12,p19_13,p19_14,p19_15,p19_16,p19_17,p19_18,
p20_1,p20_2,p20_3,p20_4,p20_5,p20_6,p20_7,p20_8,p20_9,p20_10,p20_11,p20_12,p20_13,p20_14,p20_15,p20_16,p20_17,p20_18,p20_19,
p21_1,p21_2,p21_3,p21_4,p21_5,p21_6,p21_7,p21_8,p21_9,p21_10,p21_11,p21_12,p21_13,p21_14,p21_15,p21_16,p21_17,p21_18,p21_19,p21_20,
p22_1,p22_2,p22_3,p22_4,p22_5,p22_6,p22_7,p22_8,p22_9,p22_10,p22_11,p22_12,p22_13,p22_14,p22_15,p22_16,p22_17,p22_18,p22_19,p22_20,p22_21,
p23_1,p23_2,p23_3,p23_4,p23_5,p23_6,p23_7,p23_8,p23_9,p23_10,p23_11,p23_12,p23_13,p23_14,p23_15,p23_16,p23_17,p23_18,p23_19,p23_20,p23_21,p23_22,
p24_1,p24_2,p24_3,p24_4,p24_5,p24_6,p24_7,p24_8,p24_9,p24_10,p24_11,p24_12,p24_13,p24_14,p24_15,p24_16,p24_17,p24_18,p24_19,p24_20,p24_21,p24_22,p24_23,
p25_1,p25_2,p25_3,p25_4,p25_5,p25_6,p25_7,p25_8,p25_9,p25_10,p25_11,p25_12,p25_13,p25_14,p25_15,p25_16,p25_17,p25_18,p25_19,p25_20,p25_21,p25_22,p25_23,p25_24,
p26_1,p26_2,p26_3,p26_4,p26_5,p26_6,p26_7,p26_8,p26_9,p26_10,p26_11,p26_12,p26_13,p26_14,p26_15,p26_16,p26_17,p26_18,p26_19,p26_20,p26_21,p26_22,p26_23,p26_24,p26_25,
p27_1,p27_2,p27_3,p27_4,p27_5,p27_6,p27_7,p27_8,p27_9,p27_10,p27_11,p27_12,p27_13,p27_14,p27_15,p27_16,p27_17,p27_18,p27_19,p27_20,p27_21,p27_22,p27_23,p27_24,p27_25,p27_26,
p28_1,p28_2,p28_3,p28_4,p28_5,p28_6,p28_7,p28_8,p28_9,p28_10,p28_11,p28_12,p28_13,p28_14,p28_15,p28_16,p28_17,p28_18,p28_19,p28_20,p28_21,p28_22,p28_23,p28_24,p28_25,p28_26,p28_27,
p29_1,p29_2,p29_3,p29_4,p29_5,p29_6,p29_7,p29_8,p29_9,p29_10,p29_11,p29_12,p29_13,p29_14,p29_15,p29_16,p29_17,p29_18,p29_19,p29_20,p29_21,p29_22,p29_23,p29_24,p29_25,p29_26,p29_27,p29_28,
p30_1,p30_2,p30_3,p30_4,p30_5,p30_6,p30_7,p30_8,p30_9,p30_10,p30_11,p30_12,p30_13,p30_14,p30_15,p30_16,p30_17,p30_18,p30_19,p30_20,p30_21,p30_22,p30_23,p30_24,p30_25,p30_26,p30_27,p30_28,p30_29,
p31_1,p31_2,p31_3,p31_4,p31_5,p31_6,p31_7,p31_8,p31_9,p31_10,p31_11,p31_12,p31_13,p31_14,p31_15,p31_16,p31_17,p31_18,p31_19,p31_20,p31_21,p31_22,p31_23,p31_24,p31_25,p31_26,p31_27,p31_28,p31_29,p31_30;


assign m0 = input1[0];
assign m1 = input1[1];
assign m2 = input1[2];
assign m3 = input1[3];
assign m4 = input1[4];
assign m5 = input1[5];
assign m6 = input1[6];
assign m7 = input1[7];
assign m8 = input1[8];
assign m9 = input1[9];
assign m10 = input1[10];
assign m11 = input1[11];
assign m12 = input1[12];
assign m13 = input1[13];
assign m14 = input1[14];
assign m15 = input1[15];

assign n0 = input2[0];
assign n1 = input2[1];
assign n2 = input2[2];
assign n3 = input2[3];
assign n4 = input2[4];
assign n5 = input2[5];
assign n6 = input2[6];
assign n7 = input2[7];
assign n8 = input2[8];
assign n9 = input2[9];
assign n10 = input2[10];
assign n11 = input2[11];
assign n12 = input2[12];
assign n13 = input2[13];
assign n14 = input2[14];
assign n15 = input2[15];


assign product[0] = m0 & n0;

FullAdder GA1((m0 & n1),(m1 & n0),1'b0,d1,product[1]);
//sum = 0 :: carry = 1

// 011
// 011

HalfAdder GA2_1((m0 & n2),(m1 & n1),d2_1,p2);
//FullAdder GA2_1((m0 & n2),(m1 & n1),d1,d2_1,p2);

FullAdder GA2_2(p2,(m2 & n0),d1,d2_2,product[2]);

HalfAdder GA2_Carry(d2_1,d2_2,d2_3,p2);


FullAdder GA3_1((m0 & n3),(m1 & n2),d2_2,d3_1,p3_1);
FullAdder GA3_2(p3_1,(m2 & n1),d3_1,d3_2,p3_2);
FullAdder GA3_3(p3_2,(m3 & n0),d3_2,d3_3,product[3]);

/*
FullAdder GA4_1((m0 & n4),(m1 & n3),d3_3,d4_1,p4_1);
FullAdder GA4_2(p4_1,(m2 & n2),d4_1,d4_2,p4_2);
FullAdder GA4_3(p4_2,(m3 & n1),d4_2,d4_3,p4_3);
FullAdder GA4_4(p4_3,(m4 & n0),d4_3,d4_4,product[4]);

FullAdder GA5_1((m0 & n5),(m1 & n4),d4_4,d5_1,p5_1);
FullAdder GA5_2(p5_1,(m2 & n3),d5_1,d5_2,p5_2);
FullAdder GA5_3(p5_2,(m3 & n2),d5_2,d5_3,p5_3);
FullAdder GA5_4(p5_3,(m4 & n1),d5_3,d5_4,p5_4);
FullAdder GA5_5(p5_4,(m5 & n0),d5_4,d5_5,product[5]);

FullAdder GA6_1((m0 & n6),(m1 & n5),d5_5,d6_1,p6_1);
FullAdder GA6_2(p6_1,(m2 & n4),d6_1,d6_2,p6_2);
FullAdder GA6_3(p6_2,(m3 & n3),d6_2,d6_3,p6_3);
FullAdder GA6_4(p6_3,(m4 & n2),d6_3,d6_4,p6_4);
FullAdder GA6_5(p6_4,(m5 & n1),d6_4,d6_5,p6_5);
FullAdder GA6_6(p6_5,(m6 & n0),d6_5,d6_6,product[6]);

FullAdder GA7_1((m0 & n7),(m1 & n6),d6_6,d7_1,p7_1);
FullAdder GA7_2(p7_1,(m2 & n5),d7_1,d7_2,p7_2);
FullAdder GA7_3(p7_2,(m3 & n4),d7_2,d7_3,p7_3);
FullAdder GA7_4(p7_3,(m4 & n3),d7_3,d7_4,p7_4);
FullAdder GA7_5(p7_4,(m5 & n2),d7_4,d7_5,p7_5);
FullAdder GA7_6(p7_5,(m5 & n1),d7_5,d7_6,p7_6);
FullAdder GA7_7(p7_6,(m6 & n0),d7_6,d7_7,product[7]);
*/




endmodule

//Division
module Division(inputA,inputB,quotient,divBy0);

    input [15:0]inputA;
    input [15:0]inputB;
    output [31:0]quotient;
    output divBy0;
    reg [31:0]quotient;
    reg divBy0;

    always @(*) 
        begin
            if(inputB == 0) begin
                assign divBy0 = 1;
            end
            else begin
				assign divBy0 = 0;
                quotient = inputA / inputB;
			end
        end

endmodule

//Modulus Division
module Modulo(inputA,inputB,remainder,modBy0);

    input [15:0]inputA;
    input [15:0]inputB;
    output [31:0]remainder;
    output modBy0;
    reg [31:0]remainder;
    reg modBy0;

    always @(*) 
          begin
              if(inputB == 0) begin
                  assign modBy0 = 1;
              end
			  else begin
				  assign modBy0 = 0;
				  remainder = inputA % inputB;
			  end
          end

endmodule

module Dec4x16(binary,onehot);
	input [3:0] binary;
	output [15:0]onehot;
	
	assign onehot[ 0]=~binary[3]&~binary[2]&~binary[1]&~binary[0];
	assign onehot[ 1]=~binary[3]&~binary[2]&~binary[1]& binary[0];
	assign onehot[ 2]=~binary[3]&~binary[2]& binary[1]&~binary[0];
	assign onehot[ 3]=~binary[3]&~binary[2]& binary[1]& binary[0];
	assign onehot[ 4]=~binary[3]& binary[2]&~binary[1]&~binary[0];
	assign onehot[ 5]=~binary[3]& binary[2]&~binary[1]& binary[0];
	assign onehot[ 6]=~binary[3]& binary[2]& binary[1]&~binary[0];
	assign onehot[ 7]=~binary[3]& binary[2]& binary[1]& binary[0];
	assign onehot[ 8]= binary[3]&~binary[2]&~binary[1]&~binary[0];
	assign onehot[ 9]= binary[3]&~binary[2]&~binary[1]& binary[0];
	assign onehot[10]= binary[3]&~binary[2]& binary[1]&~binary[0];
	assign onehot[11]= binary[3]&~binary[2]& binary[1]& binary[0];
	assign onehot[12]= binary[3]& binary[2]&~binary[1]&~binary[0];
	assign onehot[13]= binary[3]& binary[2]&~binary[1]& binary[0];
	assign onehot[14]= binary[3]& binary[2]& binary[1]&~binary[0];
	assign onehot[15]= binary[3]& binary[2]& binary[1]& binary[0];
	
endmodule

module Mux16x4b(channels, select, b);
	input [15:0][31:0] channels;
	input      [15:0] select;
	output      [31:0] b;
	//wire  [15:0][3:0] channels;
	//wire        [3:0] b;


		assign b = ({32{select[15]}} & channels[15]) | 
				({32{select[14]}} & channels[14]) |
				({32{select[13]}} & channels[13]) |
				({32{select[12]}} & channels[12]) |
				({32{select[11]}} & channels[11]) |
				({32{select[10]}} & channels[10]) |
				({32{select[ 9]}} & channels[ 9]) |
				({32{select[ 8]}} & channels[ 8]) |
				({32{select[ 7]}} & channels[ 7]) |
				({32{select[ 6]}} & channels[ 6]) |
				({32{select[ 5]}} & channels[ 5]) |
				({32{select[ 4]}} & channels[ 4]) |
				({32{select[ 3]}} & channels[ 3]) |
				({32{select[ 2]}} & channels[ 2]) | 
				({32{select[ 1]}} & channels[ 1]) |
				({32{select[ 0]}} & channels[ 0]) ;

endmodule


module BreadBoard(input1,input2,opcode,result,error);
	input [15:0]input1;
	input [15:0]input2;
	input [3:0]opcode;
	output [31:0]result;
	output [1:0]error;
	wire [15:0]input1;
	wire [15:0]input2;
	wire [3:0]opcode;
	reg [31:0] result;
	reg [1:0] error;


	//Local Variables
	//Full Adder
	reg mode;
	wire [31:0] sum;
	wire carry;
	wire overflow;

	//Mult
	wire [31:0] product;
	
	//Div
	wire [31:0] quotient;
	wire divErr;

	//Mod
	wire [31:0] remainder;
	wire modErr;

	//Multiplexer
	wire [15:0][31:0] channels ;
	wire [15:0] onehotMux;
	wire [31:0] b;
	


	Dec4x16 dec(opcode,onehotMux);
	AddSub addsub(input1,input2,mode,sum,carry,overflow);
	Multiply mult(input1, input2, product);
	Division div(input1, input2, quotient, divErr);
	Modulo mod(input1, input2, remainder, modErr);
	Mux16x4b mux(channels,onehotMux,b);


	assign channels[ 0]=0;//GROUND=0
	assign channels[ 1]=sum;//Addition
	assign channels[ 2]=sum;//Subtraction
	assign channels[ 3]=product;//Multiplication
	assign channels[ 4]=quotient;//Division
	assign channels[ 5]=remainder;//Modulo
	assign channels[ 6]=0;//GROUND=0
	assign channels[ 7]=0;//GROUND=0
	assign channels[ 8]=0;//GROUND=0
	assign channels[ 9]=0;//GROUND=0
	assign channels[10]=0;//GROUND=0
	assign channels[11]=0;//GROUND=0
	assign channels[12]=0;//GROUND=0
	assign channels[13]=0;//GROUND=0
	assign channels[14]=0;//GROUND=0
	assign channels[15]=0;//GROUND=0

	always @(*)  
	begin
	//-------------------------------------------------------------
	mode=!opcode[0];
	result=b;
	error[1] = divErr | modErr;
	error[0] = overflow;
	//------------------------------------------------------------- 
	end

endmodule


module TestBench();
 
  reg [15:0] input1;
  reg [15:0] input2;
  reg [3:0]opcode;
  wire [31:0] result;
  wire [1:0] error;
  BreadBoard BB8(input1,input2,opcode,result,error);
  
  initial begin
    assign input1  = 16'b0000000000000111;
	assign input2  = 16'b0000000000000111;
	//Answer =    		10101100010001010
	
	
	assign opcode = 4'b0001;
	#10;
	$display("[Input A:%b, Input B:%b] [ADD:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display("%b", !opcode[0]);
	#10;
  	
   	assign opcode=4'b0010;
	#10;
	$display("[Input A:%b, Input B:%b] [SUB:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display("%b", !opcode[0]);
	#10;

	assign opcode=4'b0011;
	#10;
	$display("[Input A:%b, Input B:%b] [MUL:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();
	#10;

	assign opcode=4'b0100;
    #10;
	$display("[Input A:%b, Input B:%b] [DIV:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();
	#10;

	assign opcode=4'b0101;
    #10;
	$display("[Input A:%b, Input B:%b] [MOD:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();
	#10;

	
	#60; 
	$finish;
  end  
 

 
endmodule  