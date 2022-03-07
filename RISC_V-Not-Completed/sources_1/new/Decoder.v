`timescale 1ns / 1ps

module Decoder(
    input   [31:0]  Instr,
    output  [6:0]   Op_Code,
    output  [9:0]   funct,
    output  [31:0]  Imm,
    output  [4:0]   shamt,
    output  [4:0]   rs1,
    output  [4:0]   rs2,
    output  [4:0]   rd
);

wire [6:0]  temp;
wire [2:0]  func_3;
wire        f1;
wire        f2;
wire [31:0] temp_2;
    assign  temp_2  =   {{19{Instr[31]}}, Instr[31], Instr[7], Instr[30:25], Instr[11:8], 1'b0};
    assign  temp    =   Instr[6:0];
    assign  func_3  =   Instr[14:12];
    assign  f1      =   (func_3 == 3'b011) ? 1'b1:
                        1'b0;
    assign  f2      =   (func_3 == 3'b011) ? 1'b0:
                        1'b1;


    assign  Op_Code =   Instr[6:0];
    assign  rs1     =   Instr[19:15];
    assign  rs2     =   Instr[24:20];
    assign  shamt   =   Instr[24:20];
    assign  rd      =   (temp == 7'b0100011) ? 5'bX:
                        Instr[11:7];

    assign  funct   =   {Instr[31:25], Instr[14:12]};
            //JAL eklenecek
    assign  Imm     =   ((temp == 7'b0110111) | (temp == 7'b0010111)) ? {Instr[31:12], {12{1'b0}}}:    //LUI, AUIPC
                        ((temp == 7'b0000011) & (~func_3[2])) ? {{20{Instr[31]}}, Instr[31:20]}:  //LB, LH, LW
                        ((temp == 7'b0000011) & func_3[2]) ? {{20{1'b0}}, Instr[31:20]}:  //LBU, LHU
                        ((temp == 7'b0010011) & f1 & (~f2)) ?  {{20{1'b0}}, Instr[31:20]}:  //SLTIU
                        ((temp == 7'b0010011) & (~f1) & f2) ?  {{20{Instr[31]}}, Instr[31:20]}: // signed IMM
                        (temp == 7'b1100011) ? temp_2:
                        32'd0;

endmodule