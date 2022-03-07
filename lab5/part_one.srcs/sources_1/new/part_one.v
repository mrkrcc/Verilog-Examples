`timescale 1ns / 1ps

module part_one(CLK, RST, rollover, LED);

    parameter n = 8;
    
    input          CLK;
    input          RST;
    output         rollover;
    output [n-1:0] LED;     
    
eight_bit_counter C0(CLK, RST, rollover, LED);
    defparam C0.k = 20; 

endmodule
