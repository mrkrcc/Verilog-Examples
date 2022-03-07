`timescale 1ns / 1ps

module part_two_TB();

    reg           CLK_in = 0;
    reg           RST = 1;
    reg     [7:0] SW = 0;
    reg           STOP = 0;
    reg           preset = 0;
    wire    [7:0] ANODE;
    wire    [6:0] out;
    
    
part_three    UUT(CLK_in, RST, STOP, preset, SW, ANODE, out);
always #100 CLK_in = ~CLK_in;
initial
begin
    #100
    RST = 0;
    #100
    RST = 1;
    
    #(2000000000*100000);
    STOP = 1;
    #(2000000000*100000);
    STOP = 0;
    
    #1000
    SW = 8'b10010010;    
    #(2000000000*100000);
    
    
    preset = 1;
    #(2000000000*100000);

    preset = 0;
end



endmodule
