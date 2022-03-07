`timescale 1ns / 1ps

module Register_File(
    input         CLK,
    input  [4:0]  Ra,
    input  [4:0]  Rb,
    input  [4:0]  Rw,
    input         WrEn,
    input  [31:0] busW,
    output [31:0] Adat,
    output [31:0] Bdat
);
reg [9:0] count;
reg  [31:0]  RF[0:31];

integer i;
initial begin
    count = 0;
    for (i=0; i <= 31; i = i+1)
        RF[i] = 0; end

//always@(posedge CLK) begin
//    count <= count + 1; end 


always@(negedge CLK)
begin
    if(WrEn)
    begin
        RF[Rw] <= busW;
    end
//    Adat = RF[Ra];
//    Bdat = RF[Rb];
end

    assign Adat = RF[Ra];
    assign Bdat = RF[Rb];

endmodule