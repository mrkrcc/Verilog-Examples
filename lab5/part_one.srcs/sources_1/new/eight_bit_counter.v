module eight_bit_counter(Clock, Reset_n, rollover, Q);

    parameter n = 8;
    parameter k = 10;

    input Clock, Reset_n;
    output reg [n-1:0] Q;
    output reg rollover;

    
always @(posedge Clock or negedge Reset_n)
begin
    if (!Reset_n)
    begin
        Q = 0;
        rollover <= 1'b0;
    end
    else if(Q == k-1)
    begin
        Q = 0;
        rollover = 1'b1;
    end
    else
        Q = Q + 1;
end
endmodule