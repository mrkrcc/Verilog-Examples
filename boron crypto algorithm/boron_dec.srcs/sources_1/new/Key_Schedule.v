`timescale 1ns / 1ps

module Key_Schedule(
    input         en,
    input  [79:0] Key_in,
    input  [4:0]  Round,
    output  [79:0] Key_out
);

wire [79:0] temp;
wire [79:0] temp2;
wire [79:0] Key_Register;
wire [79:0] Key_Register2;
wire [3:0]  SBL_out;
wire [3:0]  SBL2_out;
wire [4:0]  round_key;
wire [4:0]  round_key2;

S_BOX SBR(Key_in[70:67],SBL_out);

assign  round_key2 = Key_in[63:59] ^ Round ;

S_BOX_Rev SBR2(Key_in[3:0], SBL2_out);

assign temp2 = {Key_in[79:64], round_key2, Key_in[58:4], SBL2_out};

assign  temp = {Key_in[66:0], Key_in[79:67]};

assign  Key_Register2 = {temp2[12:0], temp2[79:13]};


assign  round_key = temp[63:59] ^ Round;


assign  Key_Register = {temp[79:64], round_key, temp[58:4], SBL_out};

//assign  Key_Register2 = {temp2[79:71], SBL2_out, temp2[66:52], round_key2, temp2[46:0]};

assign  Key_out = (en == 1) ? Key_Register:
                   Key_Register2;

endmodule