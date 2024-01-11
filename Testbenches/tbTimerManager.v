`timescale 1s / 1ps

module tbTimerManager();

  // Registers
  reg sclk = 0;
  wire [3:0] leds;

  parameter sclk_period = 5;

  // UUT
  TimerManager tm(sclk, leds);

  always
  begin
    #(sclk_period/2) sclk = ~sclk;
  end

endmodule
