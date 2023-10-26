`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2023 16:35:22
// Design Name: 
// Module Name: pipelineAlu_clk2_tb
// Project Name: 


module pipelineAlu_clk2_tb();
reg [3:0] rs1,rs2,rd,func;
reg [7:0] addr;
reg clk1,clk2;
wire [15:0] z;
integer k;

pipelineAlu_clk2 ALUU(z,rs1,rs2, rd, func, addr, clk1, clk2);
initial
    begin
        clk1 = 0; clk2 = 0;
        repeat (20)
            begin
                #5 clk1 = 1; #5 clk1 = 0;
                #5 clk2 = 1; #5 clk2 = 0;
            end
    end
    
initial 
    for (k=0; k<16; k=k+1)
    ALUU.regbank[k] = k;    
    
    initial
        begin
            #5 rs1 =3; rs2= 5; rd= 10; func= 0; addr= 125;         //ADD
            #20 rs1 =3; rs2= 8; rd= 12; func= 2; addr= 126;          //MUL
            #20 rs1 =10; rs2= 5; rd= 14; func= 1; addr= 127;         //SUB
            #20 rs1 =7; rs2= 3; rd= 13; func= 11; addr= 128;        // SLA
            #20 rs1 =10; rs2= 5; rd= 15; func= 1; addr= 129;     //SUB
            #20 rs1=12; rs2= 13; rd= 16; func= 0; addr= 130;            //ADD    
            
            #60  for (k=125; k<131; k=k+1)
            $display ("Mem[%3d] = %3d", k, ALUU.mem[k]);
        end
     initial
        begin
            $monitor ("Time: %3d, F = %3d", $time, z);
            #300 $finish;
        end                        
endmodule
