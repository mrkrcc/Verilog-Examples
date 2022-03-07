`timescale 1ns / 1ps


module part_five(i_U, i_V, i_W, i_X, i_S, o_HEX, o_AN, o_LEDR);

    input   [1:0]   i_U;
    input   [1:0]   i_V;
    input   [1:0]   i_W;
    input   [1:0]   i_X;
    input   [1:0]   i_S;
    output  [6:0]   o_HEX;
    output  [7:0]   o_AN;
    output  [9:0]   o_LEDR;
    
    wire [7:0] AN;
    wire [1:0] o_M;
    
    mux M0(i_U, i_V, i_W, i_X, i_S, o_M);
    seven_segment S_S0(o_M, o_HEX, o_AN);

    assign o_LEDR[1:0] = i_U;
    assign o_LEDR[3:2] = i_V;
    assign o_LEDR[5:4] = i_W;
    assign o_LEDR[7:6] = i_X;
    assign o_LEDR[9:8] = i_S;
    
endmodule
