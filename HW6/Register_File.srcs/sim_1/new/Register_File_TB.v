`timescale 1ns / 1ps

module Register_File_TB();

    reg         CLK = 0;
    reg  [3:0]  Ra = 0;
    reg  [3:0]  Rb = 0;
    reg  [3:0]  Rw = 0;
    reg         WrEn = 0;
    reg  [15:0] busW = 0;
    wire [15:0] Adat;
    wire [15:0] Bdat;


Register_File   UUT(CLK, Ra, Rb, Rw, WrEn, busW, Adat, Bdat);

always #50 CLK = ~CLK;

initial begin
#100
    busW = 16'd5;
    Rw   = 4'b0001;
    #100
    
    Ra = 4'b0001;
    
    #100
    WrEn = 1;
    Rw = 4'b1100;
    busW = 16'd10;
    
    #100
    WrEn = 0;
    Rb = 4'b1100;
    
    #200
    
    Rb = 4'b0001;
    #100
    
    WrEn = 1;
    Rw = 4'b1111;
    busW = 16'd5;
    
    #100
    Rw = 4'b1010;
    busW = 16'd9;
    
    #100
    WrEn = 0;
    Ra = 4'b1111;
    Rb = 4'b1010;
    
    #100
    Ra = 4'b1100;
    Rb = 4'b1111;
    #100
        
    WrEn = 1;
    Rw = 4'b0101;
    busW = 16'h00ff;
    
    #100
    Rw = 4'b1001;
    busW = 16'heeee;
    
    #100
    WrEn = 0;
    Ra = 4'b1001;
    Rb = 4'b0101;       


end

endmodule