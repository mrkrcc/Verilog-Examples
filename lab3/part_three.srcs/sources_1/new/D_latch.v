`timescale 1ns / 1ps

module D_latch(D, Clk, Q);

    input Clk; 
    input D; 
    output Q;

    wire R_g;
    wire S_g; 
    wire Qa /* synthesis keep */ ; 
    wire Qb /* synthesis keep */ ;


    assign S_g = ~(D & Clk);
    assign R_g = ~(~D & Clk);
    assign Qa  = ~(Qb & S_g);
    assign Qb  = ~(Qa & R_g);
    assign Q = Qa;



endmodule
