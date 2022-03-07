`timescale 1ns / 1ps

module XOR_Operation_Rev(
    input  [63:0] XOR_in,
    output [63:0] XOR_out
);

assign XOR_out[15:0]  = XOR_in[15:0] ^ XOR_in[31:16];
assign XOR_out[31:16] = XOR_in[31:16] ^ XOR_in[63:48] ^ XOR_in[47:32];
assign XOR_out[47:32] = XOR_in[15:0] ^ XOR_in[31:16] ^ XOR_in[47:32];
assign XOR_out[63:48] = XOR_in[47:32] ^ XOR_in[63:48];  




endmodule
