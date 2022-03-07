`timescale 1ns / 1ps

module register(R, RST, CLK, Q);
parameter N = 8;
    input  [N-1:0]     R;
    input            RST;
    input            CLK;
    output reg [N-1:0] Q = 0;


always@(posedge CLK or negedge RST)
begin
    if(!RST)
        Q <= 0;
    else
        Q <= R;
end
endmodule