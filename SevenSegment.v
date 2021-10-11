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
    input [3:0] inputA;
	input [3:0] inputB;
    input mode;
    output [3:0] sum;
	output carry;
    output overflow;
    wire b0,b1,b2,b3; //XOR Interfaces
	wire c0,c1,c2,c3,c4; //Carry Interfaces
	
    assign b0 = inputB[0] ^ mode;
    assign b1 = inputB[1] ^ mode;
    assign b2 = inputB[2] ^ mode;
    assign b3 = inputB[3] ^ mode;

	FullAdder FA0(inputA[0],b0,mode,c1,sum[0]);
	FullAdder FA1(inputA[1],b1,  c1,c2,sum[1]);
	FullAdder FA2(inputA[2],b2,  c2,c3,sum[2]);
	FullAdder FA3(inputA[3],b3,  c3,c4,sum[3]);

	assign carry=c4;
	assign overflow=c4^c3;
 
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
/*
 //Division
module Division(inputA,inputB,quotient,divBy0);

	input [15:0]inputA;
	input [15:0]inputB;
	output [31:0]quotient;
	output [31:0]divBy0;
	reg [31:0]quotient;
	reg [31:0]divBy0;

	always @(*) 
	  	begin
			  if(inputB == 0) begin
				  divBy0 = 1;
			  end
			  else
			  	quotient = inputA / inputB;
	  	end

endmodule

//Modulus Division
module Modulo(inputA,inputB,remainder,divBy0);

	input [15:0]inputA;
	input [15:0]inputB;
	output [31:0]remainder;
	output [31:0]divBy0;
	reg [31:0]remainder;
	reg [31:0]divBy0;

	always @(*) 
	  	begin
			  if(inputB == 0) begin
				  divBy0 = 1;
			  end
	    	remainder = inputA % inputB;
	  	end

endmodule
*/

module Mux16x4b(channels, select, b);
input [15:0][3:0] channels;
input      [15:0] select;
output      [3:0] b;
//wire  [15:0][3:0] channels;
//wire        [3:0] b;


	assign b = ({16{select[15]}} & channels[15]) | 
               ({16{select[14]}} & channels[14]) |
			   ({16{select[13]}} & channels[13]) |
			   ({16{select[12]}} & channels[12]) |
			   ({16{select[11]}} & channels[11]) |
			   ({16{select[10]}} & channels[10]) |
			   ({16{select[ 9]}} & channels[ 9]) |
			   ({16{select[ 8]}} & channels[ 8]) |
			   ({16{select[ 7]}} & channels[ 7]) |
			   ({16{select[ 6]}} & channels[ 6]) |
			   ({16{select[ 5]}} & channels[ 5]) |
			   ({16{select[ 4]}} & channels[ 4]) |
			   ({16{select[ 3]}} & channels[ 3]) |
			   ({16{select[ 2]}} & channels[ 2]) | 
               ({16{select[ 1]}} & channels[ 1]) |
               ({16{select[ 0]}} & channels[ 0]) ;

endmodule


module BreadBoard(inputA,inputB,command,result,error,display);
input [3:0]inputA;
input [3:0]inputB;
input [3:0] command;
output [3:0]result;
output error;
output [6:0] display;
wire [3:0]inputA;
wire [3:0]inputB;
wire [3:0] command;
reg [3:0]result;
reg error;
reg [6:0] display;


//Local Variables
//Full Adder
reg mode;
wire [3:0] sum;
wire carry;
wire overflow;

//Multiplexer
wire [15:0][3:0] channels ;
wire [15:0] onehotMux;
wire [3:0] b;

//Seven Segment Display
wire [15:0] D;
 

Dec4x16 DecBeta(b,D);
Dec4x16 DecAlpha(command,onehotMux);
AddSub nept(inputA,inputB,mode,sum,carry,overflow);
//Mux16x4a uran(channels,command,b);
Mux16x4b satu(channels,onehotMux,b);



assign channels[ 0]=0;//GROUND=0
assign channels[ 1]=sum;//Addition
assign channels[ 2]=0;//GROUND=0
assign channels[ 3]=0;//GROUND=0
assign channels[ 4]=0;//GROUND=0
assign channels[ 5]=sum;//Subtraction
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
 mode=command[2];
 result=b;
 error=overflow;
//------------------------------------------------------------- 
 /*Segment a*/display[0]=D[0]     |D[2]|D[3]     |D[5]|D[6]|D[7]|D[8]|D[9];
 /*Segment b*/display[1]=D[0]|D[1]|D[2]|D[3]|D[4]          |D[7]|D[8]|D[9];
 /*Segment c*/display[2]=D[0]|D[1]     |D[3]|D[4]|D[5]|D[6]|D[7]|D[8]|D[9];
 /*Segment d*/display[3]=D[0]     |D[2]|D[3]     |D[5]|D[6]     |D[8]|D[9];
 /*Segment e*/display[4]=D[0]     |D[2]               |D[6]     |D[8]     ;
 /*Segment f*/display[5]=D[0]               |D[4]|D[5]|D[6]     |D[8]|D[9];
 /*Segment g*/display[6]=         |D[2]|D[3]|D[4]|D[5]|D[6]     |D[8]|D[9];
//-------------------------------------------------------------	   
end

endmodule


module TestBench();
 
  reg [3:0] inputA;
  reg [3:0] inputB;
  reg [3:0] command;
  wire [3:0] result;
  wire error;
  wire [6:0] display;
  BreadBoard BB8(inputA,inputB,command,result,error,display);
   
  reg k1,k2,k3,k4,k5;
  reg segA,segB,segC,segD,segE,segF,segG;
  reg [7:0] charA;
  
  initial begin
    assign inputA  = 4'b0110;
	assign inputB  = 4'b0001;
	assign command = 4'b0001;
	

	#10;
	$display("%2d:%b,%2d:%b,ADD:%b,%b,E:%b,D:%b",inputA,inputA,inputB,inputB,command,result,error,display);
	$display();
	
 
  
    segA=display[0];
	segB=display[1];
	segC=display[2];
	segD=display[3];
	segE=display[4];
	segF=display[5];
	segG=display[6];
	

	$display(".%b%b%b.",segA,segA,segA);
	$display("%b...%b",segF,segB);
    $display("%b...%b",segF,segB);
	$display("%b...%b",segF,segB);
	$display(".%b%b%b.",segG,segG,segG);
	$display("%b...%b",segE,segC);
    $display("%b...%b",segE,segC);
	$display("%b...%b",segE,segC);
	$display(".%b%b%b.",segD,segD,segD);
	
	$display();
  
   	assign command=4'b0101;
	#10;
		
	segA=display[0];
	segB=display[1];
	segC=display[2];
	segD=display[3];
	segE=display[4];
	segF=display[5];
	segG=display[6];
	

	$display("%2d:%b,%2d:%b,SUB:%b,%b,E:%b,D:%b",inputA,inputA,inputB,inputB,command,result,error,display);
	$display();
  	$display(".%b%b%b.",segA,segA,segA);
	$display("%b...%b",segF,segB);
    $display("%b...%b",segF,segB);
	$display("%b...%b",segF,segB);
	$display(".%b%b%b.",segG,segG,segG);
	$display("%b...%b",segE,segC);
    $display("%b...%b",segE,segC);
	$display("%b...%b",segE,segC);
	$display(".%b%b%b.",segD,segD,segD);
	$display();

	
	#60; 
	$finish;
  end  
 

 
endmodule  