`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2023 16:00:45
// Design Name: 
// Module Name: pipelineAlu_clk2
// Project Name: 

module pipelineAlu_clk2(out, rs1,rs2,rd, func, addr, clk1, clk2);
input [3:0] rs1,rs2,rd,func;
input [7:0] addr;
input clk1, clk2;
output [15:0] out;

reg [15:0] L12_A, L12_B, L23_z, L34_z;
reg [3:0] L12_rd, L12_func, L23_rd;
reg [7:0] L12_addr, L23_addr, L34_addr;

reg [15:0] regbank [0:15];  //Register Bank
reg [15:0] mem[0:255];       // 256 x 16 memory

assign out = L34_z;

always @(posedge clk1)
    begin     // STAGE 1
        L12_A   <=  #2 regbank[rs1];
        L12_B   <=  #2 regbank[rs2];
        L12_rd  <=  #2 rd;
        L12_func <= #2 func;
        L12_addr <= #2 addr;
    end
    
always @(negedge clk2)
    begin    //STAGE 2
        case (func)
        0: L23_z  <=  #2 L12_A + L12_B;
        1: L23_z  <=  #2 L12_A - L12_B;
        2: L23_z  <=  #2 L12_A * L12_B;
        3: L23_z  <=  #2 L12_A;
        4: L23_z  <=  #2 L12_B;
        5: L23_z  <=  #2 L12_A & L12_B;
        6: L23_z  <=  #2 L12_A | L12_B;
        7: L23_z  <=  #2 L12_A ^ L12_B;
        8: L23_z  <=  #2 ~L12_A;
        9: L23_z  <=  #2 ~L12_B;
        10: L23_z  <=  #2 L12_A >>1;
        11: L23_z  <=  #2 L12_A <<1;
        endcase
        L23_rd <= #2 L12_rd;
        L23_addr <= #2 L12_addr;
    end
    
always @(posedge clk1)
    begin   //STAGE 3
        regbank[L23_rd] <= #2 L23_z;
        L34_z           <= #2 L23_z;
        L34_addr        <= #2 L23_addr;
        end
        
 
always@(negedge clk2)
    begin   //STAGE 4
        mem[L34_addr] <= #2 L34_z;
    end      
    
endmodule
