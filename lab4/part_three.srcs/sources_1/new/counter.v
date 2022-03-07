`timescale 1ns / 1ps

module counter(CLK_in, ENABLE);

    input       CLK_in;
    output  reg ENABLE;
    
    reg [27:0] counter;
    parameter constant = 28'd10000000;    
always@(posedge CLK_in)
begin 
    
    if(counter < (constant - 1))
    begin
        ENABLE = 1'b0;
        counter = counter + 1;
    end
    else
    begin
        ENABLE = 1'b1;
        counter = 28'd0;
    end
end
endmodule
