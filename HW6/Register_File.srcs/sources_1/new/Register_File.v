`timescale 1ns / 1ps

module Register_File(
    input         CLK,
    input  [3:0]  Ra,
    input  [3:0]  Rb,
    input  [3:0]  Rw,
    input         WrEn,
    input  [15:0] busW,
    output [15:0] Adat,
    output [15:0] Bdat,
    output [15:0] R0
);


reg  [15:0]  RF[15:0];


always@(posedge CLK)
begin
    if(WrEn)
    begin
        RF[Rw] <= busW;
    end
end
assign Adat = RF[Ra];
assign Bdat = RF[Rb];
assign R0 = RF[0];
endmodule