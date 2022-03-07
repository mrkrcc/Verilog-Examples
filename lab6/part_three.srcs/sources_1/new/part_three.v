`timescale 1ns / 1ps

module part_three(
    input        CLK_in,
    input  [3:0] input_A,
    input  [3:0] input_B,
    output [6:0] out,
    output [7:0] ANODE
);

    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;
    wire t1, t2, t3, t4, t5, t6;
    wire p00, p10, p20, p30, p01, p11, p21, p31, p02, p12, p22, p32, p03, p13, p23, p33;
    wire        CLK_out;
    wire [1:0]  cnt;
    wire [7:0]  out_2;
    wire [3:0]  out_d;
    
    assign p00 = input_A[0] & input_B[0];  assign p01 = input_A[0] & input_B[1];
    assign p10 = input_A[1] & input_B[0];  assign p11 = input_A[1] & input_B[1];
    assign p20 = input_A[2] & input_B[0];  assign p21 = input_A[2] & input_B[1];
    assign p30 = input_A[3] & input_B[0];  assign p31 = input_A[3] & input_B[1];
    
    assign p02 = input_A[0] & input_B[2];  assign p03 = input_A[0] & input_B[3];
    assign p12 = input_A[1] & input_B[2];  assign p13 = input_A[1] & input_B[3];
    assign p22 = input_A[2] & input_B[2];  assign p23 = input_A[2] & input_B[3];
    assign p32 = input_A[3] & input_B[2];  assign p33 = input_A[3] & input_B[3];
    
    assign out_2[0] = p00;

    full_adder FA1(p01,p10,1'b0,out_2[1],c1);
    full_adder FA2(p11,p20,1'b0,t1,c2);
    full_adder FA3(p21,p30,1'b0,t2,c3);
    
    full_adder FA4(t1,c1,p02,out_2[2],c4);
    full_adder FA5(t2,c2,p12,t3,c5);
    full_adder FA6(p31,c3,p22,t4,c6);
    
    full_adder FA7(t3,c4,p03,out_2[3],c7);
    full_adder FA8(t4,c5,p13,t5,c8);
    full_adder FA9(p32,c6,p23,t6,c9);
    
    full_adder FA10(t5,c7,1'b0,out_2[4],c10);
    full_adder FA11(t6,c8,c10,out_2[5],c11);
    full_adder FA12(p33,c9,c11,out_2[6],out_2[7]);

    clock_divider   CD1(CLK_in, CLK_out);
    counter         NC3(CLK_out, cnt);
    anode_cntrl     AC(cnt, ANODE);
    decoder         D(ANODE, input_A, input_B, out_2, out_d);
    seven_segment   SS(out_d, out);



endmodule