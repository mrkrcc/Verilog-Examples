`timescale 1ns / 1ps

module Program_Counter_TB();

        reg         CLK = 0;
        reg         RST = 1;
        reg         Branch = 0;
        reg  [7:0]  disp;
        reg         Jump = 0;
        reg         JAL = 0;
        reg         return = 0;
        wire  [15:0] out;

Program_Counter     UUT(CLK, RST, Branch, disp, Jump, JAL, return, out);
always #50 CLK = ~CLK;
initial
begin
    #50
    RST = 0;
    #50
    RST = 1;

    #350
    disp = 8'd9;
    Branch = 1'b1;

    #100

    Branch = 1'b0;

    #100

    JAL = 1'b1;
    Jump = 1'b0;
    #50
    JAL = 1'b0;
    #200

    Jump = 1'b1;
    
    #100
    Jump = 1'b0;
    return = 1'b1;

end

endmodule