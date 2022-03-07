`timescale 1ns / 1ps


module part_two(CLK_in, RST, ANODE, out);

    input        CLK_in;
    input        RST;
    output [7:0] ANODE;
    output [6:0] out;
    
    wire ENABLE;
    wire ENABLE_two;
    wire ENABLE_out;
    wire        CLK_out;
    wire        CLK_out_two;
    wire [3:0]  num;
    wire [3:0]  num_two;
    wire [3:0]  num_thr;
    wire [3:0]  out_2;
    wire [1:0]  cnt;


clock_divider   CD(CLK_in, CLK_out);
n_bit_counter   NC(CLK_out, RST, ENABLE, num);
n_bit_counter   NC1(ENABLE, RST, ENABLE_two, num_two);
n_bit_counter   NC2(ENABLE_two, RST, ENABLE_out, num_thr);
clock_divider   CD1(CLK_in, CLK_out_two);
    defparam CD1.divisor = 28'd200000;

counter         NC3(CLK_out_two, cnt);
anode_cntrl     AC(cnt, ANODE);
decoder         D(ANODE, num, num_two, num_thr, out_2);
seven_segment   SS(out_2, out);

endmodule
