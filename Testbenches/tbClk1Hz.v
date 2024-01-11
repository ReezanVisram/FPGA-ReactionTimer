`timescale 1ns / 1ps

module tbClk1Hz();
  // Registers
  reg clk = 0;
  wire clk1hz;

  parameter clk_period = 10;

  // UUT
  Clk1Hz c1hz(clk, clk1hz);

  initial
  begin
    #2000000 $finish;
  end

  always
  begin
    #(clk_period/2) clk = ~clk;
  end

endmodule
