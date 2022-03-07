`timescale 1ns / 1ps

module anode_cntrl(cnt, ANODES);

    input         cnt;
    output  [7:0] ANODES; 

    assign ANODES = (cnt == 1'b0) ? 8'b11111110:
                    (cnt == 1'b1) ? 8'b11111101:                   
                    8'b11111111;
endmodule
