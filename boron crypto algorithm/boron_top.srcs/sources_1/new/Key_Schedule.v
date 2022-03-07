`timescale 1ns / 1ps

module Key_Schedule(
    input  [79:0] Key_in,
    input  [4:0]  Round,
    output  [79:0] Key_out
);

wire [79:0] temp;
wire [79:0] Key_Register;
wire [3:0]  SBL_out;
wire [4:0]  round_key;

S_Box_Layer SBL(Key_in[70:67],SBL_out);

assign  temp = {Key_in[66:0], Key_in[79:67]};

assign  round_key = temp[63:59] ^ Round;

assign  Key_Register = {temp[79:64], round_key, temp[58:4], SBL_out};



assign  Key_out = Key_Register;
endmodule