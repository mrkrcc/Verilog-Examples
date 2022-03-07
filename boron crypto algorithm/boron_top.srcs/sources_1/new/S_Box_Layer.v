`timescale 1ns / 1ps

module S_Box_Layer(
    input  [3:0] input_X,
    output [3:0] output_X
);



assign      output_X = (input_X ==  4'b0000) ? 4'b1110 :  // 0 >> E
                       (input_X ==  4'b0001) ? 4'b0100 :  // 1 >> 4  
                       (input_X ==  4'b0010) ? 4'b1011 :  // 2 >> B
                       (input_X ==  4'b0011) ? 4'b0001 :  // 3 >> 1
                       (input_X ==  4'b0100) ? 4'b0111 :  // 4 >> 7
                       (input_X ==  4'b0101) ? 4'b1001 :  // 5 >> 9
                       (input_X ==  4'b0110) ? 4'b1100 :  // 6 >> C
                       (input_X ==  4'b0111) ? 4'b1010 :  // 7 >> A
                       (input_X ==  4'b1000) ? 4'b1101 :  // 8 >> D
                       (input_X ==  4'b1001) ? 4'b0010 :  // 9 >> 2
                       (input_X ==  4'b1010) ? 4'b0000 :  // A >> 0
                       (input_X ==  4'b1011) ? 4'b1111 :  // B >> F
                       (input_X ==  4'b1100) ? 4'b1000 :  // C >> 8
                       (input_X ==  4'b1101) ? 4'b0101 :  // D >> 5
                       (input_X ==  4'b1110) ? 4'b0011 :  // E >> 3
                       (input_X ==  4'b1111) ? 4'b0110 :  // F >> 6
                       4'b0000;

endmodule