`timescale 1ns / 1ps

module part_three(D, CLK, Q);

    input   D;
    input   CLK;
    output  Q;
    
    
    wire not_CLK;
    wire Q_master;
    wire Q_slave;
    
    assign not_CLK = ~CLK;
    
D_latch D0(D, not_CLK, Q_master);
D_latch D1(Q_master, CLK, Q_slave);

    assign Q        = Q_slave;
    
  
endmodule
