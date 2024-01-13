`timescale 1ns / 1ps

module Clk5Hz(
    input clk,
    output reg clk5Hz
  );

  reg [18:0] counter;
  initial
  begin
    counter = 0;
    clk5Hz = 0;
  end

  always @(posedge clk)
  begin
    if (counter == 0)
    begin
      counter <= 249999;
      clk5Hz <= ~clk5Hz;
    end
    else
    begin
      counter <= counter - 1;
    end
  end

endmodule
