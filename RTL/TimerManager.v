`timescale 1ns / 1ps

module TimerManager(
    input clk,
    input clk1hz,
    input ck_reset,
    output reg [3:0] leds
  );

  reg [3:0] leds_val = 4'b1111;
  initial
  begin
    leds = leds_val;
  end
  always @(posedge clk1hz)
  begin
    leds = leds_val;
    leds_val <= ~leds_val;
  end

endmodule
