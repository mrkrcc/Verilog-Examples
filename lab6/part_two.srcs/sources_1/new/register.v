`timescale 1ns / 1ps

module register(
    input  [7:0]     R,
    input            RST,
    input            CLK,
    output reg [7:0] Q = 0
);


always@(posedge CLK or negedge RST)
begin
    if(!RST)
        Q <= 0;
    else
        Q <= R;
end
endmodule