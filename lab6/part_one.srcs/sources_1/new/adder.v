`timescale 1ns / 1ps

module adder(
    input           CLK,
    input  [7:0]    input_1,
    input  [7:0]    input_2,
    output reg [8:0]    sum = 0
);

always@(*)
begin
    sum <= input_1 + input_2;
end
  
endmodule

