`timescale 1ns / 1ps

module part_one_TB();

    reg    ENABLE;
    reg    CLK;
    reg    CLR;
    reg    CLK_in;
    wire   ANODE;
    wire  [6:0] out;
    
part_one UUT (ENABLE, CLK, CLK_in, CLR, ANODE, out);
parameter period = 50;
initial
begin
 CLK = 1'b0;
 CLR = 1'b1;
end

always #period CLK = ~CLK;

initial 
begin
    
    #(4*period);
    
    ENABLE = 1'b0;
    #(4*period);
    
    ENABLE = 1'b1;
    #(4*period);
    
    CLR = 1'b0;
    #(4*period);
    
    ENABLE = 1'b0;
    #(period);
    
    
    CLR = 1'b1;
    #(4*period);
    
    ENABLE = 1'b1;
    #(4*period);
    
    //ENABLE = 1'b0;
    
    
end
endmodule
