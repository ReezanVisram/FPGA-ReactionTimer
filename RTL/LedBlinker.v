`timescale 1ns / 1ps

module LedBlinker(
    input clk,
    input waitingToStart,
    input turnOnLedForTest,
    output [3:0] leds
  );

  reg [3:0] led_value = 4'b0000;
  reg [3:0] leds_val = 4'b1111;
  reg [25:0] counter;

  initial
  begin
    counter = 0;
    clk1hz = 0;
    leds = leds_val;
  end

  always @(posedge clk)
  begin
    if (waitingToStart)
    begin
      if (counter == 0)
      begin
        counter <= 49999999;
        leds <= leds_val;
        leds_val <= ~leds_val;
      end
      else
      begin
        counter <= counter - 1;
      end
    end
    else if (turnOnLedForTest)
    begin
      leds = 4'b0001;
    end
  end
endmodule
