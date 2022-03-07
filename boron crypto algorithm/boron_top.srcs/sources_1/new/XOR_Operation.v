`timescale 1ns / 1ps

module XOR_Operation(
    input  [63:0] XOR_Operation_in,
    output [63:0] XOR_Operation_out 
);


assign XOR_Operation_out[63:48]  = XOR_Operation_in[63:48] ^ XOR_Operation_in[47:32] ^ XOR_Operation_in[15:0];
assign XOR_Operation_out[47:32] = XOR_Operation_in[47:32] ^ XOR_Operation_in[15:0];
assign XOR_Operation_out[31:16] = XOR_Operation_in[63:48] ^ XOR_Operation_in[31:16];
assign XOR_Operation_out[15:0] = XOR_Operation_in[63:48] ^ XOR_Operation_in[31:16] ^ XOR_Operation_in[15:0];





endmodule