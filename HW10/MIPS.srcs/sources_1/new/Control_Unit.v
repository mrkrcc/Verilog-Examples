`timescale 1ns / 1ps

module Control_Unit(
    input   [7:0]   Op_Code,
    output          MemtoReg,
    output          MemWrite,
    output          Branch,
    output  [3:0]   ALUControl,
    output          ALUSrc,
    output          RegDst,
    output          RegWrite
);

assign RegWrite = ((Op_Code == 8'b10110000) | (Op_Code == 8'b00001011) |
                   (Op_Code == 8'b01000100) | (Op_Code == 8'b11000000)) ? 1'b0:
                  1'b1;

assign RegDst = ((Op_Code == 8'b10110000) | (Op_Code == 8'b01000100)) ? 1'b0:
                1'b1;

assign ALUSrc = ((Op_Code == 8'b00001101) | (Op_Code == 8'b00000010) | 
                 (Op_Code == 8'b00000011) | (Op_Code == 8'b00000001) |
                 (Op_Code == 8'b10000100) | (Op_Code == 8'b00001001) |
                 (Op_Code == 8'b00001011)) ? 1'b0:
                1'b1;

assign ALUControl = ((Op_Code == 8'b11010000) ) ? 4'b1111:
                     (Op_Code == 8'b01010000)  ? 4'b0100:
                    ((Op_Code == 8'b10010000) | (Op_Code == 8'b00001001) | 
                     (Op_Code == 8'b10110000) | (Op_Code == 8'b00001011)) ? 4'b0101:
                     (Op_Code == 8'b00001101) ? 4'b1111:
                    ((Op_Code == 8'b00100000) | (Op_Code == 8'b00000010)) ? 4'b1010:
                    ((Op_Code == 8'b00010000) | (Op_Code == 8'b00000001)) ? 4'b1000:
                    ((Op_Code == 8'b00110000) | (Op_Code == 8'b00000011)) ? 4'b0000:
                    ((Op_Code == 8'b10000100) | (Op_Code == 8'b10000000)) ? 4'b0001:
                    4'b0011;

assign MemWrite = (Op_Code == 8'b01000100) ? 1'b1:
                  1'b0;

assign MemtoReg = ((Op_Code == 8'b01000000) | (Op_Code == 8'b01000100)) ? 1'b1:
                  1'b0;

//assign MemtoReg =  ((Op_Code == 8'b11010000) | (Op_Code == 8'b01010000) | 
//                    (Op_Code == 8'b10010000) | (Op_Code == 8'b00001101) | 
//                    (Op_Code == 8'b00100000) | (Op_Code == 8'b00010000) |
//                    (Op_Code == 8'b00110000) | (Op_Code == 8'b00000010) |
//                    (Op_Code == 8'b00000011) | (Op_Code == 8'b10000000) |
//                    (Op_Code == 8'b00000001) | (Op_Code == 8'b10000100) |
//                    (Op_Code == 8'b00001001)) ? 1'b0:
//                  1'b1;

//assign MemWrite =  ((Op_Code == 8'b11010000) | (Op_Code == 8'b01010000) | 
//                    (Op_Code == 8'b10010000) | (Op_Code == 8'b00001101) |
//                    (Op_Code == 8'b00100000) | (Op_Code == 8'b00010000) |
//                    (Op_Code == 8'b00110000) | (Op_Code == 8'b00000010) |
//                    (Op_Code == 8'b00000011) | (Op_Code == 8'b10000000) |
//                    (Op_Code == 8'b00000001) | (Op_Code == 8'b10000100) |
//                    (Op_Code == 8'b00001001) | (Op_Code == 8'b01000000)) ? 1'b0:
//                  1'b1;

//assign ALUSrc = ((Op_Code == 8'b11010000) | (Op_Code == 8'b01010000) | 
//                 (Op_Code == 8'b10010000) | (Op_Code == 8'b00100000) |
//                 (Op_Code == 8'b00010000) | (Op_Code == 8'b00110000) |
//                 (Op_Code == 8'b10000000)) ? 1'b1:
//                1'b0;

//assign ALUControl = ((Op_Code == 8'b11010000) | (Op_Code == 8'b10000000)) ? 4'b1111:
//                     (Op_Code == 8'b01010000) ? 4'b0100:
//                     ((Op_Code == 8'b10010000) | (Op_Code == 8'b00001001)) ? 4'b0101:
//                     (Op_Code == 8'b00001101) ? 4'b1111:
//                     ((Op_Code == 8'b00100000) | (Op_Code == 8'b00000010)) ? 4'b1010:
//                     ((Op_Code == 8'b00010000) | (Op_Code == 8'b00000011) | (Op_Code == 8'b00000001)) ? 4'b1000:
//                     (Op_Code == 8'b00110000) ? 4'b0000:
//                     (Op_Code == 8'b10000100) ? 4'b0001:
//                    1'b1;

//assign RegDst = ((Op_Code == 8'b11010000) | (Op_Code == 8'b00001101) |
//                 (Op_Code == 8'b01010000) | (Op_Code == 8'b10000000) |
//                 (Op_Code == 8'b10000100) | (Op_Code == 8'b01000000) |
//                 (Op_Code == 8'b10010000) | (Op_Code == 8'b00100000) |
//                 (Op_Code == 8'b00010000) | (Op_Code == 8'b00110000) |
//                 (Op_Code == 8'b00000010)) ? 1'b1:
//                  1'b0;

//assign RegWrite = ((Op_Code == 8'b11010000) | (Op_Code == 8'b00001101) |
//                   (Op_Code == 8'b01010000) | (Op_Code == 8'b10000000) |
//                   (Op_Code == 8'b10000100) | (Op_Code == 8'b01000000) |
//                   (Op_Code == 8'b10010000) | (Op_Code == 8'b00100000) |
//                   (Op_Code == 8'b00010000) | (Op_Code == 8'b00110000) |
//                   (Op_Code == 8'b00000010)) ? 1'b1:
//                  1'b0;

endmodule