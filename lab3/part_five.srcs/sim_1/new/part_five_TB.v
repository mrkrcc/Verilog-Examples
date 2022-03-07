`timescale 1ns / 1ps


module part_five_TB();
    
    reg  [7:0] input_1;
    reg        RST;
    reg        CLK;
    reg        CLK_in;    
    wire [7:0] ANODE;
    wire  [6:0] out;

part_five UUT(input_1 ,RST, CLK, CLK_in, ANODE, out)    ;
initial 
begin
    CLK_in = 1'b0;
    CLK    = 1'b0;
    RST    = 1'b0;
end

parameter period = 100;
always #period CLK_in = ~CLK_in ;

initial
begin
        input_1 = 8'b10100011;
        #period;
        
        CLK = 1'b1;
        input_1 = 8'b00000100;
        #period;
        
        input_1 = 8'b00000010;
        #period;
        
        RST = 1'b1;
        #(2*period);
        
        input_1 = 8'b00001000;
        #period;
        
        
        RST = 1'b0;
        #period;
        
        input_1 = 8'b00001001;
        CLK = 1'b0;
        #period;
        
        CLK = 1'b1;
        #period;
        
        input_1 = 8'b00001011;
        

end





endmodule
