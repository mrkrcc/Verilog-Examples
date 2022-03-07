`timescale 1ns / 1ps

module part_three_TB();

    reg       CLK_in;
    reg       RST = 0;
    reg       STORE_2 = 0;
    reg [2:0] input_1 = 3'b000;
    wire      LED;
    
    
part_three UUT(CLK_in, RST, STORE_2, input_1, LED);
always #100 STORE_2 = ~STORE_2;

initial
begin
    #200 RST = 1;
    input_1 = 3'b101;
end
endmodule