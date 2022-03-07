`timescale 1ns / 1ps


module counter(clock, cnt);

    input             clock;
    output  reg [2:0] cnt = 3'b000 ;
    
    
    
always@(posedge clock) 
begin
    if(cnt < 5)
        cnt <= cnt + 1;
    else 
        cnt <= 3'b000;
    
     
end
endmodule
