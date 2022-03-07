`timescale 1ns / 1ps

module decoder(ANODES, X, Y, Z, out);
    
    input  [7:0] ANODES;
    input  [3:0] X;
    input  [3:0] Y;
    input  [3:0] Z;
    output reg [3:0] out;


always@(*)
begin
           out    = (ANODES == 8'b11111110) ? X:
                    (ANODES == 8'b11111101) ? Y:
                    (ANODES == 8'b11111011) ? Z:
                    4'b0000;
end
endmodule
