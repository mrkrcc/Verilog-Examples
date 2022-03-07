`timescale 1ns / 1ps

module binary_to_BCD(input_1, i_select, BCD_out);

    input   [4:0] input_1;
    input         i_select;
    output  reg [3:0] BCD_out;

    reg    [7:0] eight_bits;


always@(*)
    begin
        if(input_1 > 9)
            begin
                eight_bits = (input_1 == 8'b00001010) ? 8'b00010000:
                             (input_1 == 8'b00001011) ? 8'b00010001:
                             (input_1 == 8'b00001100) ? 8'b00010010:
                             (input_1 == 8'b00001101) ? 8'b00010011:
                             (input_1 == 8'b00001110) ? 8'b00010100:
                             (input_1 == 8'b00001111) ? 8'b00010101:
                             (input_1 == 8'b00010000) ? 8'b00010110:
                             (input_1 == 8'b00010001) ? 8'b00010111:
                             (input_1 == 8'b00010010) ? 8'b00011000:
                             (input_1 == 8'b00010011) ? 8'b00011001:
                              8'b00000000;               
            end
        else
            begin
                eight_bits = {4'b0000, input_1};
                
            end
        
        if(i_select == 0)
            begin
                BCD_out = eight_bits[3:0];
            end
        else
            begin
                BCD_out = eight_bits[7:4];
            end    
    end                        
endmodule
