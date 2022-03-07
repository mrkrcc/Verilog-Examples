`timescale 1ns / 1ps

module decoder(ANODES, X, Y, Z, out);
    
    input  [7:0] ANODES;
    input  [3:0] X;
    input  [3:0] Y;
    input  [7:0] Z;
    output reg [3:0] out;


always@(*)
begin
           out    = (ANODES == 8'b11111110) ? X[3:0]:
                    (ANODES == 8'b11111011) ? Y[3:0]:
                    (ANODES == 8'b11101111) ? Z[3:0]:
                    (ANODES == 8'b11011111) ? Z[7:4]:
                    4'b0000;
end
endmodule
