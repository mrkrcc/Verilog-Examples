`timescale 1ns / 1ps

module debounce(
    input   CLK_in,
    input   button,
    output  deb_button
);

reg [3:0] D;
reg [2:0] cnt = 3'b000;
wire      CLK_out;

clock_divider CD(CLK_in, CLK_out);
    defparam CD.divisor = 28'd2524288;

always@(posedge CLK_out)
begin
    if(cnt < 3)
        cnt <= cnt + 1;
    else
        cnt <= 3'b0;
end

always@(posedge CLK_out)
begin
    if(button)
        D[cnt] <= button;
    else
        D[cnt] <= 1'b0;
end

assign deb_button = D[3] & D[2] & D[1] & D[0];

endmodule