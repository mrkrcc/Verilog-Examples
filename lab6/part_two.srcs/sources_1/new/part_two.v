`timescale 1ns / 1ps

module part_two(
    input           CLK_in,
    input  [1:0]    KEY,
    input  [7:0]    input_1,
    input           SEL,
    output          carry ,
    output          overflow ,
    output [7:0]    LED,
    output [7:0]    ANODE,
    output [6:0]    out
);

    wire   [7:0]    num_1 ;
    wire   [7:0]    num_2  ;
    reg    [8:0]     sum ;
    wire            CLK_out;
    wire   [3:0]    out_2;
    wire   [1:0]    cnt;
 
    

//register R1(input_1, KEY[0], KEY[1], num_1);
//register R2(sum[7:0], KEY[0], KEY[1], num_2);
//add_subtract    A(num_1, num_2, SEL, sum);



always@(posedge KEY[1])
begin
    if (KEY[0] == 0) begin
        sum = 0;
    end
    else begin
        if(SEL == 1)
        begin
              sum <= sum + input_1;
        end
        else
        begin
              sum <= sum - input_1;
        end
    
    end
end


clock_divider   CD1(CLK_in, CLK_out);
counter         NC3(CLK_out, cnt);
anode_cntrl     AC(cnt, ANODE);
decoder         D(ANODE, sum, input_1, out_2);
seven_segment   SS(out_2, out);

    assign LED = sum[7:0];

    assign carry = sum[8];
    assign overflow = sum[8];

endmodule