module n_bit_counter(Clock, Reset_n, ENABLE, Q);

    parameter n = 4;
    parameter k = 10;

    input Clock, Reset_n;
    output reg [n-1:0] Q = 0;
    output reg ENABLE = 0;

    
always @(posedge Clock or negedge Reset_n)
begin
    if (!Reset_n)
    begin
        Q = 0;
        ENABLE <= 1'b0;
    end
    else if(Q < k-1)
    begin
        ENABLE = 1'b0;
        Q = Q + 1;
        
    end
    else
    begin 
        Q = 4'b0000;
        ENABLE = 1'b1;
    end
end
endmodule