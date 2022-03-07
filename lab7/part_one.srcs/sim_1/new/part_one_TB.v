`timescale 1ns / 1ps


module part_one_TB();

    reg         CLK_in = 0;
    reg         RST = 1;
    reg         input_W = 0;
    wire  [8:0] LED;
    wire        LED9;

part_one UUT(CLK_in, RST, input_W, LED, LED9);
always #100 CLK_in = ~CLK_in;

initial
begin
    #200
    RST = 0;
    #100
    RST = 1;
    
    input_W = 1;
    #1200;
    
    input_W = 0;
    
    #600
    
    input_W = 1;
    
    #1000;
    
    input_W = 0;
    
    #1200;
    
end

endmodule
