`timescale 1ns / 1ps

module TimerManager(
    input clk,
    input clk1Khz,
    input ck_reset,
    input [3:0] btn,
    output reg waitingToStart,
    output reg turnOnLEDForTest,
    output reg turnOnDigitsAfterTest,
    output reg [12:0] timeElapsed
  );

  parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101, G = 3'b110, H = 3'b111;

  reg calculateRandomNumber;

  reg [2:0] currentState;
  reg [2:0] nextState;
  reg [15:0] timeToStart;
  wire [13:0] timeToWait;
  reg [15:0] timeSinceStart;

  initial
  begin
    calculateRandomNumber = 0;
    timeToStart = 0;
    turnOnLEDForTest = 0;
    timeElapsed = 0;
    turnOnDigitsAfterTest = 0;
    timeSinceStart = 0;
    currentState <= A;
    nextState <= A;
  end

  RandomNumberGenerator rng(
                          .clk(clk),
                          .enable(calculateRandomNumber),
                          .seed(timeToStart),
                          .lfsr_out(timeToWait)
                        );

  always @( * )
  begin
    waitingToStart = 0;
    case (currentState)
      A:
      begin
        waitingToStart = 1;
      end
      B:
      begin
        waitingToStart = 1;

      end
      C:
      begin
        waitingToStart = 0;
        calculateRandomNumber = 1;
      end
      D:
      begin
        turnOnLEDForTest = 1;
        calculateRandomNumber = 0;
      end
      E:
      begin
        turnOnLEDForTest = 0;
        turnOnDigitsAfterTest = 1;
      end
    endcase
  end

  always @(posedge clk)
  begin
    timeToStart <= timeToStart + 1;
    currentState <= nextState;
  end

  always @(posedge clk1Khz)
  begin
    if (turnOnLEDForTest)
      timeElapsed <= timeElapsed + 1;
    if (!waitingToStart)
      timeSinceStart <= timeSinceStart + 1;
  end

  always @( * )
  begin
    nextState = currentState;
    case (currentState)
      A:
        if (!ck_reset)
          nextState = B;
        else
          nextState = A;
      B:
        if (ck_reset)
          nextState = C;
        else
          nextState = B;
      C:
        if ((timeSinceStart >= timeToWait) && !waitingToStart)
          nextState = D;
        else
          nextState = C;
      D:
        if (turnOnLEDForTest && btn[0])
          nextState = E;
        else
          nextState = D;
      E:
        nextState = E;
    endcase
  end


endmodule
