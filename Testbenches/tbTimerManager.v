`timescale 1ns / 1ps

module tbTimerManager();

  // Registers
  reg clk = 0;
  reg ck_reset;
  reg reset_n;
  reg [3:0] btn;
  wire waitingToStart;
  wire turnOnLEDForTest;
  wire turnOnDigitsAfterTest;
  wire [15:0] timeElapsed;

  wire [3:0] leds;

  parameter clk_period = 10;

  // UUT
  TimerManager tm(clk, ck_reset, reset_n, btn, waitingToStart, turnOnLEDForTest, turnOnDigitsAfterTest, timeElapsed);

  initial
  begin
    reset_n = 0;
    ck_reset = 1;
    btn = 4'b0000;
    #10 reset_n = 1;
    #100000 ck_reset = 0;
    #100000 ck_reset = 1;

    wait(tm.turnOnLEDForTest);
    #100 btn = 4'b0001;
    #10 $finish;
  end

  always
  begin
    #(clk_period/2) clk = ~clk;
  end

endmodule
