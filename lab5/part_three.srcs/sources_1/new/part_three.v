`timescale 1ns / 1ps


module part_three(
    input        CLK_in,
    input        RST,
    input        STOP,
    input        preset,
    input  [7:0] input_A,
    output [7:0] ANODE,
    output [6:0] out
);
    wire        SW_d;
    wire        ENABLE;
    wire        ENABLE_two;
    wire        ENABLE_thr;
    wire        ENABLE_four;
    wire        ENABLE_fiv;
    wire        ENABLE_out;
    wire        CLK_out;
    wire        CLK_out_two;
    wire        CLK_out_thr;
    wire [3:0]  num;
    wire [3:0]  num_two;
    wire [3:0]  num_thr;
    wire [3:0]  num_four;
    wire [3:0]  num_fiv;
    wire [3:0]  num_six;
    wire [3:0]  out_2;
    wire [2:0]  cnt;
    wire        preset_na = 0;


clock_divider   CD(CLK_in, CLK_out);
clock_divider   CD1(CLK_in, CLK_out_two);
    defparam CD1.divisor = 28'd1000000; 
n_bit_counter   NC(CLK_out_two, RST, preset_na, SW_d, STOP, ENABLE, num); // hundredths of a second HEX0
n_bit_counter   NC1(ENABLE, RST, preset_na, SW_d, STOP,  ENABLE_two, num_two); //hundredths of a second HEX1
n_bit_counter   NC2(ENABLE_two, RST, preset_na, SW_d, STOP, ENABLE_thr, num_thr); //seconds HEX2
n_bit_counter   NC3(ENABLE_thr, RST,  preset_na, SW_d, STOP, ENABLE_four, num_four); // seconds HEX3
    defparam NC3.k = 6;
n_bit_counter   NC4(ENABLE_four, RST, preset, input_A[3:0], STOP, ENABLE_fiv, num_fiv); // minutes HEX4
n_bit_counter   NC5(ENABLE_fiv, RST, preset, input_A[7:4], STOP, ENABLE_out, num_six); // minutes HEX5
clock_divider   CD2(CLK_in, CLK_out_thr);
    defparam CD2.divisor = 28'd200000;

counter         NC6(CLK_out_thr, cnt);
anode_cntrl     AC(cnt, ANODE);
decoder         D(ANODE, num, num_two, num_thr, num_four, num_fiv, num_six, out_2);
seven_segment   SS(out_2, out);

endmodule