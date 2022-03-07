`timescale 1ns / 1ps

module part_five_TB(

);

//parameter N = 8;
    reg [7:0] input_1;
    reg [7:0] input_2;
    reg       RST = 1;
    reg       CLK = 0;
    wire [15:0] out;
    
part_five UUT(input_1, input_2, CLK, RST, out);
always #50 CLK = ~CLK;
initial
begin
    input_1 = 8'd0;
    input_2 = 8'd0; 
    #300
    
    input_1 = 8'd2;
    input_2 = 8'd5;
    #100;
    RST = 0;
    
    #100
    RST = 1;
    
    #400
    RST = 0;
    
    input_1 = 8'd6;
    input_2 = 8'd3;
    #200
    RST = 1; 
    #200
    RST = 0;
    
    input_1 = 8'd12;
    input_2 = 8'd5;
    #50 RST = 1;
end    
endmodule
