`timescale 1ns / 1ps

module boron_dec(
    input         CLK,
    input  [63:0] Ciphertext,
    input  [79:0] masterkey,
    output reg [63:0] Plaintext
);

reg        done = 0;
reg [4:0]  round = 5'b00000;
reg [79:0] key   = 80'h00000000000000000000;
wire [79:0] KS_out;
wire [63:0] XOR_out, RPR_out, BSR_out, SBL_out, ARK_out;
reg [63:0] temp;
reg         en = 1;

always@(posedge CLK)
begin
    if((round == 0) & (en == 1)) 
    begin
        key <= KS_out;
        round = round + 1;
    end
    else if((round < 24) & (en == 1))
    begin
        round = round + 1;
        key <= KS_out;
    end
    else if((round == 24) & (en == 1))
    begin
        en = 1'b0;
        key <= KS_out;
        round = round;
        temp <= KS_out ^ Ciphertext;
    end
    else if((round > 0) & (round <= 24) & (en == 0))
    begin
        key <= KS_out;
        round = round - 1;
        temp <= ARK_out;
    end
    else if((round == 0) & (en == 0))
    begin
        done = 1;
        Plaintext <= ARK_out;
    end
end

XOR_Operation_Rev       XOREV(temp, XOR_out);
Round_Permutation_Rev   RPREV(XOR_out, RPR_out);
Block_Shuffle_Rev       BSREV(RPR_out, BSR_out);
S_BOX_Layer             SBLAY(BSR_out, SBL_out);
Add_Round_Key_Rev       ARKREV(SBL_out, KS_out[63:0], ARK_out);


Key_Schedule        KS(en, key, round, KS_out);

endmodule