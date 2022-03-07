`timescale 1ns / 1ps

module add_subtract(
    input  [7:0]    input_1,
    input  [7:0]    input_2,
    input           SEL,
    output [8:0]  sum
);


reg [8:0]temp;


always@(*)
begin
    if(SEL == 1)
    begin
          temp <= input_1 + input_2;
    end
//    else if(SEL == 0)
    else
    begin
          temp <= input_2 - input_1;
    end
end




endmodule