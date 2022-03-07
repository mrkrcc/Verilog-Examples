`timescale 1ns / 1ps

module part_one(ENABLE, CLK, CLK_in, CLR, ANODE, out);

    input   ENABLE;
    input   CLK_in;
    input   CLK;
    input   CLR;
    output  [7:0] ANODE;
    output  [6:0] out;
    
    wire [7:0] wire_Q;
    wire       CLK_out;
    wire       cnt;
    wire [3:0] num;
    
T_ff T0(ENABLE, CLK, CLR, wire_Q[0]);
T_ff T1((ENABLE & wire_Q[0]), CLK, CLR, wire_Q[1]);
T_ff T2((ENABLE & wire_Q[0] & wire_Q[1]), CLK, CLR, wire_Q[2]);
T_ff T3((ENABLE & wire_Q[0] & wire_Q[1] & wire_Q[2]), CLK, CLR, wire_Q[3]);
T_ff T4((ENABLE & wire_Q[0] & wire_Q[1] & wire_Q[2] & wire_Q[3]), CLK, CLR, wire_Q[4]);
T_ff T5((ENABLE & wire_Q[0] & wire_Q[1] & wire_Q[2] & wire_Q[3] & wire_Q[4]), CLK, CLR, wire_Q[5]);
T_ff T6((ENABLE & wire_Q[0] & wire_Q[1] & wire_Q[2] & wire_Q[3] & wire_Q[4] & wire_Q[6]), CLK, CLR, wire_Q[6]);
T_ff T7((ENABLE & wire_Q[0] & wire_Q[1] & wire_Q[2] & wire_Q[3] & wire_Q[4] & wire_Q[5] & wire_Q[6]), CLK, CLR, wire_Q[7]);


clock_divider CD(CLK_in, CLK_out);
counter       C(CLK_out, cnt);
anode_cntrl   A0(cnt, ANODE);
decoder       D0(ANODE, wire_Q, num);
seven_segment S0(num, out);





endmodule
