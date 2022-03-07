`timescale 1ns / 1ps

module part_four_TB();

    reg      [1:0] i_C;
    wire     [6:0] o_HEX;
    wire     [7:0] o_AN;
    
    part_four UUT (.i_C(i_C), .o_HEX(o_HEX), .o_AN(o_AN));
    
    
    localparam period = 100 ;
        
        initial
            begin
            
            i_C = 2'b10;
            #period 
            
            i_C = 2'b01;
            #period
            
            i_C = 2'b11;
            #period
            
            i_C = 2'b00;
            #period;
            
            
            end
endmodule
