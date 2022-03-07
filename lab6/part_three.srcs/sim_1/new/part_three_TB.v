`timescale 1ns / 1ps

module part_three_TB();

    reg        CLK_in = 0;
    reg  [3:0] input_A;
    reg  [3:0] input_B;
    wire [6:0] out;
    wire [7:0] ANODE;

    
part_three UUT(CLK_in, input_A, input_B, out, ANODE);
always #50 CLK_in = ~CLK_in;
initial 
begin
    input_A = 4'b0010;
    input_B = 4'b0010;
    
    #100
    
    input_A = 4'b0101;
    input_B = 4'b1001;
    
    #100
    
    input_A = 4'b1111;
    input_B = 4'b1000;

    #100

    input_A = 4'b0000;
    input_B = 4'b1111;

    #100

    input_A = 4'b0110;
    input_B = 4'b1111;

    #100

    input_A = 4'b0001;
    input_B = 4'b1011;

    #100

        input_A = 4'b0000;
        input_B = 4'b0000;
end
endmodule
