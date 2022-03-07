`timescale 1ns / 1ps

module part_one_TB();

    parameter n = 8;
    parameter period = 25;

    reg           CLK;
    reg           RST = 0;
    wire          rollover;
    wire [n-1:0]  Q;
    
part_one UUT(CLK, RST, rollover, Q);

initial
begin
    CLK = 1'b0;
    RST = 1'b1;
end

always #period CLK = ~CLK ;

initial
begin
    #period
    RST = 1'b0;
    #period
    RST = 1'b1;

end


endmodule
