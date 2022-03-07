
module part_two(CLK_in, CLK, CLR, ANODE, out);

    input        CLK;
    input        CLR;
    input        CLK_in;
    output [7:0] ANODE;
    output [6:0] out;
    
    wire CLK_out;
    wire [1:0] cnt;
    wire [3:0] num;
    reg  [15:0] Q;
    
    always@(posedge CLK)
    begin
        if(!CLR)         
                Q <= 0;
        else    
                Q <= Q + 1;
    end 
    
    clock_divider       CD(CLK_in, CLK_out);
    counter             CT(CLK_out, cnt);
    anode_cntrl         AC(cnt, ANODE);
    
    decoder             D0(ANODE, Q, num);
    seven_segment       SS(num, out);
    
endmodule
