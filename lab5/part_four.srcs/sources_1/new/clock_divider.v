`timescale 1ns / 1ps

module clock_divider(clock_in, clock_out);
    
    
    parameter divisor = 28'd50000000; 
    input       clock_in;
    output reg  clock_out;
    
    
    
    
    reg [27:0]  counter = 28'd0;
    
        

    
always@(posedge clock_in)
begin
    counter <= counter + 28'd1;
    if(counter >= (divisor -1))
        counter <= 28'd0;
    clock_out <= (counter<divisor/2)? 1'b0:
                  1'b1;
end
endmodule
