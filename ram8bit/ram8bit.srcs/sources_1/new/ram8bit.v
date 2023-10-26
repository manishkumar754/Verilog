`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2023 09:31:52
// Design Name: 
// Module Name: ram8bit
// Project Name: 

module ram8bit(
input clk,
input [7:0] data_in,
input [5:0] addr_ram,
input wr_e,
input cs,
output [7:0] data_out  
    );
    
reg [7:0] ram_memory[31:0];
reg [5:0] addr_register;

always @(posedge clk)
begin
if(wr_e & cs)
    ram_memory[addr_ram] <= data_in;
else
    addr_register <= addr_ram;
end

assign data_out = ram_memory[addr_register];
    
endmodule
