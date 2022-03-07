`timescale 1ns / 1ps

module adder_top(i_A, i_B, i_C, o_S, o_C);

    input   [3:0] i_A ;
    input   [3:0] i_B ;
    input         i_C ;
    output  [3:0] o_S ;
    output        o_C ;
    wire    [2:0] w_C ;



adder A0(i_A[0], i_B[0], i_C, o_S[0], w_C[0]);

adder A1(i_A[1], i_B[1], w_C[0], o_S[1], w_C[1]); 

adder A2(i_A[2], i_B[2], w_C[1], o_S[2], w_C[2]);

adder A3(i_A[3], i_B[3], w_C[2], o_S[3], o_C);


endmodule
