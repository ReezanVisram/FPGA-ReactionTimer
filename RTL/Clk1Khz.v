`timescale 1ns / 1ps

module Clk1Khz(
    input clk,
    output reg clk1Khz
  );

  reg [15:0] counter;
  initial
  begin
    counter = 0;
    clk1Khz = 0;
  end

  always @(posedge clk)
  begin
    if (counter == 0)
    begin
      counter <= 49999;
      clk1Khz <= ~clk1Khz;
    end
    else
    begin
      counter <= counter - 1;
    end
  end

endmodule
