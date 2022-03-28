/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module sixteen_boolean_6 (
    input [3:0] alufnsig,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] s
  );
  
  
  
  always @* begin
    
    case (alufnsig)
      4'h8: begin
        s = a & b;
      end
      4'he: begin
        s = a | b;
      end
      4'h6: begin
        s = a ^ b;
      end
      4'ha: begin
        s = a;
      end
      default: begin
        s = 16'h0000;
      end
    endcase
  end
endmodule
