`timescale 1ns / 1ps

module part_one(
    input [4:0]  Address,
    input [3:0]  DataIn,
    input        write,
    input        CLK,
    output  [3:0] Dataout
);
    reg       ENABLE = 1;
//    reg [3:0] RW[0:3];
//    reg [3:0] Dataout_r;
    
blk_mem_gen_0 BRAM(CLK, ENABLE, write, Address, DataIn, Dataout);

//always@(posedge CLK)
//begin

//        if(write)
//            RW[Address] = DataIn;
//        else
//            Dataout <= RW[Address];     
//end

endmodule