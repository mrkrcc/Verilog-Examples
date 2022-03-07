module n_bit_counter(Clock, Reset_n, preset, SW, STOP, ENABLE, Q);

    parameter n = 4;
    parameter k = 10;

    input  Clock, Reset_n, STOP, preset;
    input [3:0] SW; 
    output reg [n-1:0] Q = 0;
    output reg ENABLE = 0;



always @(posedge Clock or posedge preset)
begin
    if(!Reset_n)
    begin
        Q <= 4'b0;
        ENABLE <= 0;
    end   
    else
    begin
        if(Q < k -1)
        begin
            if(preset)
            begin
                Q <= SW;
            end
            else
            begin           
                if(STOP)
                begin
                    Q <= Q;
                end
                else 
                begin
                    ENABLE <= 1'b0;
                    Q <= Q + 1;
                end
            end
        end
        else
        begin
            Q <= 4'b0000;
            ENABLE <= 1'b1;
        end
    end
end
endmodule