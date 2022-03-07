`timescale 1ns / 1ps

module part_two(input_1, input_2, carry, select, out, ANODE, sum_b);

    input  [3:0] input_1;
    input  [3:0] input_2;
    input        carry;
    input        select;
    output [6:0] out;
    output [7:0] ANODE;
    output [4:0] sum_b;
    
    wire [4:0]   sum;
    wire [3:0]   num;
adder_top       A0(input_1, input_2, carry, sum[3:0], sum[4]);
binary_to_BCD   B0(sum, select, num);
seven_segment   S0(num, out);
    
    assign sum_b = {sum[4], sum[3:0]};
    assign ANODE = (select == 0) ? 8'b11111110:
                   (select == 1) ? 8'b11111101:
                   8'b11111111;

endmodule
