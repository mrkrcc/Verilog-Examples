`timescale 1ns / 1ps

module Add_round_key(
    input  [63:0] input_text,
    input  [63:0] input_key,
    output [63:0] xor_text
);

assign xor_text = input_text ^ input_key;

endmodule