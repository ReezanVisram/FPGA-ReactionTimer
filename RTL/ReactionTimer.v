`timescale 1ns / 1ps

module ReactionTimer(
    input clk,
    input ck_rst,
    input [3:0] btn,
    output ck_io0,
    output ck_io1,
    output ck_io2,
    output ck_io3,
    output ck_io4,
    output ck_io5,
    output ck_io6,
    output ck_io7,
    output ck_io8,
    output ck_io9,
    output ck_io10,
    output ck_io11,
    output [3:0] leds
  );
  wire [3:0] digits;
  wire clk5Hz;
  wire clk1Hz;
  wire clk1Khz;

  wire waitingToStart;
  wire turnOnLEDForTest;
  wire turnOnDigitsAfterTest;
  wire [12:0] timeElapsed;

  Clk5Hz c5Hz(.clk(clk),
              .clk5Hz(clk5Hz)
             );


  Clk1Hz c1Hz(.clk(clk),
              .clk1Hz(clk1Hz)
             );


  Clk1Khz c1Khz(.clk(clk),
                .clk1Khz(clk1Khz)
               );


  TimerManager tm(
                 .clk(clk),
                 .clk1Khz(clk1Khz),
                 .ck_reset(ck_rst),
                 .reset_n(ck_rst),
                 .btn(btn),
                 .waitingToStart(waitingToStart),
                 .turnOnLEDForTest(turnOnLEDForTest),
                 .turnOnDigitsAfterTest(turnOnDigitsAfterTest),
                 .timeElapsed(timeElapsed)
               );


  LEDBlinker ledb(
               .clk(clk),
               .waitingToStart(waitingToStart),
               .turnOnLEDForTest(turnOnLEDForTest),
               .leds(leds)
             );


  DigitManager dm(
                 .clk5Hz(clk5Hz),
                 .reset_n(turnOnDigitsAfterTest),
                 .w(turnOnDigitsAfterTest),
                 .z(digits)
               );


  SevenSeg ss(.digits(digits),
              .timeToDisplay(timeElapsed),
              .onesDigit(ck_io0),
              .tensDigit(ck_io1),
              .hundredsDigit(ck_io2),
              .thousandsDigit(ck_io3),
              .aSegment(ck_io4),
              .bSegment(ck_io5),
              .cSegment(ck_io6),
              .dSegment(ck_io7),
              .eSegment(ck_io8),
              .fSegment(ck_io9),
              .gSegment(ck_io10),
              .decimalPoint(ck_io11)
             );


endmodule
