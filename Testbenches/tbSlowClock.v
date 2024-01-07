`timescale 1ns / 1ps

module tbSlowClock();

  // Registers
  reg clk = 0;
  wire sclk;

  parameter clk_period = 10;

  // UUT
  SlowClock sc(clk, sclk);

  initial
  begin
    #5000000 $finish;
  end

  always
  begin
    #(clk_period/2) clk = ~clk;
  end


endmodule
