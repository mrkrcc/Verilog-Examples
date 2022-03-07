`timescale 1ns / 1ps

module part_one(
    input           CLK_in,
    input  [1:0]    KEY,
    input  [7:0]    input_1,
    output reg      carry ,
    output reg      overflow ,
    output [7:0]    LED,
    output [7:0]    ANODE,
    output [6:0]    out
);

    wire   [7:0]    num_1 ;
    wire   [7:0]    num_2  ;
    wire   [8:0]    sum ;
    wire            CLK_out;
    wire   [3:0]    out_2;
    wire   [1:0]    cnt;

register R1(input_1, KEY[0], KEY[1], num_1);
register R2(sum[7:0], KEY[0], KEY[1], num_2);
adder    A(KEY[1], num_1, num_2, sum);


clock_divider   CD1(CLK_in, CLK_out);
counter         NC3(CLK_out, cnt);
anode_cntrl     AC(cnt, ANODE);
decoder         D(ANODE, sum, input_1, out_2);
seven_segment   SS(out_2, out);
    assign LED = sum[7:0];

always@(posedge KEY[1])
begin
    if(sum[8])
        begin
        carry <= sum[8];
        overflow <= sum[8];
        end
    else
    begin
        carry <= 0;
        overflow <= 0;
    end    
end
endmodule