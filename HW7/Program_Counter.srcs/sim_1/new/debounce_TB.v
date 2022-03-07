`timescale 1ns / 1ps

module debounce_TB();

    reg   CLK_in = 0;
    reg   button = 0;
    wire  deb_button;

debounce    UUT(CLK_in, button, deb_button);
always #50 CLK_in = ~CLK_in;
initial
begin
    #50000000;
    button = 1;
    #500000000;
    
    button = 0;
    
    #500000000;
    
    button = 1; 

end

endmodule