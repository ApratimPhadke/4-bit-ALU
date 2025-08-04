`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2025 02:56:27 PM
// Design Name: 
// Module Name: four_bit_alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module four_bit_alu(
input wire [3:0] a,
input wire [3:0] b,
input wire [3:0] opcode ,
input wire enable ,
output reg [3:0] result ,
output reg zero ,
output reg carry,
output reg overflow 
);
parameter ADD = 4'b0000;
parameter SUB = 4'b0001;
parameter INC = 4'b0010;
parameter DEC = 4'b0011;
parameter AND = 4'b0100;
parameter OR = 4'b0101;
parameter XOR = 4'b0110;
parameter NOT = 4'b0111;
parameter SHL = 4'b1000;
parameter SHR = 4'b1001;
parameter PASS = 4'b1010;
parameter ZERO = 4'b1011;

reg [4:0] temp_result ;
always @(*) begin 
if(!enable) begin 
result = 4'b0000;
zero = 1'b0;
carry = 1'b0;
overflow = 1'b0;
end else begin 
carry = 1'b0;
overflow = 1'b0;
case (opcode) 
ADD: begin 
temp_result = a+b;
result =temp_result [3:0]  ;
carry = temp_result[4];
overflow = (~a[3] & ~b[3] & result[3] ) | (a[3] & b[3] & ~result[3]);
end 
SUB: begin 
temp_result = a-b;
result = temp_result[3:0];
carry = temp_result[4];
overflow = (~a[3] & ~b[3] & result[3] ) | (a[3] & b[3] & ~result[3]);
end
INC:begin 
temp_result = a+1;
result = temp_result[3:0];
carry =  temp_result [4];
overflow = (~a[3] & result[3]);
end 
DEC: begin 
temp_result = a-1;
result = temp_result[3:0] ;
carry = temp_result[4];
overflow = (a[3] & ~result[3]);
end 
AND: begin 
result = a&b;
end 
OR: begin 
result = a|b;
end 
XOR: begin 
result = a^b;
end 
NOT: begin 
result = ~a;
end 
SHL: begin 
temp_result = {a,1'b0};
result = temp_result[3:0];
carry = temp_result[4];
end 
SHR: begin 
result = {1'b0,a[3:1]};
carry=a[0];
end 
PASS: begin 
result = a;
end 
ZERO: begin 
result = 4'b0000;
end 
default: begin 
result = 4'b0000;
end 
endcase 
zero = (result == 4'b0000);
end 
end 


 
endmodule
