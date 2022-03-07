`timescale 1ns / 1ps

module ALU_logic_func_TB();

    reg  [15:0] input_A;
    reg  [15:0] input_B;
    reg  [3:0]  Select;
    wire [15:0] S_out;
    reg  [15:0] deneme;
    
ALU_logic_func  UUT(input_A, input_B, Select, S_out);


initial begin



    input_A = 16'd8;
    input_B = 16'd4;
    Select  = 4'b0100;
    
    deneme = ~input_A;
    
    #100
    
    Select  = 4'b0000;
    deneme = ~input_B;

    #100
    
    Select  = 4'b0010;
    
    #100
    Select  = 4'b1000;
    
    #100
    Select  = 4'b1010;
    #100
    Select  = 4'b0101;
    #100
    Select  = 4'b0111;
    input_A = 16'd7;
        deneme = ~input_A;

end

endmodule