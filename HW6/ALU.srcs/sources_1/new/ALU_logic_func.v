`timescale 1ns / 1ps

module ALU_logic_func(
    input  [15:0] input_A,
    input  [15:0] input_B,
    input  [3:0]  Select,
    output [15:0] out,
    output [15:0] Carry
);

wire [16:0] C_in;
wire [15:0] A;
wire [15:0] B;
wire [15:0] C_out;
wire [15:0] Sum;
wire [15:0] S_out;

assign A = input_A;

assign B = (Select[0] == 0) ? input_B :
           ~input_B;

assign C_in[0] =   (Select[2:1] == 2'b00) ? 1'b0:
                   (Select[2:1] == 2'b01) ? 1'b1:
                   (Select[2:1] == 2'b10) ? Select[0]:
                   input_B[0];

genvar i;

generate for (i = 0; i < 16; i = i + 1)
         begin
            assign C_in[i+1] =   (Select[2:1] == 2'b00) ? 1'b0:
                                 (Select[2:1] == 2'b01) ? 1'b1:
                                 (Select[2:1] == 2'b10) ? C_out[i]:
                                 input_B[i+1];

            full_adder FA(A[i], B[i], C_in[i], Sum[i], C_out[i]);

            assign S_out[i] = (Select[3] == 0) ? Sum[i]:
                              C_out[i];   
         end
endgenerate

assign out = (Select == 4'b1111) ? input_B:
             (Select == 4'b0001) ? input_A:
             S_out;

assign Carry = C_out;

endmodule
