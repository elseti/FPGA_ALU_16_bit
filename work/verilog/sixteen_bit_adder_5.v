/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module sixteen_bit_adder_5 (
    input [15:0] x,
    input [15:0] y,
    input cin,
    output reg [15:0] s,
    output reg [3:0] error,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg lastSum;
  
  reg [15:0] sum;
  
  always @* begin
    error = 4'h0;
    
    case (cin)
      1'h0: begin
        s = x + y;
        sum = x + y;
      end
      1'h1: begin
        s = x - y;
        sum = x - y;
      end
      default: begin
        s = 16'h0000;
        sum = 16'h0000;
      end
    endcase
    if (x >= 16'h4000 && y >= 16'h4000 && cin == 1'h0) begin
      error = 4'hf;
      s = 16'h0000;
    end
    if (((x > 16'hc000 && y >= 16'hc000) | (x >= 16'hc000 && y > 16'hc000)) && cin == 1'h1) begin
      error = 4'hf;
      s = 16'h0000;
    end
    lastSum = sum[15+0-:1];
    z = ~(|(sum[0+7-:8] || sum[8+7-:8]));
    v = x[15+0-:1] & (y[15+0-:1] ^ cin) & ~lastSum | ~x[15+0-:1] & ~(y[15+0-:1] ^ cin) & lastSum;
    n = sum[15+0-:1];
  end
endmodule
