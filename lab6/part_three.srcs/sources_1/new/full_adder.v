

module full_adder(
    input   A,
    input   B,
    input   C_in,
    output  sum,
    output  carry
);


    wire    w1;
    wire    w2;
    wire    w3;
    wire    w4;
    
    half_adder HA1(A, B, w1, w2);
    half_adder HA2(C_in, w1, sum, w4);
    assign carry = w2 | w4;
endmodule
