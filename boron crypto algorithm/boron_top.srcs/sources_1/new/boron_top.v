`timescale 1ns / 1ps

module boron_top(
    input             CLK,
    input      [63:0] plaintext,
    input      [79:0] masterkey,
    output reg [63:0] ciphertext
);

reg [63:0] reg_plaintext = 64'h0000000000000000;
reg [4:0]  round = 5'b00000;
reg [79:0] key   = 80'h00000000000000000000;
reg        done  = 0;
wire [63:0] ARK_out;
wire [63:0] SB_out;
wire [63:0] BS_out;
wire [63:0] RP_out, XO_out;
wire [79:0] KS_out;


always@(posedge CLK)
begin
    if(round == 0) 
    begin
        reg_plaintext <= XO_out;
        key <= KS_out;
        round = round + 1;
    end
    else if(round < 24)
    begin
        reg_plaintext <= XO_out;
        round = round + 1;
        key <= KS_out;
    end
    else
    begin
        ciphertext <= XO_out ^ KS_out;
        done = 1'b1;
        round = 5'b00000;
        reg_plaintext <= 0;
        key <= 0;
    end
end

Add_round_key       ARK(reg_plaintext, key[63:0], ARK_out);
S_Box               SB(ARK_out, SB_out);
Block_Shuffle        BS(SB_out, BS_out);
Round_Permutation   RP(BS_out, RP_out);
XOR_Operation       XO(RP_out, XO_out);
Key_Schedule        KS(key, round, KS_out);

endmodule