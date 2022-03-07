`timescale 1ns / 1ps

module part_three_TB();

    reg         CLK_in;
    reg [4:0]   Address = 5'd0;
    reg [3:0]   DataIn = 4'd0;
    reg         write = 0;
    reg         CLK = 0;
    wire  [7:0] ANODE;
    wire  [6:0] out;
    
    
part_three UUT(CLK_in, Address, DataIn, write, CLK, ANODE, out);
always #100 CLK = ~CLK;

initial
begin
    #100
    Address = 5'b10101;
    DataIn  = 4'b0001;
    #500
    write = 1;
    #500
    write = 0;
    
    Address = 5'b10111;
    DataIn  = 4'b0101;
    #100
    write = 1;
    
    #500 write = 0;
   // Address = 5'b10101;
   #500 Address = 5'b10101;
   #500 Address = 5'b10111;
   #100 write = 1;
   #100
   
    Address = 5'b00010;
    DataIn = 4'b1111;
    #500
    write = 0;
    #100
    Address = 5'b10111;
    #500
    Address = 5'b00010;
   
    
    

end

endmodule
