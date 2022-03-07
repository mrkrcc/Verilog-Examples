`timescale 1ns / 1ps

module decoder(ANODES, X, Y, Z, out);
    
    input  [7:0] ANODES;
    input  [3:0] X;
    input  [4:0] Y;
    input  [3:0] Z;
    output reg [3:0] out;


always@(*)
begin
           out    = (ANODES == 8'b11111110) ? Z:
                    (ANODES == 8'b11111011) ? X:
                    (ANODES == 8'b11101111) ? Y[3:0]:
                    (ANODES == 8'b11011111) ? Y[4]:
                    4'b0000;
end
endmodule
