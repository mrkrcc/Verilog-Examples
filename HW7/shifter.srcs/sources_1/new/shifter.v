`timescale 1ns / 1ps

module shifter(
    input  [15:0] input_A,
    input  [2:0]  times_direc,    // 0 = 1 time  1 = 2 times    // 0 = left  1 = right
    output [15:0] shifted_A
);

wire [15:0] deneme;

assign deneme = {input_A[14:0], 1'b0};
assign shifted_A = (times_direc == 3'b000) ? deneme:
                   (times_direc == 3'b001) ? {input_A[13:0], 2'b00}:
                   (times_direc == 3'b010) ? {1'b0, input_A[15:1]}:
                   (times_direc == 3'b011) ? {2'b00, input_A[15:2]}:
                   input_A;

//always@(posedge CLK) 
//begin
//    if(direc == 1'b0)
//    begin
//        if(times == 1'b0)
//            shifted_A <= {input_A[14:0], 1'b0};
//        else
//            shifted_A <= {input_A[13:0], 2'b00};
//    end
//    else
//    begin
//        if(times == 1'b0)
//            shifted_A <= {1'b0, input_A[15:1]};
//        else
//            shifted_A <= {2'b00, input_A[15:2]};
//    end
//end

endmodule