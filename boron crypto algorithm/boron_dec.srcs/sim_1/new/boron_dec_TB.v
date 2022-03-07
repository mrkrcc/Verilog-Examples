`timescale 1ns / 1ps

module boron_dec_TB();


    reg         CLK = 0;
    reg  [63:0] Ciphertext;
    reg  [79:0] masterkey;
    wire [63:0] Plaintext;


boron_dec   UUT(CLK, Ciphertext, masterkey, Plaintext);
always #50 CLK = ~CLK;

initial
begin
Ciphertext = 64'h3cf72a8b7518e6f7;
masterkey = 80'h00000000000000000000;


end
endmodule