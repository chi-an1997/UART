`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/22 14:46:01
// Design Name: 
// Module Name: uart_rx
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


module uart_rx(
    input clk,
    input rstn,
    input start,
    input din,
    output reg rx_clk_en,
    output reg done,
    output reg [8-1:0] dout
    );

    reg [8-1:0] data_out;
    reg [4-1:0] R_state;
    reg [8-1:0] data_in;
    //assign dout= {data_out[0], data_out[1], data_out[2], data_out[3], data_out[4], data_out[5], data_out[6], data_out[7]};

always@(posedge clk) begin
    case (R_state)

    4'd0 : begin // check strat bit
        if (din==0)begin
            R_state <= R_state + 1;
           data_in <= din;
        end
    end

    4'd1 : begin
        data_out[0] <= din;
        done <= 0;
        R_state <= R_state + 1;
    end

    4'd2 : begin
        data_out[1] <= din;
        done <= 0;
        R_state <= R_state + 1;
    end

    4'd3 : begin
        data_out[2] <= din;
        done <= 0;
        R_state <= R_state + 1;
    end

    4'd4 : begin
        data_out[3] <= din;
        done <= 0;
        R_state <= R_state + 1;
    end

    4'd5 : begin
        data_out[4] <= din;
        done <= 0;
        R_state <= R_state + 1;
    end

    4'd6 : begin
        data_out[5] <= din;
        done <= 0;
        R_state <= R_state + 1;
    end

    4'd7 : begin
        data_out[6] <= din;
        done <= 0;
        R_state <= R_state + 1;
    end

    4'd8 : begin
        data_out[7] <= din;
        done <= 0;
        R_state <= R_state + 1;
    end

    4'd9 : begin // stop bit
        dout <= data_out;
        done <= 1;
        R_state <= 4'd0;
    end

    default : R_state <= 4'd0;
    endcase
end
endmodule
