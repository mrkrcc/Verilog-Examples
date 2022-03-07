`timescale 1ns / 1ps

module S_Box(
    input  [63:0] S_Box_in,
    output [63:0] S_Box_out
);

genvar i;

generate for (i = 0; i < 16; i = i + 1)
         begin
            S_Box_Layer SB(S_Box_in[4*i+3:4*i], S_Box_out[4*i+3:4*i]);
        end
endgenerate


endmodule
