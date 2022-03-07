`timescale 1ns / 1ps

module Instruction_Memory(
    input      [31:0]    PC,
    output  reg[31:0]   Instruction
);

reg [31:0] memory[0:128];

always@(*)
begin
    memory [0]   = 32'h00188893;
    memory [4]   = 32'h00b50513;
    memory [8]   = 32'h00958593;
    memory [12]  = 32'h00860613;
    memory [16]  = 32'h00068693;
    memory [20]  = 32'h02070713;
    memory [24]  = 32'h41170833;
    memory [28]  = 32'h00169693;
    memory [32]  = 32'h00a6c863;
    memory [36]  = 32'b00000000000011111000111110010011; //dummy
    memory [40]  = 32'b00000000000011111000111110010011; //dummy
    memory [44]  = 32'b00000000000011111000111110010011; //dummy
    memory [48]  = 32'h40a686b3;
    memory [52]  = 32'h010657b3;
    memory [56]  = 32'h0017f793;
    memory [60]  = 32'h03179263;     // BNE to 100
    memory [64]  = 32'b00000000000011111000111110010011; //dummy
    memory [68]  = 32'b00000000000011111000111110010011; //dummy
    memory [72]  = 32'b00000000000011111000111110010011; //dummy
    memory [76]  = 32'h00b686b3;
    memory [80]  = 32'h00a6c863;
    memory [84]  = 32'b00000000000011111000111110010011; //dummy
    memory [88]  = 32'b00000000000011111000111110010011; //dummy
    memory [92]  = 32'b00000000000011111000111110010011; //dummy
    memory [96]  = 32'h40a686b3;
    memory [100] = 32'h41170733;
    memory [104] = 32'hfa0716e3; // branch to 24
    memory [108] = 32'b00000000000011111000111110010011; //dummy
    memory [112] = 32'b00000000000011111000111110010011; //dummy
    memory [116] = 32'b00000000000011111000111110010011; //dummy
    memory [120] = 32'h00188893;

    Instruction = memory[PC];
end
//    assign     Instruction = memory[PC];

endmodule