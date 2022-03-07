`timescale 1ns / 1ps


module counter(clock, RST, out);

    input      clock;
    input      RST;
    output reg out;   
    
    
    reg [6:0] cnt = 0 ;
    
    
    
always@(posedge clock) 
begin
    if(!RST)
    begin
        if(cnt < 2)
        begin
            cnt = cnt + 1 ;
            out = 0;
        end
        else if(cnt == 2)
        begin
            out = 1;
            cnt = cnt + 1;
        end
        else
        begin
            out = 0;
            cnt = cnt + 1;
        end

    end
    else
    begin
        out = 0;
        cnt = 0;
    end
    
     
end
endmodule
