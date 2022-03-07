`timescale 1ns / 1ps

module MIPS_top(
    input   CLK_in,
    input   button,
    input   RST,
    output [7:0] ANODE,
    output [6:0] out 
);

wire        Branch;
wire [7:0]  disp;
wire        Jump;
wire        JAL;
wire        return;
wire        button_deb;
wire [15:0] Instr;
wire [15:0] SrcA;
wire [15:0] SrcB;
wire [15:0] reg_SrcB;
wire [15:0] ReadData;
wire signed [15:0] SignImm;
wire [7:0]  OP_Code;
wire [5:0]  PC;
wire [3:0]  WriteReg;
wire [15:0] input_A;
wire [2:0]  times_direc;
wire        MemtoReg;
wire        MemWrite;
wire  [3:0] ALUControl;
wire        ALUSrc;
wire        RegDst;
wire        RegWrite;
wire [15:0] Result;
wire [15:0] ALUR;
wire [15:0] ALUResult;
wire [15:0] PSR_Flag;
wire [15:0] Data_WD;
wire [15:0] R0;
wire [3:0]  Data_A;
wire            CLK_out;
wire   [3:0]    out_2;
wire   [1:0]    cnt;


assign OP_Code = {Instr[15:12], Instr[7:4]};

assign WriteReg = (RegDst == 1'b1) ? Instr[11:8]:
                  Instr[3:0];

assign SrcB = (ALUSrc == 1'b1) ? SignImm:
              reg_SrcB;
//{12{0}}
assign SignImm = {{12{Instr[3]}}, Instr[3:0]};

assign times_direc = ((OP_Code == 8'b10000000) | (OP_Code == 8'b10000100)) ? 3'b000:
                     3'b111;

assign Data_A = (OP_Code == 8'b01000100) ? Instr[3:0]:
                ALUResult[3:0];

assign Data_WD = (OP_Code == 8'b01000100) ? SrcA:
                 reg_SrcB;

debounce               DB0(CLK_in, button, button_deb);
Program_Counter        PCNT(button_deb, RST, Branch, Jump, JAL, return, disp, PC);
Instruction_memory     IM(PC, Instr);
Control_Unit           CU(OP_Code, MemtoReg, MemWrite, Branch, ALUControl, ALUSrc, RegDst, RegWrite);
Register_File          RF(button_deb, Instr[11:8], Instr[3:0], WriteReg, RegWrite, Result, SrcA, reg_SrcB, R0); //*
ALU_top                ALU(SrcA, SrcB, ALUControl, ALUR, PSR_Flag);
shifter                SHF(ALUR, times_direc, ALUResult);
data_memory            DM(button_deb, MemWrite, Data_A, Data_WD, ReadData); //*

assign  Result = (MemtoReg == 1'b1) ? ReadData:
                 ALUResult;

clock_divider   CD0(CLK_in, CLK_out);
counter         NC3(CLK_out, cnt);
anode_cntrl     AC(cnt, ANODE);
decoder         D(ANODE, R0, out_2);
seven_segment   SS(out_2, out);

endmodule