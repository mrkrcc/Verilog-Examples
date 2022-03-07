`timescale 1ns / 1ps


module part_two_TB();

    reg        CLK_in;
    reg        RST;
    wire [7:0] ANODE;
    wire [6:0] out;

part_two UUT(CLK_in, RST, ANODE, out);
parameter period = 10;
initial
begin
    CLK_in = 0;
    RST = 1;
end
always #period CLK_in = ~CLK_in;


initial begin
    #(2*period)
    RST = 0;
    #period
    RST = 1;
end

endmodule
