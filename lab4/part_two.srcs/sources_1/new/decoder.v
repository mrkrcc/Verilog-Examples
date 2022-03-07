`timescale 1ns / 1ps

module decoder(ANODES, input_1, out);
    
    input  [7:0] ANODES;
    input  [15:0] input_1;
    output reg [3:0] out;


always@(*)
begin
           out    = (ANODES == 8'b11111110) ? input_1[3:0]:
                    (ANODES == 8'b11111101) ? input_1[7:4]:
                    (ANODES == 8'b11111011) ? input_1[11:8]:
                    (ANODES == 8'b11110111) ? input_1[15:12]:
                    4'b0000;
end
endmodule
