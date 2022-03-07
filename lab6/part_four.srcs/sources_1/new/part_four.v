`timescale 1ns / 1ps

module part_four(input_1, CLK_in, RST, STORE_A, STORE_B, ANODE, out, LED);

parameter N = 8;
    input [N-1:0] input_1;
    input         CLK_in;
    input         RST;
    input         STORE_A;
    input         STORE_B;
    output  [7:0] ANODE;
    output  [6:0] out;
    output reg [7:0] LED;

    wire  [N-1:0]   A;
    wire  [N-1:0]   B;
    wire            START;
    wire  [2*N-1:0] num;
    wire  [2*N-1:0] num_2;

    wire            CLK_out;
    wire   [3:0]    out_2;
    wire   [1:0]    cnt;

assign  START = STORE_A & STORE_B;

register  R1(input_1, RST, STORE_A, A);
register  R2(input_1, RST, STORE_B, B);

always@(*)
begin
    if(STORE_A & !STORE_B)
        LED <= A;
    else if(!STORE_A & STORE_B)
        LED <= B;
    else
        LED <= 8'd0;
end

multiplier M(A, B, RST, CLK_in, START, num);
    defparam M.N = 8;

register R3(num, RST, CLK_in, num_2);
    defparam R3.N = 16;

clock_divider   CD1(CLK_in, CLK_out);
counter         NC3(CLK_out, cnt);
anode_cntrl     AC(cnt, ANODE);
decoder         D(ANODE, num_2, out_2);
seven_segment   SS(out_2, out);

endmodule