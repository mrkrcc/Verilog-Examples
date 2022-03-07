`timescale 1ns / 1ps

module decoder(

    input      [2:0]  SW,
    output reg [10:0] out = 11'b0
    
);

always@(*)
begin
        out  =  (SW == 3'b000) ? 11'b00000011101:   //A
                (SW == 3'b001) ? 11'b00101010111:   //B
                (SW == 3'b010) ? 11'b10111010111:   //C
                (SW == 3'b011) ? 11'b00001010111:   //D
                (SW == 3'b100) ? 11'b00000000001:   //E
                (SW == 3'b101) ? 11'b00101110101:   //F
                (SW == 3'b110) ? 11'b00101110111:   //G
                (SW == 3'b111) ? 11'b00001010101:   //H
                11'b00000000000;
                                   
end
endmodule