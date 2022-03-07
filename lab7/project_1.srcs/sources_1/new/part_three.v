`timescale 1ns / 1ps

module part_three(
    input            CLK_in,
    input            RST,
    input            input_W,
    output     [3:0] LED,
    output reg       LED9       
);

reg   [3:0]   current_state;
reg   [3:0]   next_state;

parameter      state_A = 4'b0000,
               state_B = 4'b0001,
               state_C = 4'b0010,
               state_D = 4'b0011,
               state_E = 4'b0100,
               state_F = 4'b0101,
               state_G = 4'b0110,
               state_H = 4'b0111,
               state_I = 4'b1000;

always@(posedge CLK_in or negedge RST)
begin
    if(!RST)
        current_state <= state_A;
    else
        current_state <= next_state;
end

always@(current_state or input_W)
begin: NEXT_STATE_LOGIC
    case(current_state)
        state_A : if(input_W == 1'b0) begin
                        next_state = state_B;
                  end else
                        next_state = state_F;
        state_B : if(input_W == 1'b0) begin
                        next_state = state_C;
                  end else
                        next_state = state_F;
        state_C : if(input_W == 1'b0)
                        next_state = state_D;
                  else
                        next_state = state_F;
        state_D : if(input_W == 1'b0)
                        next_state = state_E;
                  else
                        next_state = state_F;
        state_E : if(input_W == 1'b0)
                        next_state = state_E;
                  else
                        next_state = state_F;
        state_F : if(input_W == 1'b0)
                        next_state = state_B;
                  else  
                        next_state = state_G;
        state_G : if(input_W == 1'b0)
                        next_state = state_B;
                  else
                        next_state = state_H;
        state_H : if(input_W == 1'b0)
                        next_state = state_B;
                  else
                        next_state = state_I;
        state_I : if(input_W == 1'b0)
                        next_state = state_B;
                  else
                        next_state = state_I;
        default : next_state = state_A;
    endcase
end

always@(current_state or input_W)
    begin: OUTPUT_LOGIC
        case(current_state)
            state_E : if(input_W == 1'b0)
                            LED9 = 1'b1;
                      else
                            LED9 = 1'b0;
            state_I : if(input_W == 1'b0)
                            LED9 = 1'b0;
                      else
                            LED9 = 1'b1;
            default : begin
                            LED9 = 1'b0;
                      end
        endcase
end

    assign  LED[3:0] = (current_state == state_A) ?  4'b0000:
                       (current_state == state_B) ?  4'b0001:
                       (current_state == state_C) ?  4'b0010:
                       (current_state == state_D) ?  4'b0011:
                       (current_state == state_E) ?  4'b0100:
                       (current_state == state_F) ?  4'b0101:
                       (current_state == state_G) ?  4'b0110:
                       (current_state == state_H) ?  4'b0111:
                       (current_state == state_I) ?  4'b1000:
                        9'b000000000;

endmodule