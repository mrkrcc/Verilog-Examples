`timescale 1ns / 1ps

module boron_TB();

    reg      [63:0] plaintext;
    reg             CLK = 0;
    reg      [79:0] masterkey;
    wire [63:0] ciphertext;

    
boron_top BT(CLK ,plaintext, masterkey, ciphertext);
always #50 CLK = ~CLK;

initial
begin
    plaintext = 64'h0000000000000000;
    masterkey = 80'h00000000000000000000;
    
end

endmodule