`timescale 1ns / 1ps

module shifter(
    input         CLK,
    input         RST,
    input         STORE,
    input         ENABLE,
    input  [10:0] input_1,
    output reg    out = 0
);
 //   reg  DISPLAY; //= 0;
    reg  [10:0] letter = 11'd0;

//always@(posedge ENABLE)
//begin
 //   DISPLAY = 1;
   // letter = input_1;
//end


always@(posedge CLK ) 
begin


    if(ENABLE)
        if(!RST)
        begin
            if(STORE)
            begin
                letter = input_1;
            end
            else
            begin
                out = letter[0];
                letter = letter >> 1;
            end
        end
        else
        begin
            letter = 11'd0;
            out    = 0;
        end        
    
    
//   if(!RST)
//   begin
//       if(ENABLE)
//       begin
//           DISPLAY = 1;
//           letter = input_1;
//       end
//       else
//       begin
//           if(DISPLAY)
//           begin
//               out = letter[0];
//               letter = letter >> 1;
//           end
//       end    
//   end
//   else
//   begin
//       out = 0;
//       DISPLAY = 0;
//       letter = 11'b0;
//   end
end
endmodule