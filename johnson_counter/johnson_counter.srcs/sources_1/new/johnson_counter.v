`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2023 22:45:03
// Design Name: 
// Module Name: johnson_counter
// Project Name: 

module johnson_counter(
input clk,
input clr,
output reg [3:0] q
);

always@(posedge clk)
begin
    if(clr ==1)
        q <= 4'b1000;
    else
        begin
        q[0] <= ~q[3];
        q[3] <= q[2];
        q[2] <= q[1];
        q[1] <=q[0];
        end
end        
endmodule
