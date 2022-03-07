`timescale 1ns / 1ps

module decoder(ANODES, X, Y, out);
    
    input  [7:0] ANODES;
    input  [7:0] X;
    input  [7:0] Y;
    output reg [3:0] out;


always@(*)
begin
           out    <= (ANODES == 8'b11111110) ? X[3:0]:
                     (ANODES == 8'b11111101) ? X[7:4]:
                     (ANODES == 8'b11111011) ? Y[3:0]:
                     (ANODES == 8'b11110111) ? Y[7:4]:
                     4'b0000;
end
endmodule
