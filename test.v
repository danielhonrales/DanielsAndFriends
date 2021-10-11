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
d10_1,d10_2,d10_3,d10_4,d10_5,d10_6,d10_7,d10_8,d10_9,d10_10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31;
reg [31:0]product;

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

FullAdder GA2_1((m0 & n2),(m1 & n1),d1,d2_1,product[2]);
FullAdder GA2_2((product[2]),(m2 & n0),d2_1,d2_2,product[2]);

FullAdder GA3_1((m0 & n3),(m1 & n2),d2_2,d3_1,product[3]);
FullAdder GA3_2(product[3],(m2 & n1),d3_1,d3_2,product[3]);
FullAdder GA3_3(product[3],(m3 & n0),d3_2,d3_3,product[3]);



product[4] = (m0 & n4) + (m1 & n3) + (m2 & n2) + (m3 & n1) + (m4 & n0);
product[5] = (m0 & n5) + (m1 & n4) + (m2 & n3) + (m3 & n2) + (m4 & n1) + (m5 & n0);

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
    assign input1  = 16'b0000000000000011;
	assign input2  = 16'b0000000000000001;
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