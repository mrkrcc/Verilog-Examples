`timescale 1ns / 1ps

module part_two(
    input         CLK_in,
    input [4:0]   Address,
    input [3:0]   DataIn,
    input         write,
    input         CLK,
    output  [7:0] ANODE,
    output  [6:0] out
);
    reg             ENABLE = 1;
    wire   [3:0]    Dataout;
    wire            CLK_out;
    wire   [3:0]    out_2;
    wire   [1:0]    cnt;
    
blk_mem_gen_0 BRAM(CLK, ENABLE, write, Address, DataIn, Dataout);


clock_divider   CD1(CLK_in, CLK_out);
counter         NC3(CLK_out, cnt);
anode_cntrl     AC(cnt, ANODE);
decoder         D(ANODE, DataIn, Address, Dataout, out_2);
seven_segment   SS(out_2, out);


endmodule