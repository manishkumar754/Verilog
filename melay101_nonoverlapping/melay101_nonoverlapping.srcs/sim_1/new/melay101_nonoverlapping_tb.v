`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2023 17:15:50
// Design Name: 
// Module Name: melay101_nonoverlapping_tb
// Project Name: 
module melay101_nonoverlapping_tb();
reg d,clk,rst;
wire z;
melay101_nonoverlapping  melayyy(d,clk,rst,z);
initial begin
clk=1'b0; d=1'b0; rst=1'b1;
end
initial #30 rst= 1'b0;
always #7 clk=~clk;
always #9 d=~d;
initial 
$monitor ($time, "clk=%b, d=%b, z=%b", clk,d,z);
endmodule
