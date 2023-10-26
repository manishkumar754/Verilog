`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2023 18:54:25
// Design Name: 
// Module Name: ringcounter

module ringcounter(q,clk,clr);
input clr;
input clk;
output reg [3:0] q;

always@(posedge clk)
    if(clr==1)
        q <= 4'b1000;
    else
        begin
        q[3] <= q[0];
        q[2] <= q[3];
        q[1] <= q[2];
        q[0] <= q[1];
        end
        
endmodule
