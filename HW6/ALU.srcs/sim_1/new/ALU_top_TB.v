`timescale 1ns / 1ps

module ALU_top_TB();

    reg  [15:0] input_A;
    reg  [15:0] input_B;
    reg  [3:0]  Select;
    wire [15:0] S_out;
    wire [15:0] PSR_Flag;
    reg signed [8:0]   deneme = 9'b100001000;
//    reg [3:0]   shamt = 4'b0101;
    reg signed [8:0]   deneme2 = 9'b000001001;
    wire sonuc;
//    wire [8:0]  sonuc2;
//    reg [3:0]  sonuc2;
//    reg [3:0]  sonuc3;
ALU_top     UUT(input_A, input_B, Select, S_out, PSR_Flag);

assign sonuc = (deneme < deneme2) ? 1'b1:
               (deneme > deneme2) ? 1'b0:
               1'bX;

//assign sonuc2 = sonuc >>> shamt;
initial begin
//    sonuc = deneme >>> shamt;

//    sonuc2 = deneme | deneme2;
//    sonuc3 = deneme & deneme2;
    input_A = 16'd5;
    input_B = 16'd9;
    Select = 4'b0000;
    #100
    
    Select = 4'b0010;
    #100
    Select = 4'b1000;
    #100
    Select = 4'b1010;
    #100
    Select = 4'b0100;
    #100
    Select = 4'b0101;
    #100
    Select = 4'b0111;

    #100
    input_A = 16'd5999;
    input_B = 16'd4001;
    Select = 4'b0000;
    #100
    
    Select = 4'b0010;
    #100
    Select = 4'b1000;
    #100
    Select = 4'b1010;
    #100
    Select = 4'b0100;
    #100
    Select = 4'b0101;
    #100
    Select = 4'b0111;
    
    #100 
    input_A = 16'b0000000000001001;
    input_B = 16'b1111111111111000;
    Select = 4'b0101;
end

endmodule