`timescale 1ns / 1ps

module adder(i_A, i_B, i_C, o_S, o_C);

    input   i_A ;
    input   i_B ;
    input   i_C ;
    output  o_S ;
    output  o_C ;
    
    assign o_S = i_A ^ i_B ^ i_C;
    assign o_C = (i_A & i_B) | (i_B & i_C) | (i_C & i_A);
    
    
endmodule
