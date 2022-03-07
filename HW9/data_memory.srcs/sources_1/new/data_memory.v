module data_memory (clk, we, a, di, do);

    input clk;
    input we;
    input [3:0] a;
    input [15:0] di;
    output [15:0] do;

    reg [15:0] RAM[0:31];
    reg [3:0] read_addr;

always @(posedge clk) begin
    if (we == 1'b1)
    begin
        RAM[a] <= di;
    end
    read_addr <= a;
end

    assign do = RAM[read_addr];

endmodule