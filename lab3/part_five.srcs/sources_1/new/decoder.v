`timescale 1ns / 1ps

module decoder(ANODES, input_1, input_A, sum, out);
    
    input  [7:0] ANODES;
    input  [7:0] input_1;
    input  [7:0] input_A;
    input  [7:0] sum;
    output reg [3:0] out;


always@(*)
begin
           out    = (ANODES == 8'b11111110) ? input_1[3:0]:
                    (ANODES == 8'b11111101) ? input_1[7:4]:
                    (ANODES == 8'b11111011) ? input_A[3:0]:
                    (ANODES == 8'b11110111) ? input_A[7:4]:
                    (ANODES == 8'b11101111) ? sum[3:0]:
                    (ANODES == 8'b11011111) ? sum[7:4]:
                    4'b0000;
end
endmodule
