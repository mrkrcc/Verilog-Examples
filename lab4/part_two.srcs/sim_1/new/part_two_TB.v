`timescale 1ns / 1ps

module part_two_TB();

    reg        CLK;
    reg        CLR;
    reg        CLK_in;
    wire [7:0] ANODE;
    wire [6:0] out;
    
    
part_two UUT (CLK_in, CLK, CLR, ANODE, out);

parameter period = 50;
initial
begin
CLK = 1'b0;
end
initial
begin
    
    CLR = 1'b0;
    #(2*period);
    
    CLR = 1'b1;

end

always #period CLK = ~CLK;

endmodule
