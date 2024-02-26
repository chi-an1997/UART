`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/22 10:43:57
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input clk, 
    input rstn,
    input start,
    input [8-1:0] data_in,
    output reg data_out,
    output reg done,
    output reg busy
    );

    reg [4-1:0] R_state;
    reg [8-1:0] input_data;

    always@(posedge clk) begin
        case(R_state)

        4'd0 : begin
            data_out <= 1;
            done <= 0;
            busy <= 0;
            if (start) begin
                input_data <= data_in;
                R_state <= R_state+1;
            end
        end

        4'd1 : begin // strat bit
            data_out <= 0;
            done <= 0;
            busy <= 1;
            R_state <= R_state+1;
        end

        4'd2 : begin
            data_out <= input_data[0];
            done <= 0;
            R_state <= R_state+1;
        end

        4'd3 : begin
            data_out <= input_data[1];
            done <= 0;
            R_state <= R_state+1;
        end

        4'd4 : begin
            data_out <= input_data[2];
            done <= 0;
            R_state <= R_state+1;
        end

        4'd5 : begin
            data_out <= input_data[3];
            done <= 0;
            R_state <= R_state+1;
        end

        4'd6 : begin
            data_out <= input_data[4];
            done <= 0;
            R_state <= R_state+1;
        end

        4'd7 : begin
            data_out <= input_data[5];
            done <= 0;
            R_state <= R_state+1;
        end

        4'd8 : begin
            data_out <= input_data[6];
            done <= 0;
            R_state <= R_state+1;
        end

        4'd9 : begin
            data_out <= input_data[7];
            done <= 0;
            R_state <= R_state+1;
        end

        4'd10 : begin
            data_out <= 1;
            done <= 1;
            R_state <= 4'd0;
        end
        default : begin
            R_state <= 4'd0;

        end
        endcase
    end
endmodule
