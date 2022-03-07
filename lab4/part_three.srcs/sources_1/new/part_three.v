`timescale 1ns / 1ps

module part_three(CLK_in, ANODE, out);

    input        CLK_in;
    output [7:0] ANODE;
    output [6:0] out;
    
    
    wire       ENABLE;
    reg  [3:0] Q;
    
    assign ANODE = 8'b11111110;
    
counter C0(CLK_in, ENABLE);    

always@(posedge ENABLE)
begin 
    if(Q < 10)
        Q = Q + 1;
    else
        Q = 0;
end

seven_segment S0(Q, out);



endmodule
