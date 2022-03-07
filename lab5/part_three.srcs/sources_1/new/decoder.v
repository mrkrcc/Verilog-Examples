`timescale 1ns / 1ps

module decoder(ANODES, X, Y, Z, A, B, C, out);
    
    input  [7:0] ANODES;
    input  [3:0] X;
    input  [3:0] Y;
    input  [3:0] Z;
    input  [3:0] A;
    input  [3:0] B;
    input  [3:0] C;
    output reg [3:0] out;


always@(*)
begin
           out    = (ANODES == 8'b11111110) ? X:
                    (ANODES == 8'b11111101) ? Y:
                    (ANODES == 8'b11111011) ? Z:
                    (ANODES == 8'b11110111) ? A:
                    (ANODES == 8'b11101111) ? B:
                    (ANODES == 8'b11011111) ? C:
                    4'b0000;
end
endmodule
