`timescale 1ns / 1ps

module part_four_TB(

);

parameter N = 8;
    reg [N-1:0] input_1;
    reg         CLK_in = 0;
    reg         RST = 1;
    reg         STORE_A = 0;
    reg         STORE_B = 0;
    wire [7:0]  ANODE;
    wire [6:0]  out;
    wire [7:0]  LED;
    
part_four UUT(input_1, CLK_in, RST, STORE_A, STORE_B, ANODE, out, LED);
always #50 CLK_in = ~CLK_in;
initial
begin

    #300
    
    input_1 = 8'd2;
    #100;
    RST = 0;
    
    #100
    RST = 1;
    
    #400
    STORE_A = 1;
    
    #200
    input_1 = 8'd5;
    #100
    
    STORE_B = 1;
    #200;
end    
endmodule
