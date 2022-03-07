`timescale 1ns / 1ps

module Round_Permutation(
    input  [63:0] Round_Permutation_in,
    output [63:0] Round_Permutation_out
);


assign Round_Permutation_out[15:0]  = {Round_Permutation_in[14:0], Round_Permutation_in[15]};
assign Round_Permutation_out[31:16] = {Round_Permutation_in[27:16], Round_Permutation_in[31:28]};
assign Round_Permutation_out[47:32] = {Round_Permutation_in[40:32], Round_Permutation_in[47:41]};
assign Round_Permutation_out[63:48] = {Round_Permutation_in[54:48], Round_Permutation_in[63:55]};


endmodule
