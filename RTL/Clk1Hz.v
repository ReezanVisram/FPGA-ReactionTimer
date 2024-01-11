`timescale 1ns / 1ps

module Clk1Hz(
    input clk,
    output reg clk1hz
  );

  reg [25:0] counter;
  initial
  begin
    counter = 0;
    clk1hz = 0;
  end

  always @(posedge clk)
  begin
    if (counter == 0)
    begin
      counter <= 49999999;
      clk1hz <= ~clk1hz;
    end
    else
    begin
      counter <= counter - 1;
    end
  end

endmodule
