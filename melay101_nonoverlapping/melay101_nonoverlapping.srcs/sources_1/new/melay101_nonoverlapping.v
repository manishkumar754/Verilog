`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2023 17:01:05
// Design Name: 
// Module Name: melay101_nonoverlapping
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


module melay101_nonoverlapping(
input clk,rst,d,
output  z
);
parameter A=2'b00,B=2'b01,C=2'b10;
reg [1:0] y;
always@(posedge clk) begin
if (rst) y<=A;
else case(y)
A:if(d==1'b1) y<=B;
  else        y<=A;
B:if(d==1'b0) y<=C;
   else       y<=B;
C:if(d==1'b1) y<=B;
   else       y<=A;
default: y<=A;
endcase
end
assign z=(y==C && d==1'b1) ? 1'b1 : 1'b0;
endmodule
