`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 18:20:32
// Design Name: 
// Module Name: delaybasicgate


module delaybasicgate(c,a,b);
input a,b;
output c;
wire c;
assign #10 c=a&&b;
endmodule
