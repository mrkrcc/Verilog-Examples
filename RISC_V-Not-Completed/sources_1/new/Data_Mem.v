module Data_Mem(clk, we, address, din, dout);

    input clk;
    input we;
    input [4:0] address;
    input [31:0] din;
    output [31:0] dout;

    reg [31:0] RAM[0:31];
    reg [4:0] read_addr;

always @(posedge clk) begin
    if (we == 1'b1)
    begin
        RAM[address] <= din;
    end
    read_addr <= address;
end

    assign dout = RAM[read_addr];

endmodule