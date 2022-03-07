`timescale 1ns / 1ps

module S_BOX_Rev(
    input  [3:0] input_X,
    output [3:0] output_X
);



assign      output_X = (input_X ==  4'b0000) ? 4'b1010 :  // 0 >> A
                       (input_X ==  4'b0001) ? 4'b0011 :  // 1 >> 3  
                       (input_X ==  4'b0010) ? 4'b1001 :  // 2 >> 9
                       (input_X ==  4'b0011) ? 4'b1110 :  // 3 >> E
                       (input_X ==  4'b0100) ? 4'b0001 :  // 4 >> 1
                       (input_X ==  4'b0101) ? 4'b1101 :  // 5 >> D
                       (input_X ==  4'b0110) ? 4'b1111 :  // 6 >> F
                       (input_X ==  4'b0111) ? 4'b0100 :  // 7 >> 4
                       (input_X ==  4'b1000) ? 4'b1100 :  // 8 >> C
                       (input_X ==  4'b1001) ? 4'b0101 :  // 9 >> 5
                       (input_X ==  4'b1010) ? 4'b0111 :  // A >> 7
                       (input_X ==  4'b1011) ? 4'b0010 :  // B >> 2
                       (input_X ==  4'b1100) ? 4'b0110 :  // C >> 6
                       (input_X ==  4'b1101) ? 4'b1000 :  // D >> 8
                       (input_X ==  4'b1110) ? 4'b0000 :  // E >> 0
                       (input_X ==  4'b1111) ? 4'b1011 :  // F >> B
                       4'b0000; 

endmodule
