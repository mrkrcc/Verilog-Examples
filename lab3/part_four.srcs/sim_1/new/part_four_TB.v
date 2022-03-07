`timescale 1ns / 1ps

module part_four_TB();

    reg D;
    reg CLK;
    wire Q_latch;
    wire Q_rising;
    wire Q_falling;
    
part_four UUT(D, CLK, Q_latch, Q_rising, Q_falling);

initial 
begin
    CLK = 1'b0;
end
parameter period = 50;
always #period CLK = ~CLK;

initial 
begin
       D = 1'b0;
       #(3*period);
       
       D = 1'b1;
       #(2*period);
       
       D = 1'b0;
       #(6*period);
       
       D = 1'b1;
       #period; 
       
       D = 1'b0;
       #(1.3*period);
       
       D = 1'b1;
       #(0.9*period);
       
       D = 1'b0;
       
       
end


endmodule
