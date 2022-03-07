`timescale 1ns / 1ps

module key_TB();

    reg [79:0] Key_in;
    reg  [4:0]  Round;
    wire [79:0] Key_out;



Key_Schedule  UUT(Key_in, Round, Key_out);

initial
begin

    Key_in = 80'h00000000000000000000;
    Round = 5'd0;
    
    
    
    #100
    Key_in = 80'h0000000000000000000e;
    Round  = 5'b00001;
    
    
    #100
    Key_in = 80'h0000080000000001c00e;
    Round  = 5'b00010;
    #100
        Key_in = 80'h0000080000000001c00e;
        Round  = 5'b00010;
    #100
    Key_in = 80'h0100100000003801c00e;
    Round  = 5'b00011;
    
end







endmodule
