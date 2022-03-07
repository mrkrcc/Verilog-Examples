`timescale 1ns / 1ps

module part_three_TB();

    reg   D;
    reg   CLK;
    wire  Q;
    
    
part_three UUT(D, CLK, Q);
parameter period = 50;

initial 
begin
    CLK = 0;
end
always #period CLK = ~CLK;

initial 
begin
    D = 1'b0;
    #(2*period);
    
    D = 1'b1;
    #(0.75*period);
    
    D = 1'b0;
    #(0.15*period);
    
    D = 1'b1;
    #(2*period);
    
    D = 1'b0;
    #(0.9*period);
    
    D = 1'b1;
    #(0.15*period);
    
    
    
end
    
endmodule
