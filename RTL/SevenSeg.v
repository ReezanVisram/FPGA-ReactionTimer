`timescale 1ns / 1ps

module SevenSeg (
    input [3:0] digits,
    output reg ck_io0,
    output reg ck_io1,
    output reg ck_io2,
    output reg ck_io3,
    output reg ck_io4,
    output reg ck_io5,
    output reg ck_io6,
    output reg ck_io7,
    output reg ck_io8,
    output reg ck_io9,
    output reg ck_io10,
    output reg ck_io11
  );

  initial
  begin
    ck_io4 = 1;
    ck_io5 = 1;
    ck_io6 = 1;
    ck_io7 = 1;
    ck_io8 = 1;
    ck_io9 = 1;
    ck_io10 = 1;
    ck_io11 = 1;
  end

  always @( digits )
  begin
    case(digits)
      4'b0000:
      begin
        ck_io0 = 1;
        ck_io1 = 1;
        ck_io2 = 1;
        ck_io3 = 1;
      end
      4'b0001:
      begin
        ck_io0 = 0;
        ck_io1 = 1;
        ck_io2 = 1;
        ck_io3 = 1;
        ck_io4 = 0;
        ck_io5 = 1;
        ck_io6 = 1;
        ck_io7 = 0;
        ck_io8 = 0;
        ck_io9 = 0;
        ck_io10 = 0;
        ck_io11 = 0;
      end
      4'b0010:
      begin
        ck_io0 = 1;
        ck_io1 = 0;
        ck_io2 = 1;
        ck_io3 = 1;
        ck_io4 = 1;
        ck_io5 = 1;
        ck_io6 = 0;
        ck_io7 = 1;
        ck_io8 = 1;
        ck_io9 = 0;
        ck_io10 = 1;
        ck_io11 = 0;
      end
      4'b0100:
      begin
        ck_io0 = 1;
        ck_io1 = 1;
        ck_io2 = 0;
        ck_io3 = 1;
        ck_io4 = 1;
        ck_io5 = 1;
        ck_io6 = 1;
        ck_io7 = 1;
        ck_io8 = 0;
        ck_io9 = 0;
        ck_io10 = 1;
        ck_io11 = 0;
      end
      4'b1000:
      begin
        ck_io0 = 1;
        ck_io1 = 1;
        ck_io2 = 1;
        ck_io3 = 0;
        ck_io4 = 0;
        ck_io5 = 1;
        ck_io6 = 1;
        ck_io7 = 0;
        ck_io8 = 0;
        ck_io9 = 1;
        ck_io10 = 1;
        ck_io11 = 0;
      end
    endcase
  end

endmodule
