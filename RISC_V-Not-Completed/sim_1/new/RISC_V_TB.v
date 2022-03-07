`timescale 1ns / 1ps

module RISC_V_TB();

    reg        CLK = 1'b0;
    reg signed [12:0] deneme; 


RISC_V_top      RV(CLK);
always #50 CLK = ~CLK;
initial begin
    deneme = -13'd72; end

    
    

endmodule