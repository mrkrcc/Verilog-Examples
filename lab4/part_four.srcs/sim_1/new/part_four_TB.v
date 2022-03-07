`timescale 1ns / 1ps


module part_four_TB();

    reg        CLK_in;
    wire [7:0] ANODE; 
    wire [6:0] out;
    
parameter period = 100;
part_four UUT(CLK_in, ANODE, out);

initial
begin
    CLK_in = 0;
end

always #period CLK_in = ~CLK_in;

endmodule
