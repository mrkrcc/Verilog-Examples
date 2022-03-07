`timescale 1ns / 1ps


module counter(clock, cnt);

    input             clock;
    output  reg [1:0] cnt = 2'b00 ;
    
    
    
always@(posedge clock) 
begin
    
    cnt <= cnt + 1;
    
     
end
endmodule
