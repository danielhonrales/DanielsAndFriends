//========================================================================================
// Half Adder
//========================================================================================
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
//========================================================================================

//========================================================================================
// Full Adder
//========================================================================================
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
//========================================================================================

//========================================================================================
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
    FullAdder FA1(inputA[1],	b1,  	c1,c2,	sum[1]);
    FullAdder FA2(inputA[2],	b2,  	c2,c3,	sum[2]);
    FullAdder FA3(inputA[3],	b3,  	c3,c4,	sum[3]);
    FullAdder FA4(inputA[4],	b4,  	c4,c5,	sum[4]);
    FullAdder FA5(inputA[5],	b5,  	c5,c6,	sum[5]);
    FullAdder FA6(inputA[6],	b6,  	c6,c7,	sum[6]);
    FullAdder FA7(inputA[7],	b7,  	c7,c8,	sum[7]);
    FullAdder FA8(inputA[8],	b8,  	c8,c9,	sum[8]);
    FullAdder FA9(inputA[9],	b9,  	c9,c10,	sum[9]);
    FullAdder FA10(inputA[10],	b10,  	c10,c11,sum[10]);
    FullAdder FA11(inputA[11],	b11,  	c11,c12,sum[11]);
    FullAdder FA12(inputA[12],	b12, 	c12,c13,sum[12]);
    FullAdder FA13(inputA[13],	b13,  	c13,c14,sum[13]);
    FullAdder FA14(inputA[14],	b14, 	c14,c15,sum[14]);
    FullAdder FA15(inputA[15],	b15, 	c15,c16,sum[15]);
	FullAdder FA16(a16,			b16, 	c16,c17,sum[16]);
	FullAdder FA17(a17,			b17, 	c17,c18,sum[17]);
	FullAdder FA18(a18,			b18, 	c18,c19,sum[18]);
	FullAdder FA19(a19,			b19,  	c19,c20,sum[19]);
	FullAdder FA20(a20,			b20,  	c20,c21,sum[20]);
	FullAdder FA21(a21,			b21,  	c21,c22,sum[21]);
	FullAdder FA22(a22,			b22,  	c22,c23,sum[22]);
	FullAdder FA23(a23,			b23,  	c23,c24,sum[23]);
	FullAdder FA24(a24,			b24,  	c24,c25,sum[24]);
	FullAdder FA25(a25,			b25,  	c25,c26,sum[25]);
	FullAdder FA26(a26,			b26,  	c26,c27,sum[26]);
	FullAdder FA27(a27,			b27,  	c27,c28,sum[27]);
	FullAdder FA28(a28,			b28,  	c28,c29,sum[28]);
	FullAdder FA29(a29,			b29,  	c29,c30,sum[29]);
	FullAdder FA30(a30,			b30,  	c30,c31,sum[30]);
	FullAdder FA31(a31,			b31,  	c31,c32,sum[31]);

    assign carry=c32;
    assign overflow=c32^c31;
 
endmodule
//========================================================================================

