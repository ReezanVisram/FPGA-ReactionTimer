`timescale 1ns / 1ps

module SevenSegDecoder(
    input [3:0] digit,
    output reg [6:0] segments
  );

  always @( * )
  begin
    case(digit)
      4'b0000:
        segments = 7'b0000000;
      4'b0001:
        segments = 7'b0110000;
      4'b0010:
        segments = 7'b1101101;
      4'b0011:
        segments = 7'b1111001;
      4'b0100:
        segments = 7'b0110011;
      4'b0101:
        segments = 7'b1011011;
      4'b0110:
        segments = 7'b1011111;
      4'b0111:
        segments = 7'b1110000;
      4'b1000:
        segments = 7'b1111111;
      4'b1001:
        segments = 7'b1111011;
      4'b1010:
        segments = 7'b1110111;
      4'b1011:
        segments = 7'b0011111;
      4'b1100:
        segments = 7'b1001110;
      4'b1101:
        segments = 7'b0111101;
      4'b1110:
        segments = 7'b1001111;
      4'b1111:
        segments = 7'b1000111;
    endcase
  end

endmodule
