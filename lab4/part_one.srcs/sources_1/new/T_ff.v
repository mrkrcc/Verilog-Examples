module T_ff(T, CLK, CLR, Q);

    input T;
    input CLK;
    input CLR;
    output reg Q;
    
    
always@(posedge CLK, negedge CLR)
begin
    if(~CLR)
        Q <= 1'b0;
    else
        Q <= T ^ Q;
end 
    
    
    
    
    
    
endmodule