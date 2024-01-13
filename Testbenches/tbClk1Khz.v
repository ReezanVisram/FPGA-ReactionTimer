`timescale 1ns / 1ps

module tbClk1Khz();
  // Registers
  reg clk= 0;
  wire clk1Khz;

  parameter clk_period = 10;

  // UUT
  Clk1Khz c1khz(clk, clk1Khz);

  initial
  begin
    #2000000 $finish;
  end

  always
  begin
    #(clk_period/2) clk = ~clk;
  end


endmodule
