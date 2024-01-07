`timescale 1ns / 1ps

module tbReactionTimer();

  // Registers
  reg clk = 0;
  reg ck_rst;
  wire ck_io0;
  wire ck_io1;
  wire ck_io2;
  wire ck_io3;
  wire ck_io4;
  wire ck_io5;
  wire ck_io6;
  wire ck_io7;
  wire ck_io8;
  wire ck_io9;
  wire ck_io10;
  wire ck_io11;

  parameter clk_period = 10;

  // UUT
  ReactionTimer rt(clk, ck_rst, ck_io0, ck_io1, ck_io2, ck_io3, ck_io4, ck_io5, ck_io6, ck_io7, ck_io8, ck_io9, ck_io10, ck_io11);

  initial
  begin
    ck_rst = 0;
    #10 ck_rst = 1;
  end

  always
  begin
    #(clk_period/2) clk = ~clk;
  end

endmodule
