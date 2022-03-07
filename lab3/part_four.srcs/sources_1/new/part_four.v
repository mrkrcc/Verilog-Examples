`timescale 1ns / 1ps

module part_four(D, CLK, Q_latch, Q_rising, Q_falling);

    input D;
    input CLK;
    output Q_latch;
    output Q_rising;
    output Q_falling;
D_latch     D0(D, CLK, Q_latch);
D_FF        D1(D, CLK, Q_rising);
D_FF_f_edge D2(D, CLK, Q_falling);

endmodule
