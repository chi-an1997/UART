`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/23 09:23:20
// Design Name: 
// Module Name: uart_top
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


module uart_top(
    input clk,
    input rstn,
    input[8-1:0] din,
    input in_valid,
    output[8-1:0] dout
    );

    wire tx_done;
    wire rx_done;
    wire tx_clk;
    wire rx_clk;
    wire data_out;
    wire busy;
    wire[8-1:0] rx_dout;

baudrate_gen baudrate_gen(
    .clk(clk),
    .rstn(rstn),
    .tx_clk_en(1),
    .rx_clk_en(1),
    .tx_clk(tx_clk),
    .rx_clk(rx_clk)
);

uart_tx uart_tx(
    .clk(tx_clk),
    .rstn(rstn),
    .start(in_valid), // ?��?��輸入
    .data_in(din),
    .data_out(data_out),
    .done(tx_done),
    .busy(busy)
    );

uart_rx uart_rx(
    .clk(tx_clk),
    .rstn(rstn),
    .start(start),
    .din(data_out),
    .rx_clk_en(),
    .done(rx_done),
    .dout(dout)
    //.dout(rx_dout)
);

endmodule
