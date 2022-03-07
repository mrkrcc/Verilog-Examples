`timescale 1ns / 1ps


module part_four(
    input       CLK_in,
    input [1:0] KEY,
    input [2:0] SW,
    output      LED
);

    wire        CLK_out_0_5;
    wire [10:0] dec_out;
    wire        STORE;

clock_divider CD0(CLK_in, CLK_out_0_5);


shifter       SHF(CLK_out_0_5, KEY[0], STORE, KEY[1], dec_out, LED);
decoder       DEC(SW, dec_out);
counter       CNT(CLK_out_0_5, KEY[0], STORE);

endmodule