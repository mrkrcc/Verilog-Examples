`timescale 1ns / 1ps

module part_two(
    input         CLK_in,
    input         input_W,
    output [1:0]  LED
    );
    
    
    reg [3:0] out;
    reg [3:0] out_2;

    
always@(posedge CLK_in)
begin
    out[0] <= out[1];
    out[1] <= out[2];
    out[2] <= out[3];
    out[3] <= input_W;
    
    out_2[0] <= out_2[1];
    out_2[1] <= out_2[2];
    out_2[2] <= out_2[3];
    out_2[3] <= input_W;
      
    
//    if(out == 4'b0000) begin
//        LED[0] <= 1'b1;
//        LED[1] <= 1'b0;
//    end else if(out_2 == 4'b1111) begin
//        LED[0] <= 1'b0;
//        LED[1] <= 1'b1;
//    end else
//        LED <= 2'b00;
end

    assign LED = (out == 4'b0000) ? 2'b01:
                 (out_2 == 4'b1111) ? 2'b10:
                  2'b00;







endmodule