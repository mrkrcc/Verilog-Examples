`timescale 1ns / 1ps

module multiplier(input_1, input_2 ,RST, CLK, START, out);

parameter N = 8;
    input [N-1:0]    input_1;
    input [N-1:0]    input_2;
    input            RST;
    input            CLK;
    input            START;
    output reg [2*N-1:0] out;

    reg [2*N-1:0] A = 0;
    reg [2*N-1:0] B = 0;
    reg [4:0]     i = 0;
    reg           done = 1;
always@(posedge CLK or negedge RST)
begin
    if(!RST) begin
        out <= 0;
        done = 1;
 //       A <= {{N{input_1[N-1]}}, input_1};
  //      B <= {{N{input_2[N-1]}}, input_2};
    end    
    else
    begin
        if(START & done)
        begin
            A <= {{N{input_1[N-1]}}, input_1};
            B <= {{N{input_2[N-1]}}, input_2}; 
            done = 0;
        end    
        else
        begin
            if(!done)
            begin
                if(i < 2*N)
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
    end
end


endmodule