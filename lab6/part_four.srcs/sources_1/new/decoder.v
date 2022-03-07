`timescale 1ns / 1ps

module decoder(ANODES, X, out);
    
    input  [7:0] ANODES;
    input  [15:0] X;
    output reg [3:0] out;


always@(*)
begin
           out    = (ANODES == 8'b11111110) ? X[3:0]:
                    (ANODES == 8'b11111101) ? X[7:4]:
                    (ANODES == 8'b11111011) ? X[11:8]:
                    (ANODES == 8'b11110111) ? X[15:12]:
                    4'b0000;
end
endmodule
