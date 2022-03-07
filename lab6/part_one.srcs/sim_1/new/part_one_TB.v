`timescale 1ns / 1ps

module part_one_TB();

    reg           CLK_in;
    reg  [1:0]    KEY;
    reg  [7:0]    input_A;
    wire          carry;
    wire          overflow;
    wire [7:0]    LED;
    wire [7:0]    ANODE;
    wire [6:0]    out;
initial
begin
 KEY[1] = 1'b0;
end
part_one    UUT(CLK_in, KEY, input_A, carry, overflow, LED, ANODE, out);
always #100 KEY[1] = ~KEY[1];
initial
begin
    KEY[0] = 0;
//    KEY[1] = 0;
    #100
    KEY[0] = 0;
    #100
    KEY[0] = 1;
    input_A = 8'd15;
    
    #100;
//    KEY[1] = 2'b01;
    
    #500;
 //   KEY[1] = 2'b00;
    #100
    
    input_A = 8'd22;
    #700;
    
    input_A = 8'd41;
//    KEY[1] = 2'b01;
end

endmodule
