`timescale 1ns / 1ps


module mod_10_counter_asynchronous(cout,clk1);
output wire [3:0]cout;
input clk1;
wire [3:0]t1;
wire [3:0]qbar1;
wire [1:0]reset1;
assign reset1[0]=~(cout[3]&& cout[1]);
assign t1[0]=1;
assign t1[1]=1;
assign t1[2]=1;
assign t1[3]=1;
TFF ff1(cout[0],qbar1[0],t1[0],clk1,reset1[0]);
TFF ff2(cout[1],qbar1[1],t1[1],qbar1[0],reset1[0]);
TFF ff3(cout[2],qbar1[2],t1[2],qbar1[1],reset1[0]);
TFF ff4(cout[3],qbar1[3],t1[3],qbar1[2],reset1[0]);
endmodule
module TFF(q,qbar,t,clk,reset);
output reg q;
output qbar;
input t,clk,reset;
assign qbar=~q;
initial
begin
q=0;
end
always @(posedge clk or negedge reset )
if (!reset)
begin
q<=1'b0;
end
else if (t==0)
begin
q<=q;

end
else
begin
q<=~q;
end
endmodule
