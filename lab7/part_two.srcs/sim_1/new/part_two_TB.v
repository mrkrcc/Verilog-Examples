`timescale 1ns / 1ps

module part_two_TB();

    reg         CLK_in = 0;
    reg         input_W = 0;
    wire [1:0]  LED;
    
part_two UUT(CLK_in, input_W, LED);

always #50 CLK_in = ~CLK_in;

initial
begin
    #500
    input_W = 1;
    
    #300
    input_W = 0;
    
    #400
    input_W = 1;
    
    #400
    input_W = 0;
    
    #400
    input_W = 1;
end
endmodule
