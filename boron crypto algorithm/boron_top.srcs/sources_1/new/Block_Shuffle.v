`timescale 1ns / 1ps

module Block_Shuffle(
    input  [63:0] Block_Shuffle_in,
    output [63:0] Block_Shuffle_out
);



assign  Block_Shuffle_out[15:0]  = {Block_Shuffle_in[7:0] , Block_Shuffle_in[15:8]};
assign  Block_Shuffle_out[31:16] = {Block_Shuffle_in[23:16], Block_Shuffle_in[31:24]};
assign  Block_Shuffle_out[47:32] = {Block_Shuffle_in[39:32], Block_Shuffle_in[47:40]};
assign  Block_Shuffle_out[63:48] = {Block_Shuffle_in[55:48], Block_Shuffle_in[63:56]};





endmodule
