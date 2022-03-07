`timescale 1ns / 1ps

module decoder(ANODES, cnt_2, out);
    
    input  [7:0] ANODES;
    input  [2:0] cnt_2;
    output reg [3:0] out;


always@(*)
begin                   
    if(cnt_2 == 3'b000)
    begin
        out    =        (ANODES == 8'b11111110) ? 4'b0000:
                        (ANODES == 8'b11111101) ? 4'b0001:
                        (ANODES == 8'b11111011) ? 4'b1110:
                        (ANODES == 8'b11110111) ? 4'b1101:
                        (ANODES == 8'b11101111) ? 4'b1111:
                        (ANODES == 8'b11011111) ? 4'b1111:
                        4'b0000;
    end
    else if(cnt_2 == 3'b001)
    begin
        out    =        (ANODES == 8'b11111110) ? 4'b1111:
                        (ANODES == 8'b11111101) ? 4'b0000:
                        (ANODES == 8'b11111011) ? 4'b0001:
                        (ANODES == 8'b11110111) ? 4'b1110:
                        (ANODES == 8'b11101111) ? 4'b1101:
                        (ANODES == 8'b11011111) ? 4'b1111:
                        4'b0000;
    end
    else if(cnt_2 == 3'b010) 
    begin
        out    =        (ANODES == 8'b11111110) ? 4'b1111:
                        (ANODES == 8'b11111101) ? 4'b1111:
                        (ANODES == 8'b11111011) ? 4'b0000:
                        (ANODES == 8'b11110111) ? 4'b0001:
                        (ANODES == 8'b11101111) ? 4'b1110:
                        (ANODES == 8'b11011111) ? 4'b1101:
                        4'b0000;
    end      
    else if(cnt_2 == 3'b011)
    begin
        out    =        (ANODES == 8'b11111110) ? 4'b1101:
                        (ANODES == 8'b11111101) ? 4'b1111:
                        (ANODES == 8'b11111011) ? 4'b1111:
                        (ANODES == 8'b11110111) ? 4'b0000:
                        (ANODES == 8'b11101111) ? 4'b0001:
                        (ANODES == 8'b11011111) ? 4'b1110:
                        4'b0000;
    end
    else if(cnt_2 == 3'b100)
        begin
            out    =        (ANODES == 8'b11111110) ? 4'b1110:
                            (ANODES == 8'b11111101) ? 4'b1101:
                            (ANODES == 8'b11111011) ? 4'b1111:
                            (ANODES == 8'b11110111) ? 4'b1111:
                            (ANODES == 8'b11101111) ? 4'b0000:
                            (ANODES == 8'b11011111) ? 4'b0001:
                            4'b0000;
        end
     else if(cnt_2 == 3'b101)
        begin
            out    =        (ANODES == 8'b11111110) ? 4'b0001:
                            (ANODES == 8'b11111101) ? 4'b1110:
                            (ANODES == 8'b11111011) ? 4'b1101:
                            (ANODES == 8'b11110111) ? 4'b1111:
                            (ANODES == 8'b11101111) ? 4'b1111:
                            (ANODES == 8'b11011111) ? 4'b0000:
                            4'b0000;
        end
end
endmodule
