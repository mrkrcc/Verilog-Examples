`timescale 1ns / 1ps

module part_one_TB();

    reg     [3:0] i_A ;
    reg     [3:0] i_B ;
    reg           i_C ;
    wire    [3:0] o_S ;
    wire          o_C ;
    wire    [2:0] w_C ;

part_one UUT(i_A, i_B, i_C, o_S, o_C);

    parameter period = 100;

    initial
        begin
            i_A = 4'b0010;
            i_B = 4'b0101;
            i_C = 1'b0;
            #period
            
            i_A = 4'b1010;
            i_B = 4'b1001;
            i_C = 1'b0;
            #period
            
            i_A = 4'b0000;                    
            i_B = 4'b0101;                        
            i_C = 1'b1;
            #period
            
            i_A = 4'b0000;                    
            i_B = 4'b0000;                        
            i_C = 1'b1;           
            
        end
endmodule
