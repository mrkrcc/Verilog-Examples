`timescale 1ns / 1ps

module Program_Counter(
        input         button,
        input         RST,
        input         Branch,
        input         Jump,
        input         JAL,
        input         return,
        input  [7:0]  disp,
        output [5:0]  out
);

reg    [15:0] reg_dest;
reg    [15:0] PC;
wire   [15:0] disp_ext;
//wire          CLK_out;
////wire          deb_button;
//wire   [3:0]  out_2;
//wire   [1:0]  cnt;

//debounce        DB(CLK_in, button, deb_button);

assign disp_ext = {{8{disp[7]}}, disp};

always@(posedge button or negedge RST)
begin
    if(!RST)
    begin
        PC     <= 16'd0;
        reg_dest    <= 16'd0;
    end
    else
    begin
        if(Branch) begin
            PC <= PC + disp_ext;
        end
        else begin
            if(Jump) begin
                PC <= disp_ext;
            end
            else begin
                if(JAL) begin
                    reg_dest <= PC + 1;
                    PC <= disp_ext;
                end
                else begin
                    if(return) begin
                        PC <= reg_dest;
                    end
                    else begin
                        PC <= PC + 1;
                    end
                end
            end
        end
    end
    
end
assign out = PC;



endmodule