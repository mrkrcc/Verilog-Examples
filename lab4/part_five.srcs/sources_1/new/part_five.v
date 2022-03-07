`timescale 1ns / 1ps

module part_five(CLK_in, ANODE, out);

    input        CLK_in;
    output [7:0] ANODE; 
    output [6:0] out;


    wire        CLK_out;
    wire [2:0]  cnt;
    wire        CLK_out_second;
    wire [2:0]  cnt_2;
    wire [3:0]  num;

clock_divider       C0(CLK_in,CLK_out_second);
    defparam        C0.divisor = 28'd100000000;

clock_divider       CD(CLK_in, CLK_out);
counter             CT(CLK_out, cnt); //anodes
counter             CT1(CLK_out_second, cnt_2);//rotation

anode_cntrl         AC(cnt, ANODE);
decoder             D0(ANODE, cnt_2, num);
seven_segment       S0(num, out);

endmodule
