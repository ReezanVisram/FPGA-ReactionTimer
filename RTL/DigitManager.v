`timescale 1ns / 1ps

module DigitManager(
    input clk,
    input reset_n,
    input w,
    output reg [3:0] z
  );

  parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101, G = 3'b110, H = 3'b111;

  reg [2:0] currentState;
  reg [2:0] nextState;

  always @( * )
  begin
    z = 4'b0000;
    case (currentState)
      B:
        z = 4'b0001;
      C:
        z = 4'b0010;
      D:
        z = 4'b0100;
      E:
        z = 4'b1000;
    endcase
  end

  always @(posedge clk)
  begin
    if (!reset_n)
      currentState <= A;
    else
      currentState <= nextState;
  end

  always @( * )
  begin
    nextState = currentState;
    case (currentState)
      A:
        if (w)
          nextState = B;
        else
          nextState = A;
      B:
        if (w)
          nextState = C;
        else
          nextState = A;
      C:
        if (w)
          nextState = D;
        else
          nextState = A;
      D:
        if (w)
          nextState = E;
        else
          nextState = A;
      E:
        if (w)
          nextState = B;
        else
          nextState = A;
      F:
        nextState = A;
      G:
        nextState = A;
      H:
        nextState = A;
    endcase
  end



endmodule
