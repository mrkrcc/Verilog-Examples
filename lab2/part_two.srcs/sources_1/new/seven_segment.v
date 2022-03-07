module seven_segment(input_1, BCD_out);

    input   [3:0] input_1;
    output  [6:0] BCD_out;

    
    
    assign BCD_out =    (input_1 == 4'b0000) ? 7'b1000000 :
                        (input_1 == 4'b0001) ? 7'b1111001 :
                        (input_1 == 4'b0010) ? 7'b0100100 :
                        (input_1 == 4'b0011) ? 7'b0110000 :
                        (input_1 == 4'b0100) ? 7'b0011001 :
                        (input_1 == 4'b0101) ? 7'b0010010 :
                        (input_1 == 4'b0110) ? 7'b0000011 :
                        (input_1 == 4'b0111) ? 7'b1111000 :
                        (input_1 == 4'b1000) ? 7'b0000000 :
                        (input_1 == 4'b1001) ? 7'b0010000 :
                        7'b1111111;
endmodule
