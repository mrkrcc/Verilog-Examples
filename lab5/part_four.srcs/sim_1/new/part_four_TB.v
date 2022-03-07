`timescale 1ns / 1ps

module part_four_TB();

    reg       CLK_in = 0;
    reg [1:0] KEY = 2'b00;
    reg [2:0] SW;
    wire      LED;

part_four   UUT(CLK_in, KEY, SW, LED);

always #100 CLK_in = ~CLK_in;

initial
begin
    SW = 3'b000;
    KEY[0] = 0;
    KEY[1] = 0;
    #100
    
    SW = 3'b000;
    #250
    KEY[0] = 1;
    #250
    
    KEY[0] = 0;
    KEY[1] = 1;
    #1000;

    SW = 3'b101;
    KEY[0] = 1;
    #200
    
    KEY[0] = 0;
    KEY[1] = 1;
    #500
    
    SW = 3'b100;
    KEY[0] = 1;
end

endmodule
