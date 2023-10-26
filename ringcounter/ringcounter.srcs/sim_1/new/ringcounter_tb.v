`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2023 22:17:01
// Design Name: 
// Module Name: ringcounter_tb

module ringcounter_tb();
reg clk,clr;
wire [3:0] q;

ringcounter RR(q,clk,clr);
initial
begin
$display("time,\t clk,\t clr,\t q");
$monitor("%g,\t %b,\t %b,\t %b",$time,clk,clr,q);
clr = 1'b0;
#50 clr = 1'b1;
#100 clr = 1'b0;
end
always
    begin
    #50 clk = 1'b1;
    #50 clk = 1'b0;
    end
    
endmodule
