`timescale 1ns / 1ps

module part_five(input_1, input_2, CLK, RST, out);

parameter N = 8;
    input [N-1:0] input_1;
    input [N-1:0] input_2;
    input         CLK;
    input         RST;
    output reg [(2*N)-1:0] out = 0;
    
    reg [(2*N)-1:0]  A = 0;
    reg [2*N-1:0]    B = 0;
    reg [4:0] i = 0;
//    assign A = {{8'b{input_1[7]}}input_1, input_1};
//    assign B = input_2;
always@(posedge CLK or negedge RST)
begin
    if(!RST) begin
        out <= 0;
        A <= {{8{input_1[7]}}, input_1};
        B <= {{8{input_2[7]}}, input_2};
    end    
    else
    begin
        if(i < 16)
        begin
            
            if(B[0])
            begin
                out <= out + A;
            end
            A = A << 1;
            B = B >> 1;
        end
        i = i+ 1;
    end

end


endmodule
