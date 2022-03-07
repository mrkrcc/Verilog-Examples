`timescale 1ns / 1ps

module part_two_TB();

    reg Clk; 
    reg D; 
    wire Q;

part_two UUT(Clk, D, Q);

parameter period = 50;

initial
begin
    Clk = 1'b0;
end

    always #period Clk = ~Clk;

initial
begin
    D = 1'b0;
    #period;
    
    D = 1'b1;
    #period;
    
    D = 1'b0;
    #(2*period);
    
    D = 1'b1;
    #(2*period);
    
    D = 1'b0;
    #(1.5*period);
    
    D = 1'b1;
    #(0.33*period);
    
    D = 1'b0;
    #(0.25*period);
    
    D = 1'b1;
    #(0.25*period);
    
    D = 1'b0;
    #(4*period);
    
    D = 1'b1;
    
end
endmodule
