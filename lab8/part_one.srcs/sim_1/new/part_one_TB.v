`timescale 1ns / 1ps

module part_one_TB();

    reg [4:0]  Address = 0;
    reg [3:0]  DataIn = 0;
    reg write = 0;
    reg        CLK = 0;
    wire [3:0] Dataout;

part_one UUT(Address, DataIn, write, CLK, Dataout);
always #100 CLK =  ~CLK;

initial 
begin
    #100
    Address = 5'b01000;
    DataIn  = 4'b1111;
    #500
    write = 1;
    #500
    write = 0;
    
    Address = 5'b00100;
    DataIn  = 4'b1001;
    #100
    write = 1;
    
    #500 write = 0;
   // Address = 5'b10101;
   #500 Address = 5'b01000;
   #500 Address = 5'b00100;
   #100 write = 1;
   #100
   
    Address = 5'b10000;
    DataIn = 4'b1000;
    #500
    write = 0;
    #100
    Address = 5'b01000;
    #500
    Address = 5'b10000;

end

endmodule