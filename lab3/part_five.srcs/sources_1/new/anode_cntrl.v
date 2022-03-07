`timescale 1ns / 1ps

module anode_cntrl(cnt, ANODES);

    input   [2:0] cnt;
    output  [7:0] ANODES; 

    assign ANODES = (cnt == 3'b000) ? 8'b11111110:
                    (cnt == 3'b001) ? 8'b11111101:
                    (cnt == 3'b010) ? 8'b11111011:
                    (cnt == 3'b011) ? 8'b11110111:
                    (cnt == 3'b100) ? 8'b11101111:
                    (cnt == 3'b101) ? 8'b11011111:
                    8'b11111111;
endmodule
