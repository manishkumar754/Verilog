`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2023 15:45:42
// Design Name: 
// Module Name: moore101_overlapping
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


module moore101_overlapping(
input rst,clk,d,
output reg z
    );
    
reg [1:0] ps,ns;
parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
//Define next stste combinational logic
always @(ps,d)
case (ps)
A:if (d) ns=B;
  else   ns=A;
B:if (d) ns=B;
  else   ns=C;
C:if (d) ns=D;
  else   ns=A;
D:if (d) ns=B;
  else   ns=C;
endcase
//define next stste update
always @(posedge clk or negedge rst)
begin
if (!rst) ps<=A;
else ps<=ns;
end
//define output logic
always@(ps)
if(ps==D) z=1;
else z=0;
endmodule
