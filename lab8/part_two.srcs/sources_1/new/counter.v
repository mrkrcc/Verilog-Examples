`timescale 1ns / 1ps


module counter(clock, cnt);

    input             clock;
    output  reg [1:0] cnt = 0 ;
    
    
    
always@(posedge clock) 
begin
    
    cnt <= cnt + 1;
    if(cnt == 3)
    begin
        cnt <= 0;
    end
    
     
end
endmodule
