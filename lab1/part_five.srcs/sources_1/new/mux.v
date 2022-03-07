`timescale 1ns / 1ps


module mux(i_U, i_V, i_W, i_X, i_S, o_M );

    input   [1:0]   i_U;
    input   [1:0]   i_V;
    input   [1:0]   i_W;
    input   [1:0]   i_X;
    input   [1:0]   i_S;
    output  [1:0]   o_M; 
   
    assign  o_M  =  ( i_S == 2'b00) ? i_U  :
                    ( i_S == 2'b01) ? i_V  :
                    ( i_S == 2'b10) ? i_W  :
                    ( i_S == 2'b11) ? i_X  :
                    2'b00;
endmodule
