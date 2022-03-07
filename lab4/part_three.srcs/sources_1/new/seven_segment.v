`timescale 1ns / 1ps

module seven_segment(input_1, out);

    input   [3:0] input_1;
    output  [6:0] out;
    
    assign out =  (input_1 == 4'b0000) ? 7'b1000000 :
                  (input_1 == 4'b0001) ? 7'b1111001 :
                  (input_1 == 4'b0010) ? 7'b0100100 :
                  (input_1 == 4'b0011) ? 7'b0110000 :
                  (input_1 == 4'b0100) ? 7'b0011001 :
                  (input_1 == 4'b0101) ? 7'b0010010 :
                  (input_1 == 4'b0110) ? 7'b0000010 :
                  (input_1 == 4'b0111) ? 7'b1111000 :
                  (input_1 == 4'b1000) ? 7'b0000000 :
                  (input_1 == 4'b1001) ? 7'b0010000 :                  
                  7'b1111111;


endmodule
