`timescale 1ns / 1ps

module MIPS_TB();

    reg   CLK_in = 1'b0;
    reg   button;
    reg [5:0] deneme = 5'b00000;



MIPS_top        MIPS(CLK_in, button, deneme);
always #50 CLK_in = ~CLK_in;
always@(posedge CLK_in)
begin
    deneme = deneme + 1;
end
endmodule