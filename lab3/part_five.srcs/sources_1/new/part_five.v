`timescale 1ns / 1ps

module part_five(input_1 ,RST, CLK, CLK_in, ANODE, out);
    

    input  [7:0] input_1;
    input        RST;
    input        CLK;
    input        CLK_in;    
    output [7:0] ANODE;
    output [6:0] out;
    
    wire [7:0] input_A;
    wire [8:0] sum ;
    wire [3:0] num;
    wire       deneme;
    wire       deneme_2;
    wire       C;
    //wire [7:0] ANODES;
    wire [2:0] cnt;
    wire       CLK_out;
    assign C = 1'b0;
    

//deneme              DM(input_1, RST, CLK, input_A);

eight_bit_register  R0(input_1, RST, CLK, input_A);     
top_adder           TA(input_A, input_1, C, sum[7:0], sum[8]);
clock_divider       CD(CLK_in, CLK_out);
counter             CT(CLK_out, cnt);
anode_cntrl         AC(cnt, ANODE);

decoder             D0(ANODE, input_1, input_A, sum[7:0], num);
seven_segment       SS(num, out);

endmodule
