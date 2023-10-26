`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2023 10:21:03
// Design Name: 
// Module Name: ram8bit_tb
// Project Name: 

module ram8bit_tb;
reg clk;
reg [7:0] data_in;
reg [5:0] addr_ram;
reg wr_e;
reg cs;
wire [7:0] data_out;

ram8bit 8RAM(data_in, clk, addr_ram,wr_e,cs,data_out);

endmodule
