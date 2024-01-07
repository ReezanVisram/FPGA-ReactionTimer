`timescale 1ns / 1ps

module SlowClock(
    input clk,
    output reg sclk
  );

  reg [18:0] counter;
  initial
  begin
    counter = 0;
    sclk = 0;
  end

  always @(posedge clk)
  begin
    if (counter == 0)
    begin
      counter <= 249999;
      sclk <= ~sclk;
    end
    else
    begin
      counter <= counter - 1;
    end
  end

endmodule
