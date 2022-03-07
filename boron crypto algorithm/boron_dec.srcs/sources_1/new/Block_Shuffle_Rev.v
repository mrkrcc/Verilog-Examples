`timescale 1ns / 1ps

module Block_Shuffle_Rev(
    input  [63:0] BS_in,
    output [63:0] BS_out
);


assign BS_out[15:0]  = {BS_in[7:0], BS_in[15:8]};
assign BS_out[31:16] = {BS_in[23:16], BS_in[31:24]};
assign BS_out[47:32] = {BS_in[39:32], BS_in[47:40]};
assign BS_out[63:48] = {BS_in[55:48], BS_in[63:56]};



endmodule