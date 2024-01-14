`timescale 1ns / 1ps

module SevenSeg (
    input [3:0] digits,
    input [12:0] timeToDisplay,
    output reg onesDigit,
    output reg tensDigit,
    output reg hundredsDigit,
    output reg thousandsDigit,
    output reg aSegment,
    output reg bSegment,
    output reg cSegment,
    output reg dSegment,
    output reg eSegment,
    output reg fSegment,
    output reg gSegment,
    output reg decimalPoint
  );

  reg [3:0] digitToDisplay;
  wire [6:0] segmentsToDisplay;
  SevenSegDecoder ssd(.digit(digitToDisplay), .segments(segmentsToDisplay));

  initial
  begin
    aSegment = 1;
    bSegment = 1;
    cSegment = 1;
    dSegment = 1;
    eSegment = 1;
    fSegment = 1;
    gSegment = 1;
    decimalPoint = 1;
  end

  always @( digits )
  begin
    case(digits)
      4'b0000:
      begin
        onesDigit = 1;
        tensDigit = 1;
        hundredsDigit = 1;
        thousandsDigit = 1;
      end
      4'b0001:
      begin
        onesDigit = 0;
        tensDigit = 1;
        hundredsDigit = 1;
        thousandsDigit = 1;
        digitToDisplay = timeToDisplay % 10;
        aSegment = segmentsToDisplay[6];
        bSegment = segmentsToDisplay[5];
        cSegment = segmentsToDisplay[4];
        dSegment = segmentsToDisplay[3];
        eSegment = segmentsToDisplay[2];
        fSegment = segmentsToDisplay[1];
        gSegment = segmentsToDisplay[0];
        decimalPoint = 0;
      end
      4'b0010:
      begin
        onesDigit = 1;
        tensDigit = 0;
        hundredsDigit = 1;
        thousandsDigit = 1;
        digitToDisplay = (timeToDisplay % 100) / 10;
        aSegment = segmentsToDisplay[6];
        bSegment = segmentsToDisplay[5];
        cSegment = segmentsToDisplay[4];
        dSegment = segmentsToDisplay[3];
        eSegment = segmentsToDisplay[2];
        fSegment = segmentsToDisplay[1];
        gSegment = segmentsToDisplay[0];
        decimalPoint = 0;
      end
      4'b0100:
      begin
        onesDigit = 1;
        tensDigit = 1;
        hundredsDigit = 0;
        thousandsDigit = 1;
        digitToDisplay = (timeToDisplay % 1000) / 100;
        aSegment = segmentsToDisplay[6];
        bSegment = segmentsToDisplay[5];
        cSegment = segmentsToDisplay[4];
        dSegment = segmentsToDisplay[3];
        eSegment = segmentsToDisplay[2];
        fSegment = segmentsToDisplay[1];
        gSegment = segmentsToDisplay[0];
        decimalPoint = 0;
      end
      4'b1000:
      begin
        onesDigit = 1;
        tensDigit = 1;
        hundredsDigit = 1;
        thousandsDigit = 0;
        digitToDisplay = timeToDisplay / 1000;
        if (digitToDisplay == 0)
        begin
          aSegment = 0;
          bSegment = 0;
          cSegment = 0;
          dSegment = 0;
          eSegment = 0;
          fSegment = 0;
          gSegment = 0;
          decimalPoint = 0;
        end
        else
        begin
          aSegment = segmentsToDisplay[6];
          bSegment = segmentsToDisplay[5];
          cSegment = segmentsToDisplay[4];
          dSegment = segmentsToDisplay[3];
          eSegment = segmentsToDisplay[2];
          fSegment = segmentsToDisplay[1];
          gSegment = segmentsToDisplay[0];
          decimalPoint = 0;
        end

      end
    endcase
  end

endmodule
