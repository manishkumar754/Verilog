`timescale 1ns / 1ps


module mod_10_counter_asynchronous_tb();
reg clk1;
reg reset1[1:0];
wire [3:0] cout;
mod_10_counter_asynchronous sc1(cout,clk1);
initial
begin

#5 clk1=0;

end
always #5 clk1=~clk1;
initial $monitor ($time, " clk1=%b, cout=%b, ",clk1,cout);
initial #205 $stop;
endmodule
