`timescale 1ns / 1ps

module shifter_TB();


    reg         CLK = 0;
    reg  [15:0] input_A;
    reg         times;    // 0 = 1 time  1 = 2 times
    reg         direc;    // 0 = left  1 = right
    wire [15:0] shifted_A;
    
    
shifter     UUT(CLK, input_A, times, direc, shifted_A);
always #50 CLK = ~CLK;
initial
begin
    input_A = 16'd64;
    times   = 1'b0;
    direc   = 1'b0;
    
    #100
    input_A = 16'd64;
    times   = 1'b1;
    direc   = 1'b0;

    #100
    input_A = 16'd64;
    times   = 1'b0;
    direc   = 1'b1;
    
    #100
    input_A = 16'd64;
    times   = 1'b1;
    direc   = 1'b1;

end

endmodule