//========================================================================================
//Multiply
module Multiply(inputA, inputB, product);
    input [15:0] inputA;
    input [15:0] inputB;
    output [31:0] product;

    wire [15:0] p0;
    wire [15:0] p1;
    wire [15:0] p2;
    wire [15:0] p3;
    wire [15:0] p4;
    wire [15:0] p5;
    wire [15:0] p6;
    wire [15:0] p7;
    wire [15:0] p8;
    wire [15:0] p9;
    wire [15:0] p10;
    wire [15:0] p11;
    wire [15:0] p12;
    wire [15:0] p13;
    wire [15:0] p14;
    wire [15:0] p15;

    assign p0[15:0] = {16{inputA[0]}} & inputB[15:0];
    assign p1[15:0] = {16{inputA[1]}} & inputB[15:0];
    assign p2[15:0] = {16{inputA[2]}} & inputB[15:0];
    assign p3[15:0] = {16{inputA[3]}} & inputB[15:0];
    assign p4[15:0] = {16{inputA[4]}} & inputB[15:0];
    assign p5[15:0] = {16{inputA[5]}} & inputB[15:0];
    assign p6[15:0] = {16{inputA[6]}} & inputB[15:0];
    assign p7[15:0] = {16{inputA[7]}} & inputB[15:0];
    assign p8[15:0] = {16{inputA[8]}} & inputB[15:0];
    assign p9[15:0] = {16{inputA[9]}} & inputB[15:0];
    assign p10[15:0] = {16{inputA[10]}} & inputB[15:0];
    assign p11[15:0] = {16{inputA[11]}} & inputB[15:0];
    assign p12[15:0] = {16{inputA[12]}} & inputB[15:0];
    assign p13[15:0] = {16{inputA[13]}} & inputB[15:0];
    assign p14[15:0] = {16{inputA[14]}} & inputB[15:0];
    assign p15[15:0] = {16{inputA[15]}} & inputB[15:0];


    wire [31:0] P;
    wire d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,d32,d33,d34,d35,d36,d37,d38,d39,d40,d41,d42,d43,d44,d45,d46,d47,d48,d49,d50,d51,d52,d53,d54,d55,d56,d57,d58,d59,d60,
    d61,d62,d63,d64,d65,d66,d67,d68,d69,d70,d71,d72,d73,d74,d75,d76,d77,d78,d79,d80,d81,d82,d83,d84,d85,d86,d87,d88,d89,d90,d91,d92,d93,d94,d95,d96,d97,d98,d99,d100,d101,d102,d103,d104,d105,d106,d107,d108,d109,d110,d111,d112,d113,d114,d115,d116,d117,d118,d119,d120,
	d121,d122,d123,d124,d125,d126,d127,d128,d129,d130,d131,d132,d133,d134,d135,d136,d137,d138,d139,d140,d141,d142,d143,d144,d145,d1146,d147,d148,d149,d150,d151,d152,d153,d154,d155,d156,d157,d158,d159,d160,d161,d162,d163,d164,d165,d166,d167,d168,d169,d170;

    wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,c51,c52,c53,c54,c55,c56,c57,c58,c59,c60,
    c61,c62,c63,c64,c65,c66,c67,c68,c69,c70,c71,c72,c73,c74,c75,c76,c77,c78,c79,c80,c81,c82,c83,c84,c85,c86,c87,c88,c89,c90,c91,c92,c93,c94,c95,c96,c97,c98,c99,c100,c101,c102,c103,c104,c105,c106,c107,c108,c109,c110,c111,c112,c113,c114,c115,c116,c117,c118,c119,c120,
    c121,c122,c123,c124,c125,c126,c127,c128,c129,c130,c131,c132,c133,c134,c135,c136,c137,c138,c139,c140,c141,c142,c143,c144,c145,c146,c147,c148,c149,c150,c151,c152,c153,c154,c155,c156,c157,c158,c159,c160,c161,c162,c163,c164,c165,c166,c167,c168,c169,c170,
	c171,c172,c173,c174,c175,c176,c177,c178,c179,c180,c181,c182,c183,c184,c185,c186,c187,c188,c189,c190,c191,c192,c193,c194,c195,c196,c197,c198,c199,c200,c201,c202,c203,c204,c205,c206,c207,c208,c209,c210,c211,c212,c213,c214,c215,c216,c217,c218,c219,c220,
	c221,c222,c223,c224,c225,c226,c227,c228,c229,c230,c231,c232,c233,c234,c235,c236,c237,c238,c239,c240;//,c241,c242,c243,c244,c245,c246,c247,c248,c249,c250;

    assign P[0] = p0[0];

    FullAdder FA1_1(p0[1],p1[0],1'b0,c0,P[1]);

    FullAdder FA2_1(p0[2],p1[1],p2[0],c1,d0); // sum = 1
    FullAdder FA2_2(c0,d0,1'b0,c2,P[2]);

    FullAdder FA3_1(p0[3],p1[2],p2[1],c3,d1);
    FullAdder FA3_2(d1,p3[0],c1,c4,d2);
    FullAdder FA3_3(d2,c2,1'b0,c5,P[3]);

    FullAdder FA4_1(p0[4],p1[3],p2[2],c6,d3);
    FullAdder FA4_2(d3,p3[1],p4[0],c7,d4);
    FullAdder FA4_3(d4,c3,c4,c8,d5);
    FullAdder FA4_4(d5,c5,1'b0,c9,P[4]);

    FullAdder FA5_1(p0[5],p1[4],p2[3],c10,d6);
    FullAdder FA5_2(d6,p3[2],p4[1],c11,d7);
    FullAdder FA5_3(d7,p5[0],c6,c12,d8);
    FullAdder FA5_4(d8,c7,c8,c13,d9);
    FullAdder FA5_5(d9,c9,1'b0,c14,P[5]);

    FullAdder FA6_1(p0[6],p1[5],p2[4],c15,d10);
    FullAdder FA6_2(d10,p3[3],p4[2],c16,d11);
    FullAdder FA6_3(d11,p5[1],p6[0],c17,d12);
    FullAdder FA6_4(d12,c10,c11,c18,d13);
    FullAdder FA6_5(d13,c12,c13,c19,d14);
    FullAdder FA6_6(d14,c14,1'b0,c20,P[6]);

    FullAdder FA7_1(p0[7],p1[6],p2[5],c21,d15);
    FullAdder FA7_2(d15,p3[4],p4[3],c22,d16);
    FullAdder FA7_3(d16,p5[2],p6[1],c23,d17);
    FullAdder FA7_4(d17,p7[0],c15,c24,d18);
    FullAdder FA7_5(d18,c16,c17,c25,d19);
    FullAdder FA7_6(d19,c18,c19,c26,d20);
    FullAdder FA7_7(d20,c20,1'b0,c27,P[7]);

    FullAdder FA8_1(p0[8],p1[7],p2[6],c28,d21);
    FullAdder FA8_2(d21,p3[5],p4[4],c29,d22);
    FullAdder FA8_3(d22,p5[3],p6[2],c30,d23);
    FullAdder FA8_4(d23,p7[1],p8[0],c31,d24);
    FullAdder FA8_5(d24,c21,c22,c32,d25);
    FullAdder FA8_6(d25,c23,c24,c33,d26);
    FullAdder FA8_7(d26,c25,c26,c34,d27);
    FullAdder FA8_8(d27,c27,1'b0,c35,P[8]);

    FullAdder FA9_1(p0[9],p1[8],p2[7],c36,d28);
    FullAdder FA9_2(d28,p3[6],p4[5],c37,d29);
    FullAdder FA9_3(d29,p5[4],p6[3],c38,d30);
    FullAdder FA9_4(d30,p7[2],p8[1],c39,d31);
    FullAdder FA9_5(d31,p9[0],c28,c40,d32);
    FullAdder FA9_6(d32,c29,c30,c41,d33);
    FullAdder FA9_7(d33,c31,c32,c42,d34);
    FullAdder FA9_8(d34,c33,c34,c43,d35);
    FullAdder FA9_9(d35,c35,1'b0,c44,P[9]); 

    FullAdder FA10_1(p0[10],p1[9],p2[8],c45,d36);
    FullAdder FA10_2(d36,p3[7],p4[6],c46,d37);
    FullAdder FA10_3(d37,p5[5],p6[4],c47,d38);
    FullAdder FA10_4(d38,p7[3],p8[2],c48,d39);
    FullAdder FA10_5(d39,p9[1],p10[0],c49,d40);
    FullAdder FA10_6(d40,c36,c37,c50,d41);
    FullAdder FA10_7(d41,c38,c39,c51,d42);
    FullAdder FA10_8(d42,c40,c41,c52,d43);
    FullAdder FA10_9(d43,c42,c43,c53,d44);
    FullAdder FA10_10(d44,c44,1'b0,c54,P[10]);

    FullAdder FA11_1(p0[11],p1[10],p2[9],c55,d45);
    FullAdder FA11_2(d45,p3[8],p4[7],c56,d46);
    FullAdder FA11_3(d46,p5[6],p6[5],c57,d47);
    FullAdder FA11_4(d47,p7[4],p8[3],c58,d48);
    FullAdder FA11_5(d48,p9[2],p10[1],c59,d49);
    FullAdder FA11_6(d49,p11[0],c45,c60,d50);
    FullAdder FA11_7(d50,c46,c47,c61,d51);
    FullAdder FA11_8(d51,c48,c49,c62,d52);
    FullAdder FA11_9(d52,c50,c51,c63,d53);
    FullAdder FA11_10(d53,c52,c53,c64,d54);
    FullAdder FA11_11(d54,c54,1'b0,c65,P[11]);

    FullAdder FA12_1(p0[12],p1[11],p2[10],c66,d55);
    FullAdder FA12_2(d55,p3[9],p4[8],c67,d56);
    FullAdder FA12_3(d56,p5[7],p6[6],c68,d57);
    FullAdder FA12_4(d57,p7[5],p8[4],c69,d58);
    FullAdder FA12_5(d58,p9[3],p10[2],c70,d59);
    FullAdder FA12_6(d59,p11[1],p12[0],c71,d60);
    FullAdder FA12_7(d60,c55,c56,c72,d61);
    FullAdder FA12_8(d61,c57,c58,c73,d62);
    FullAdder FA12_9(d62,c59,c60,c74,d63);
    FullAdder FA12_10(d63,c61,c62,c75,d64);
    FullAdder FA12_11(d64,c63,c64,c76,d65);
    FullAdder FA12_12(d65,c65,1'b0,c77,P[12]);

    FullAdder FA13_1(p0[13],p1[12],p2[11],c78,d66);
    FullAdder FA13_2(d66,p3[10],p4[9],c79,d67);
    FullAdder FA13_3(d67,p5[8],p6[7],c80,d68);
    FullAdder FA13_4(d68,p7[6],p8[5],c81,d69);
    FullAdder FA13_5(d69,p9[4],p10[3],c82,d70);
    FullAdder FA13_6(d70,p11[2],p12[1],c83,d71);
    FullAdder FA13_7(d71,p13[0],c66,c84,d72);
    FullAdder FA13_8(d72,c67,c68,c85,d73);
    FullAdder FA13_9(d73,c69,c70,c86,d74);
    FullAdder FA13_10(d74,c71,c72,c87,d75);
    FullAdder FA13_11(d75,c73,c74,c88,d76);
    FullAdder FA13_12(d76,c75,c76,c89,d77);
    FullAdder FA13_13(d77,c77,1'b0,c90,P[13]);

    FullAdder FA14_1(p0[14],p1[13],p2[12],c91,d78);
    FullAdder FA14_2(d78,p3[11],p4[10],c92,d79);
    FullAdder FA14_3(d79,p5[9],p6[8],c93,d80);
    FullAdder FA14_4(d80,p7[7],p8[6],c94,d81);
    FullAdder FA14_5(d81,p9[5],p10[4],c95,d82);
    FullAdder FA14_6(d82,p11[3],p12[2],c96,d83);
    FullAdder FA14_7(d83,p13[1],p14[0],c97,d84);
    FullAdder FA14_8(d84,c78,c79,c98,d85);
    FullAdder FA14_9(d85,c80,c81,c99,d86);
    FullAdder FA14_10(d86,c82,c83,c100,d87);
    FullAdder FA14_11(d87,c84,c85,c101,d88);
    FullAdder FA14_12(d88,c86,c87,c102,d89);
    FullAdder FA14_13(d89,c88,c89,c103,d90);
    FullAdder FA14_14(d90,c90,1'b0,c104,P[14]);

    FullAdder FA15_1(p0[15],p1[14],p2[13],c106,d91);
    FullAdder FA15_2(d91,p3[12],p4[11],c107,d92);
    FullAdder FA15_3(d92,p5[10],p6[9],c108,d93);
    FullAdder FA15_4(d93,p7[8],p8[7],c109,d94);
    FullAdder FA15_5(d94,p9[6],p10[5],c110,d95);
    FullAdder FA15_6(d95,p11[4],p12[3],c111,d96);
    FullAdder FA15_7(d96,p13[2],p14[1],c112,d97);
    FullAdder FA15_8(d97,p15[0],c91,c113,d98);
    FullAdder FA15_9(d98,c92,c93,c114,d99);
    FullAdder FA15_10(d99,c94,c95,c115,d100);
    FullAdder FA15_11(d100,c96,c97,c116,d101);
    FullAdder FA15_12(d101,c98,c99,c117,d102);
    FullAdder FA15_13(d102,c100,c101,c118,d103);
    FullAdder FA15_14(d103,c102,c103,c119,d104);
    FullAdder FA15_15(d104,c104,1'b0,c120,P[15]);

	FullAdder FA16_1(p1[15],p2[14],p3[13],c121,d105);
	FullAdder FA16_2(d105,p4[12],p5[11],c122,d106);
	FullAdder FA16_3(d106,p6[10],p7[9],c123,d107);
	FullAdder FA16_4(d107,p8[8],p9[7],c124,d108);
	FullAdder FA16_5(d108,p10[6],p11[5],c125,d109);
	FullAdder FA16_6(d109,p12[4],p13[3],c126,d110);
	FullAdder FA16_7(d110,p14[2],p15[1],c127,d111);
	FullAdder FA16_8(d111,c106,c107,c128,d112);
	FullAdder FA16_9(d112,c108,c109,c129,d113);
	FullAdder FA16_10(d113,c110,c111,c130,d114);
	FullAdder FA16_11(d114,c112,c113,c131,d115);
	FullAdder FA16_12(d115,c114,c115,c132,d116);
	FullAdder FA16_13(d116,c116,c117,c133,d117);
	FullAdder FA16_14(d117,c118,c119,c134,d118);
	FullAdder FA16_15(d118,c120,1'b0,c135,P[16]);

	FullAdder FA17_1(p2[15],p3[14],p4[13],c136,d119);
	FullAdder FA17_2(d119,p5[12],p6[11],c137,d120);
	FullAdder FA17_3(d120,p7[10],p8[9],c138,d121);
	FullAdder FA17_4(d121,p9[8],p10[7],c139,d122);
	FullAdder FA17_5(d122,p11[6],p12[5],c140,d123);
	FullAdder FA17_6(d123,p13[4],p14[3],c141,d124);
	FullAdder FA17_7(d124,p15[2],c121,c142,d125);
	FullAdder FA17_8(d125,c122,c123,c143,d126);
	FullAdder FA17_9(d126,c124,c125,c144,d127);
	FullAdder FA17_10(d127,c126,c127,c145,d128);
	FullAdder FA17_11(d128,c128,c129,c146,d129);
	FullAdder FA17_12(d129,c130,c131,c147,d130);
	FullAdder FA17_13(d130,c132,c133,c148,d131);
	FullAdder FA17_14(d131,c134,c135,c149,P[17]);

	FullAdder FA18_1(p3[15],p4[14],p5[13],c150,d132);
	FullAdder FA18_2(d132,p6[12],p7[11],c151,d133);
	FullAdder FA18_3(d133,p8[10],p9[9],c152,d134);
	FullAdder FA18_4(d134,p10[8],p11[7],c153,d135);
	FullAdder FA18_5(d135,p12[6],p13[5],c154,d136);
	FullAdder FA18_6(d136,p14[4],p15[3],c155,d137);
	FullAdder FA18_7(d137,c136,c137,c156,d138);
	FullAdder FA18_8(d138,c138,c139,c157,d139);
	FullAdder FA18_9(d139,c140,c141,c158,d140);
	FullAdder FA18_10(d140,c142,c143,c159,d141);
	FullAdder FA18_11(d141,c144,c145,c160,d142);
	FullAdder FA18_12(d142,c146,c147,c161,d143);
	FullAdder FA18_13(d143,c148,c149,c162,P[18]);

	FullAdder FA19_1(p4[15],p5[14],p6[13],c163,d144);
	FullAdder FA19_2(d144,p7[12],p8[11],c164,d145);
	FullAdder FA19_3(d145,p9[10],p10[9],c165,d146);
	FullAdder FA19_4(d146,p11[8],p12[7],c166,d147);
	FullAdder FA19_5(d147,p13[6],p14[5],c167,d148);
	FullAdder FA19_6(d148,p15[4],c150,c168,d149);
	FullAdder FA19_7(d149,c151,c152,c169,d150);
	FullAdder FA19_8(d150,c153,c154,c170,d151);
	FullAdder FA19_9(d151,c155,c156,c171,d152);
	FullAdder FA19_10(d152,c157,c158,c172,d153);
	FullAdder FA19_11(d153,c159,c160,c173,d154);
	FullAdder FA19_12(d154,c161,c162,c174,P[19]);

	FullAdder FA20_1(p5[15],p6[14],p7[13],c175,d155);
	FullAdder FA20_2(d155,p8[12],p9[11],c176,d156);
	FullAdder FA20_3(d156,p10[10],p11[9],c177,d157);
	FullAdder FA20_4(d157,p12[8],p13[7],c178,d158);
	FullAdder FA20_5(d158,p14[6],p15[5],c179,d159);
	FullAdder FA20_6(d159,c163,c164,c180,d160);
	FullAdder FA20_7(d160,c165,c166,c181,d161);
	FullAdder FA20_8(d161,c167,c168,c182,d162);
	FullAdder FA20_9(d162,c169,c170,c183,d163);
	FullAdder FA20_10(d163,c171,c172,c184,d164);
	FullAdder FA20_11(d164,c173,c174,c185,P[20]);

	FullAdder FA21_1(p6[15],p7[14],p8[13],c186,d165);
	FullAdder FA21_2(d165,p9[12],p10[11],c187,d166);
	FullAdder FA21_3(d166,p11[10],p12[9],c188,d167);
	FullAdder FA21_4(d167,p13[8],p14[7],c189,d168);
	FullAdder FA21_5(d168,p15[6],c175,c190,d169);
	FullAdder FA21_6(d169,c176,c177,c191,d170);
	FullAdder FA21_7(d170,c178,c179,c192,d171);
	FullAdder FA21_8(d171,c180,c181,c193,d172);
	FullAdder FA21_9(d172,c182,c183,c194,d173);
	FullAdder FA21_10(d173,c184,c185,c195,P[21]);

	FullAdder FA22_1(p7[15],p8[14],p9[13],c196,d174);
	FullAdder FA22_2(d174,p10[12],p11[11],c197,d175);
	FullAdder FA22_3(d175,p12[10],p13[9],c198,d176);
	FullAdder FA22_4(d176,p14[8],p15[7],c199,d177);
	FullAdder FA22_5(d177,c186,c187,c200,d178);
	FullAdder FA22_6(d178,c188,c189,c201,d179);
	FullAdder FA22_7(d179,c190,c191,c202,d180);
	FullAdder FA22_8(d180,c192,c193,c203,d181);
	FullAdder FA22_9(d181,c194,c195,c204,P[22]);

	FullAdder FA23_1(p8[15],p9[14],p10[13],c205,d182);
	FullAdder FA23_2(d182,p11[12],p12[11],c206,d183);
	FullAdder FA23_3(d183,p13[10],p14[9],c207,d184);
	FullAdder FA23_4(d184,p15[8],c196,c208,d185);
	FullAdder FA23_5(d185,c197,c198,c209,d186);
	FullAdder FA23_6(d186,c199,c200,c210,d187);
	FullAdder FA23_7(d187,c201,c202,c211,d188);
	FullAdder FA23_8(d188,c203,c204,c212,P[23]);

	FullAdder FA24_1(p9[15],p10[14],p11[13],c213,d189);
	FullAdder FA24_2(d189,p12[12],p13[11],c214,d190);
	FullAdder FA24_3(d190,p14[10],p15[9],c215,d191);
	FullAdder FA24_4(d191,c205,c206,c216,d192);
	FullAdder FA24_5(d192,c207,c208,c217,d193);
	FullAdder FA24_6(d193,c209,c210,c218,d194);
	FullAdder FA24_7(d194,c211,c212,c219,P[24]);

	FullAdder FA25_1(p10[15],p11[14],p12[13],c220,d195);
	FullAdder FA25_2(d195,p13[12],p14[11],c221,d196);
	FullAdder FA25_3(d196,p15[10],c213,c222,d197);
	FullAdder FA25_4(d197,c214,c215,c223,d198);
	FullAdder FA25_5(d198,c216,c217,c224,d199);
	FullAdder FA25_6(d199,c218,c219,c225,P[25]);

	FullAdder FA26_1(p11[15],p12[14],p13[13],c226,d200);
	FullAdder FA26_2(d200,p14[12],p15[11],c227,d201);
	FullAdder FA26_3(d201,c220,c221,c228,d202);
	FullAdder FA26_4(d202,c222,c223,c229,d203);
	FullAdder FA26_5(d203,c224,c225,c230,P[26]);

	FullAdder FA27_1(p12[15],p13[14],p14[13],c231,d204);
	FullAdder FA27_2(d204,p15[12],c226,c232,d205);
	FullAdder FA27_3(d205,c227,c228,c233,d206);
	FullAdder FA27_4(d206,c229,c230,c234,P[27]);

	FullAdder FA28_1(p13[15],p14[14],p15[13],c235,d207);
	FullAdder FA28_2(d207,c231,c232,c236,d208);
	FullAdder FA28_3(d208,c233,c234,c237,P[28]);

	FullAdder FA29_1(p14[15],p15[14],c235,c238,d209);
	FullAdder FA29_2(d209,c236,c237,c239,P[29]);

	FullAdder FA30_1(p15[15],c238,c239,c240,P[30]);

	assign P[31] = c240;

    assign product[31:0] = P[31:0];

endmodule

//========================================================================================

//========================================================================================
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
				quotient = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
            else begin
				assign divBy0 = 0;
                quotient = inputA / inputB;
			end
        end

endmodule
//========================================================================================

//========================================================================================
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
				  remainder = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
              end
			  else begin
				  assign modBy0 = 0;
				  remainder = inputA % inputB;
			  end
          end

endmodule
//========================================================================================

//========================================================================================
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
//========================================================================================

//========================================================================================
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
//========================================================================================

//========================================================================================
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
//========================================================================================

//========================================================================================
module TestBench();
 
  reg [15:0] input1;
  reg [15:0] input2;
  reg [3:0]opcode;
  wire [31:0] result;
  wire [1:0] error;
  BreadBoard BB8(input1,input2,opcode,result,error);
  
  initial begin

	$display("------------------------------------------------------------------------------------------------------------------------------");
	$display();

	//------------------------------------------------------------- 
    assign input1  = 16'b0000000011110111; // 247
	assign input2  = 16'b0000000010000100; // 132
	
	// Add
	assign opcode = 4'b0001;
	#10;
	$display("[Input A:%b, Input B:%b] [ADD:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();
  	
	// Sub
   	assign opcode=4'b0010;
	#10;
	$display("[Input A:%b, Input B:%b] [SUB:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();

	// Mult	
	assign opcode=4'b0011;
	#10;
	$display("[Input A:%b, Input B:%b] [MUL:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();

	assign input2  = 16'b0000000000000000; // 0
	// Div
	assign opcode=4'b0100;
    #10;
	$display("[Input A:%b, Input B:%b] [DIV:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();

	assign input2  = 16'b0000000010000100; // 132
	// Mod
	assign opcode=4'b0101;
    #10;
	$display("[Input A:%b, Input B:%b] [MOD:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();

	$display("------------------------------------------------------------------------------------------------------------------------------");
	$display();	

	//------------------------------------------------------------- 
    assign input1  = 16'b0111110100000000; // 32000
	assign input2  = 16'b0011111010000000; // 16000
	
	// Add
	assign opcode = 4'b0001;
	#10;
	$display("[Input A:%b, Input B:%b] [ADD:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();
  	
	// Sub
   	assign opcode=4'b0010;
	#10;
	$display("[Input A:%b, Input B:%b] [SUB:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();

	// Mult	
	assign opcode=4'b0011;
	#10;
	$display("[Input A:%b, Input B:%b] [MUL:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();

	// Div
	assign opcode=4'b0100;
    #10;
	$display("[Input A:%b, Input B:%b] [DIV:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();

	assign input2  = 16'b0000000000000000; // 0
	// Mod
	assign opcode=4'b0101;
    #10;
	$display("[Input A:%b, Input B:%b] [MOD:%b] [Output: %b, Error: %b]",input1,input2,opcode,result,error);
	$display();

	$display("------------------------------------------------------------------------------------------------------------------------------");
	
	#60; 
	$finish;
  end  

endmodule  