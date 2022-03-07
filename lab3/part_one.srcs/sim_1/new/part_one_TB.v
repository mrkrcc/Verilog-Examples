`timescale 1ns / 1ps

module part_one_TB();

    reg Clk;
    reg R; 
    reg S;
    wire Q;
 

part_one UUT(Clk, R, S, Q);

parameter period = 50;


initial
begin
        Clk = 1'b1;
end
        always #period Clk = ~Clk ;
 initial
 begin
 
    R = 1'b1;
    S = 1'b0;
    #period;
    
    R = 1'b0;
    S = 1'b1;
    #(2*period);
    
    R = 1'b1;
    S = 1'b0;
    #(1.5*period);
    
    R = 1'b0;
    S = 1'b0;
    #period;
    
    R = 1'b0;
    S = 1'b1;
    #(2*period);
    
    R = 1'b1;
    S = 1'b1;
    #(3*period);
    
    S = 1'b0;
    
    
    
    
 
 
 end


endmodule
