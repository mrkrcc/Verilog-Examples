`timescale 1ns / 1ps

module part_two_TB();

    reg           CLK_in = 0;
    reg  [1:0]    KEY;
    reg  [7:0]    input_1;
    reg           SEL;
    wire          carry;
    wire          overflow;
    wire [7:0]    LED;
    wire [7:0]    ANODE;
    wire [6:0]    out;
initial
begin
 KEY[1] = 1'b0;
 SEL = 1;
end
part_two    UUT(CLK_in, KEY, input_1, SEL, carry, overflow, LED, ANODE, out);
always #100 KEY[1] = ~KEY[1];
always #100 CLK_in = ~CLK_in;
initial
begin
    KEY[0] = 0;
//    KEY[1] = 0;
    #100
    KEY[0] = 0;
    #100
    KEY[0] = 1;
    input_1 = 8'd15;
    
    #100;
//    KEY[1] = 2'b01;
    
    #500;
 //   KEY[1] = 2'b00;
    #100
    
    input_1 = 8'd22;
    #100;
//    KEY[1] = 2'b01;

    SEL = 0;
    #200;
    
    SEL = 1;
    
end

endmodule
