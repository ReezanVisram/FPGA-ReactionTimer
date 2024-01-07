`timescale 1ns / 1ps

module ReactionTimer(
    input clk,
    input ck_rst,
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
    output led
  );
  wire [3:0] digits;
  wire sclk;
  
  SlowClock sc(clk, sclk);
  
  DigitManager dm(sclk, ck_rst, 1, digits);
  
  SevenSeg ss(digits, ck_io0, ck_io1, ck_io2, ck_io3, ck_io4, ck_io5, ck_io6, ck_io7, ck_io8, ck_io9, ck_io10, ck_io11);
  
  assign led = ck_rst;
endmodule
