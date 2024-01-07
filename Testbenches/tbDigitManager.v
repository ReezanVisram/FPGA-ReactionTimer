`timescale 1ns / 1ps

module tbDigitManager();

  // Registers
  reg clk = 0;
  reg reset_n;
  reg w;
  wire [3:0] z;

  parameter clk_period = 10;

  // UUT
  DigitManager dt(clk, reset_n, w, z);


  initial
  begin
    reset_n = 0;
    #10 reset_n = 1;
    w = 0;
    #10 w = 0;

    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 1;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 $finish;
  end

  always
  begin
    #(clk_period/2) clk = ~clk;
  end

endmodule
