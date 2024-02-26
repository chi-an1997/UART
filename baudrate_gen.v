`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/21 16:46:25
// Design Name: 
// Module Name: baudrate_gen
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


module baudrate_gen(
    input clk,
    input rstn,
    input tx_clk_en,
    input rx_clk_en,
    output reg tx_clk,
    output reg rx_clk
    );

    parameter BR9600 = 5207,
              BR19200 = 2603,
              BR38400 = 1301,
              BR57600 = 867,
              BR115200 = 433;
    parameter BR_SELECT = BR115200;

    reg[12:0] tx_cnt;
    reg[12:0] rx_cnt;

// tx clk
    always@(posedge clk) begin
        if(rstn) begin
            tx_cnt <= 13'd0;
            tx_clk = 0;
        end
        else if (tx_clk_en) begin
            if (tx_cnt==BR_SELECT>>1) begin
                tx_cnt <= 13'd0;
                tx_clk = ~tx_clk;
            end
            else 
                tx_cnt <= tx_cnt+1;
        end
        else
            tx_cnt <= 13'd0;
    end

// rx clk
    always@(posedge clk) begin
        if(rstn) begin
            rx_cnt <= 13'd0;
            rx_clk = 0;
        end
        else if (rx_clk_en) begin
            if (rx_cnt==BR_SELECT>>1) begin
                rx_cnt <= 13'd0;
                rx_clk = ~rx_clk;
            end
            else 
                rx_cnt <= rx_cnt+1;
        end
        else
            rx_cnt <= 13'd0;
    end
endmodule
