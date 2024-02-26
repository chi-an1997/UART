`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/23 16:15:07
// Design Name: 
// Module Name: uart_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_top_tb();
reg clk;
reg rstn;
reg[8-1:0] din;
reg in_valid;
wire [8-1:0] dout;

uart_top uart_top(
    .clk(clk),
    .rstn(rstn),
    .din(din),
    .in_valid(in_valid),
    .dout(dout)
);

initial begin
    clk=0;
    rstn=0;
    in_valid=0;
    #10
    rstn=1;
    #10
    rstn=0;
    #10
    in_valid=1;
    din= 8'd165;
end
always #10 clk=~clk;
endmodule
