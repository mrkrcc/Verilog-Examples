`timescale 1ns / 1ps

module top_adder(i_A, i_B, i_C, o_S, o_C);

    input   [7:0] i_A ;
    input   [7:0] i_B ;
    input         i_C ;
    output  [7:0] o_S ;
    output        o_C ;
    
    wire    [6:0] w_C ;
    
    assign i_C = 1'b0;


adder A0(i_A[0], i_B[0], i_C, o_S[0], w_C[0]);
adder A1(i_A[1], i_B[1], w_C[0], o_S[1], w_C[1]); 
adder A2(i_A[2], i_B[2], w_C[1], o_S[2], w_C[2]);
adder A3(i_A[3], i_B[3], w_C[2], o_S[3], w_C[3]);
adder A4(i_A[4], i_B[4], w_C[3], o_S[4], w_C[4]);
adder A5(i_A[5], i_B[5], w_C[4], o_S[5], w_C[5]);
adder A6(i_A[6], i_B[6], w_C[5], o_S[6], w_C[6]);
adder A7(i_A[7], i_B[7], w_C[6], o_S[7], o_C);



endmodule
