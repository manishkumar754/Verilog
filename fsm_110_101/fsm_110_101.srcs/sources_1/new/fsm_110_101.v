`timescale 1ns / 1ps
// Manish Kumar
// Create Date: 19.04.2023 01:42:10
// Design Name: 
// Module Name: fsm_110_101
// Project Name: 

module fsm_110_101(d,rst,clk,z);
  input d,rst,clk;
  output z;
  parameter [2:0]
  A=0,//000
  B=1,//001
  C=2,//010
  D=3,//011
  E=4;//100
  reg[1:0] y;
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        y<=A;
      else case(y)
        A:
          if(d==1'b1)
            y<=B;
         else
           y<=A;
        B:
          if(d==1'b1)
            y<=C;
        else
          y<=D;
        C: 
          if(d==1'b1)
            y<=C;
        else
          y<=D;
        D:
          if(d==1'b1)
            y<=E;
        else
          y<=A;
        E:
         if(d==1'b1)
         y<=C;
        else
        y<=D;
        default:
          y<=A;
      endcase
    end
  assign z=((y==C&&d==1'b0)||(y==D&&d==1'b1)) ? 1'b1 :1'b0;
endmodule