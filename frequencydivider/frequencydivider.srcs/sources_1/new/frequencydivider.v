`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2023 23:11:48
// Design Name: 
// Module Name: frequencydivider
// Project Name: 

module frequencydivider(
input d,
input clk,
input reset,
output reg q
);
always@(posedge clk or negedge reset)
begin
    if(reset)
        q <= 0;
    else 
        q <= d;
end
assign d = ~q;
endmodule
