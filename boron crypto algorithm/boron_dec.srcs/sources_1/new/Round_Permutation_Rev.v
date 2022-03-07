`timescale 1ns / 1ps

module Round_Permutation_Rev(
    input  [63:0] RP_in,
    output [63:0] RP_out
);


assign RP_out[15:0]  = {RP_in[0], RP_in[15:1]};
assign RP_out[31:16] = {RP_in[19:16], RP_in[31:20]};
assign RP_out[47:32] = {RP_in[38:32], RP_in[47:39]};
assign RP_out[63:48] = {RP_in[56:48], RP_in[63:57]};





endmodule