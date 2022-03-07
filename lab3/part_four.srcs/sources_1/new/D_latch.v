module D_latch (D, CLK, Q);


    input D;
    input CLK;
    output reg Q;
    always @ (D, CLK)
        if (CLK)
            Q = D;
endmodule