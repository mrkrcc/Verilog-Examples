`timescale 1ns / 1ps
module RISC_V_top(
    input   CLK
//    input [4:0]  PC
);

wire  [31:0]   PCPlus4F;
reg   [31:0]   PCF;
//register file
wire  [31:0]  RD1;      wire  [31:0]  RD2;
//instruction mem
reg  [31:0]   PC;
reg  [1:0]   PC1 = 2'b00;
wire  [31:0]  Instr;
//decoder
wire  [6:0]   Op_Code;
wire  [9:0]   funct;
wire  [31:0]  Imm;
wire  [4:0]   shamt;
wire  [4:0]   rs1;
wire  [4:0]   rs2;
wire  [4:0]   rd;
//control unit
wire          shamt_cntrl;
wire          RegWriteD;
wire          MemtoRegD;
wire          MemWriteD;
wire  [9:0]   ALUControlD;
wire          ALUSrcD;
wire          BranchD;
//ALU
reg   [31:0]  SrcA;
reg  [31:0]  SrcAE;
reg   [31:0]  SrcB;
wire  [31:0]  SrcBE;
wire  [9:0]   Sel;
wire  [31:0]  ALUOut;
wire          Zero;
//data memory
wire          we;
wire  [4:0]   address;
wire  [31:0]  din;
wire  [31:0]  dout;
//
reg           ALUSrcE;
wire [4:0]    shamtE;
reg  [4:0]    shamtT;
//
reg           RegWriteE;    reg          RegWriteM;  reg     ZeroM;     reg     WriteDataE;
reg           BranchE;      reg          BranchM;    reg     RegWriteW; reg     WriteDataM;
//
reg           MemtoRegE;
reg           MemtoRegM;    reg          MemtoRegW;
wire  [31:0]  ResultW;      reg  [31:0]  ReadDataW;
//
reg   [31:0]  ALUOutM;      reg  [31:0]  ALUOutW;
//
reg           MemWriteM;    reg          MemWriteE;
//
reg   [4:0]   WriteRegE;    reg  [4:0]   WriteRegM;
reg   [4:0]   WriteRegW;
//
reg   [31:0]  InstrD;
reg   [31:0]  SignImmE;
reg           shamt_cntrlE;
reg   [9:0]   ALUControlE;
reg   [31:0]  PCPlus4D;
reg   [31:0]  PCPlus4E;
reg   [31:0]  PCBranchM;
wire  [31:0]  PCBranchE;
wire          PCSrcM;
reg  [1:0]   ForwardAE;
reg  [1:0]   ForwardBE;
wire  [31:0]  SrcBEL;
reg   [4:0]   RsE;
reg   [4:0]   RtE;
initial begin
    PC = 32'd0; end

assign  PCSrcM = BranchM & ZeroM;
assign  PCPlus4F = PCF + 32'd4;

always@(*) begin
    if(PCSrcM) begin
        PC = PCBranchM; end
    else begin
        PC = PCPlus4F; end end


//      PC <= (PCSrcM == 1'b0) ? PCPlus4F:
//             PCBranchM; end
             
always@(posedge CLK) begin
    PCF <=  PC; end


Instruction_Memory  IM(PCF, Instr);
always@(posedge CLK) begin
    InstrD <= Instr;
    PCPlus4D <= PCPlus4F; end


Decoder             DC(InstrD, Op_Code, funct, Imm, shamt, rs1, rs2, rd);

    assign ResultW = (MemtoRegW == 1'b1) ? ReadDataW:
                     ALUOutW;


Control_Unit        CU(Op_Code, funct, shamt_cntrl, RegWriteD, MemtoRegD, MemWriteD, ALUControlD, ALUSrcD, BranchD);
Register_File       RF(CLK, rs1, rs2, WriteRegW, RegWriteW, ResultW, RD1, RD2);
always@(posedge CLK) begin
    SrcA            <=  RD1; 
    SrcB            <=  RD2; 
    SignImmE        <=  Imm; 
    shamtT          <=  shamt;
    shamt_cntrlE    <=  shamt_cntrl;
    ALUSrcE         <=  ALUSrcD; 
    RegWriteE       <=  RegWriteD;  
    MemtoRegE       <=  MemtoRegD;  
    MemWriteE       <=  MemWriteD;
    ALUControlE     <=  ALUControlD;
    BranchE         <=  BranchD;
    WriteRegE       <=  rd;
    PCPlus4E        <=  PCPlus4D;
    RsE             <=  rs1;
    RtE             <=  rs2; end
reg [31:0] deneme;

    assign SrcBE  = (ALUSrcE == 1'b1) ? SignImmE:
                    deneme;

    assign shamtE = (shamt_cntrlE == 1'b0) ? shamtT:
                    SrcB[4:0];

    assign PCBranchE = SignImmE + PCPlus4E;

always@(*) begin
    if((RsE != 0) & (RsE == WriteRegM) & RegWriteM) begin
        ForwardAE = 2'b10; end
    else if((RsE != 0) & (RsE == WriteRegW) & RegWriteW) begin
        ForwardAE = 2'b01; end
    else 
    begin
        ForwardAE = 2'b00; end end

always@(*) begin
    if(ForwardAE == 2'b10) begin
        SrcAE = ALUOutM; end
    else if(ForwardAE == 2'b01) begin
        SrcAE = ResultW; end
    else begin
        SrcAE = SrcA; end end

always@(*) begin
    if((RtE != 0) & (RtE == WriteRegM) & RegWriteM) begin
        ForwardBE = 2'b10; end
    else if((RtE != 0) & (RtE == WriteRegW) & RegWriteW) begin
        ForwardBE = 2'b01; end
    else 
    begin
        ForwardBE = 2'b00; end end

always@(*) begin
    if(ForwardBE == 2'b10) begin
        deneme = ALUOutM; end
    else if(ForwardBE == 2'b01) begin
        deneme = ResultW; end
    else begin
        deneme = SrcB; end end

ALU                 ALU(SrcAE, SrcBE, shamtE, ALUControlE, ALUOut, Zero);
always@(posedge CLK) begin
    ALUOutM     <=  ALUOut;
    MemWriteM   <=  MemWriteE;
    RegWriteM   <=  RegWriteE;
    MemtoRegM   <=  MemtoRegE;
    MemWriteM   <=  MemWriteE;
    BranchM     <=  BranchE;
    ZeroM       <=  Zero;
    WriteDataM  <=  WriteDataE;
    WriteRegM   <=  WriteRegE;
    PCBranchM   <=  PCBranchE; end

Data_Mem            DM(CLK, MemWriteM, WriteDataM, ALUOutM, dout); //store eklenecek
always@(posedge CLK) begin
    RegWriteW   <=  RegWriteM;  
    MemtoRegW   <=  MemtoRegM;
    ALUOutW     <=  ALUOutM;
    ReadDataW   <=  dout;
    WriteRegW   <=  WriteRegM; end
endmodule