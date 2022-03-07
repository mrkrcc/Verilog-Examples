`timescale 1ns / 1ps

module ALU_top(
    input  [15:0] input_A,
    input  [15:0] input_B,
    input  [3:0]  Select,
    output [15:0] S_out,
    output [15:0] PSR_Flag
);

wire [15:0]   Carry;

ALU_logic_func  ALF(input_A, input_B, Select, S_out, Carry);


assign PSR_Flag[0] = (Select == 4'b0100) ? Carry[15] :  //Carry
                     (Select == 4'b0101) ? ~Carry[15]:
                     1'b0;

assign PSR_Flag[2] = (Select == 4'b0010) ? ~Carry[15] : // Low
                     1'b0;

assign PSR_Flag[5] = (Select == 4'b0100) ? Carry[15] ^ Carry[14]:  //Overflow
                     (Select == 4'b0101) ? Carry[15] ^ Carry[14]:
                     1'b0;

assign PSR_Flag[6] = ((S_out == 16'd0) & (Carry[15] == 1'b0)) ? 1'b1: //Zero
                     0;

assign PSR_Flag[7] = (Select == 4'b0101) ? (input_A[14] ^ input_B[14] ^ ~Carry[15]): //Negative
                     1'b0;

assign PSR_Flag[1] = 1'b0;
assign PSR_Flag[4:3] = 2'b00;
assign PSR_Flag[15:8] = 8'd0;                    

endmodule