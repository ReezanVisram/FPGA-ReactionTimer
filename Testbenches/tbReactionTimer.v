`timescale 1ns / 1ps

module tbReactionTimer();

  // Registers
  reg clk = 0;
  reg ck_rst;
  reg [3:0] btn;

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
  wire [3:0] leds;

  parameter clk_period = 10;

  // UUT
  ReactionTimer rt(
                  .clk(clk),
                  .ck_rst(ck_rst),
                  .btn(btn),
                  .ck_io0(ck_io0),
                  .ck_io1(ck_io1),
                  .ck_io2(ck_io2),
                  .ck_io3(ck_io3),
                  .ck_io4(ck_io4),
                  .ck_io5(ck_io5),
                  .ck_io6(ck_io6),
                  .ck_io7(ck_io7),
                  .ck_io8(ck_io8),
                  .ck_io9(ck_io9),
                  .ck_io10(ck_io10),
                  .ck_io11(ck_io11),
                  .leds(leds)
                );

  initial
  begin
    ck_rst = 1;
    btn = 4'b0000;
    #10000 ck_rst = 0;
    #1000000 ck_rst = 1;
    wait(rt.leds[1] == 0 && rt.leds[0] == 1);
    #200000000 btn = 4'b0001;
    #60000000 $finish;
  end

  always
  begin
    #(clk_period/2) clk = ~clk;
  end

endmodule
