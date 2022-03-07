`timescale 1ns / 1ps

module ALU(
    input   [31:0] SrcA,
    input   [31:0] SrcB,
    input   [4:0]  shamt,  // rs2[4:0] or shamt
    input   [9:0]  Sel,
    output  [31:0] ALUOut,
    output         ZeroM
);

wire signed [31:0] SRAI;
wire        SLTIU;
wire        SLTI;

wire signed [31:0] signed_A;
wire signed [31:0] signed_B;
    assign signed_A = SrcA;
    assign signed_B = SrcB;

    assign SLTI = (signed_A < signed_B) ? 1'b1:
                  1'b0;

    assign SLTIU = (SrcA < SrcB) ? 1'b1:
                  1'b0;

    assign SRAI = SrcA;

    assign ALUOut = (Sel == 10'b0000000000) ? SrcA + SrcB:  // A
//                    (Sel == 10'b0000001000) ? SrcA + SrcB:  // A
                    (Sel == 10'b0100000000) ? SrcA - SrcB:  //   rs2-rs1
                    (Sel == 10'b0000000100) ? SrcA ^ SrcB:
                    (Sel == 10'b0000000110) ? SrcA | SrcB:
                    (Sel == 10'b0000000111) ? SrcA & SrcB:
                    (Sel == 10'b0000000001) ? SrcA << shamt:
                    (Sel == 10'b0000000101) ? SrcA >> shamt:
                    (Sel == 10'b0100000101) ? SRAI >>> shamt:   //SRAI
                    (Sel == 10'b0000000011) ? SLTIU:
                    (Sel == 10'b0000000010) ? SLTI:
                    (Sel == 10'b1111111111) ? SrcB:  //LUI
                    (Sel == 10'b1111100000) ? SrcA + SrcB:  //AUIPC  rdest = PC + (input[20bit], 12'd0)
                    32'd0;

    assign ZeroM = (((Sel == 10'b0000000000) & (SrcA == SrcB)) |
                    ((Sel == 10'b0000000001) & (SrcA != SrcB)) |
                    (((Sel == 10'b0000000100) | (Sel == 10'b0000000110)) & (SrcA < SrcB)) |
                    (((Sel == 10'b0000000101) | (Sel == 10'b0000000111)) & (SrcA > SrcB))) ? 1'b1:
                    1'b0;

endmodule