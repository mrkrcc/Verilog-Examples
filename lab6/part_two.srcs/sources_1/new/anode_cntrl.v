`timescale 1ns / 1ps

module anode_cntrl(cnt, ANODES);

    input   [1:0] cnt;
    output  [7:0] ANODES; 

    assign ANODES = (cnt == 2'b00) ? 8'b11111110:
                    (cnt == 2'b01) ? 8'b11111101:
                    (cnt == 2'b10) ? 8'b11111011:
                    (cnt == 2'b11) ? 8'b11110111:
                    8'b11111111;
endmodule
