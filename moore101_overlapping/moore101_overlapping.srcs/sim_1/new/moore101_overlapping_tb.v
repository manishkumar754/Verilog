`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2023 15:59:59
// Design Name: 
// Module Name: moore101_overlapping_tb
// Project Name: 

module moore101_overlapping_tb();
reg d,clk,rst,ps,ns;
wire z;
moore101_overlapping  mmon(d,clk,rst,z);
initial begin
clk=1'b0; d=1'b0; rst=1'b1;
end
initial #30 rst=1'b0;
always #6 clk=~clk;
always #7 d=~d;
initial
$monitor ($time, "clk=%b, d=%b, z=%b",clk,d,z);
endmodule
