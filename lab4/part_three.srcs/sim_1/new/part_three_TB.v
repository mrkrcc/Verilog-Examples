`timescale 1ns / 1ps


module part_three_TB();

    reg        CLK_in;
    wire [7:0] ANODES;
    wire [6:0] HEX;

    parameter period = 50;
    
part_three UUT(CLK_in, ANODES, HEX);

initial 
begin
CLK_in = 1'b0;
end

always #period CLK_in = ~CLK_in;

initial 
begin
    

end


endmodule
