`timescale 1ns / 1ps

module D_ff(D, RST, CLK, Q);

    input   RST;
    input   D;
    input   CLK;
    output  reg Q;
    
    

    
always@(posedge CLK or posedge RST)
begin

    if(RST)
    begin
        Q = 1'b0;
    end
        
    else
    begin 
        Q = D;
    end
end
    
    
  
endmodule
