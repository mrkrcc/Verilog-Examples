`timescale 1ns / 1ps

module part_four(i_C, o_HEX, o_AN);

    input   [1:0] i_C;
    output  [6:0] o_HEX;
    output  [7:0] o_AN;
    
    wire [7:0] AN;
    
    assign AN    =  8'b11111110;
    assign o_AN  =  AN;
    assign o_HEX =  (i_C == 2'b00) ? 7'b0100001 :
                    (i_C == 2'b01) ? 7'b0000110 :
                    (i_C == 2'b10) ? 7'b1111001 :
                    (i_C == 2'b11) ? 7'b1000000 :
                    7'b1111111;
endmodule
