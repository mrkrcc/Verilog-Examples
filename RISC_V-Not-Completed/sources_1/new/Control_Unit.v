`timescale 1ns / 1ps

module Control_Unit(
    input   [6:0]   Op_Code,
    input   [9:0]   funct,
    output          shamt_cntrl,
    output          RegWrite,
    output          MemtoReg,
    output          MemWrite,
    output  [9:0]   ALUControl,
    output          ALUSrc,
    output          Branch
);
//store eklenecek
    assign RegWrite = ((Op_Code == 7'b0100011) | (Op_Code == 7'b1100011)) ? 1'b0:   //STORE BRANCH
                      1'b1;

    assign MemtoReg = (Op_Code == 7'b0000011) ? 1'b1:   //LOAD
                      1'b0;

    assign MemWrite = (Op_Code == 7'b0100011) ? 1'b1:   //STORE
                      1'b0;

    assign ALUControl = ((Op_Code == 7'b0010011) & 
                        ((funct[2:0] == 3'b000) | (funct[2:0] == 3'b010) | (funct[2:0] == 3'b011) | (funct[2:0] == 3'b100) |
                        (funct[2:0] == 3'b110) | (funct[2:0] == 3'b111))) ? {7'b0000000, funct[2:0]}:
                        (Op_Code == 7'b1100011) ? {7'b0000000, funct[2:0]}:
                        (Op_Code == 7'b0110111) ? 10'b1111111111: //LUI
                        (Op_Code == 7'b0010111) ? 10'b1111100000: //AUIPC  rdest = PC + (input[20bit], 12'd0)
                        funct;

    assign  shamt_cntrl = (Op_Code == 7'b0010011) ? 1'b0:
                          1'b1;

    assign  ALUSrc  =  ((Op_Code == 7'b0110111) | (Op_Code  == 7'b0000011) | (Op_Code == 7'b0010011)) ? 1'b1:
                       1'b0;

    assign  Branch  =   (Op_Code == 7'b1100011) ? 1'b1:
                        1'b0;

endmodule