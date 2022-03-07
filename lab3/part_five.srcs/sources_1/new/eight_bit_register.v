`timescale 1ns / 1ps
module eight_bit_register(input_1, RST, CLK, out);
    
    input  [7:0] input_1;
    input        RST;
    input        CLK;
    output [7:0] out;
    
    wire [7:0] input_A;
    
        D_ff D7(input_1[7], RST, CLK, input_A[7]); 
        D_ff D6(input_1[6], RST, CLK, input_A[6]); 
        D_ff D5(input_1[5], RST, CLK, input_A[5]); 
        D_ff D4(input_1[4], RST, CLK, input_A[4]); 
        D_ff D3(input_1[3], RST, CLK, input_A[3]); 
        D_ff D2(input_1[2], RST, CLK, input_A[2]); 
        D_ff D1(input_1[1], RST, CLK, input_A[1]); 
        D_ff D0(input_1[0], RST, CLK, input_A[0]);
        
     assign out = input_A;
endmodule
