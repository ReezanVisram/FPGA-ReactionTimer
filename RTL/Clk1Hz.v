`timescale 1ns / 1ps

module Clk1Hz(
    input clk,
    output reg clk1Hz
  );

  reg [25:0] counter;
  initial
  begin
    counter = 0;
    clk1Hz = 0;
  end

  always @(posedge clk)
  begin
    if (counter == 0)
    begin
      counter <= 49999999;
      clk1Hz <= ~clk1Hz;
    end
    else
    begin
      counter <= counter - 1;
    end
  end

endmodule
