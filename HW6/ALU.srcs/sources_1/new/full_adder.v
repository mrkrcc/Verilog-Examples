`timescale 1ns / 1ps

module full_adder(
    input  input_A, 
    input  input_B, 
    input  in_Carry, 
    output Sum, 
    output Carry
);



    assign Sum = input_A ^ input_B ^ in_Carry;
    assign Carry = (input_A & input_B) | (input_B & in_Carry) | (in_Carry & input_A);


endmodule