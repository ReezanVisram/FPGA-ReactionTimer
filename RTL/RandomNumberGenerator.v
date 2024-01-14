`timescale 1ns / 1ps

module RandomNumberGenerator (
    input clk,
    input enable,
    input [13:0] seed,
    output reg [13:0] lfsr_out
  );

  reg calculatedRandomNumber;
  initial
  begin
    calculatedRandomNumber = 0;
  end
  
  always @(posedge clk)
  begin
    if (enable && !calculatedRandomNumber)
    begin
      lfsr_out <= {seed[12:0], seed[0] ^ seed[13] ^ seed[12] ^ seed[2]};
      calculatedRandomNumber <= 1;
    end
    else
    begin
      lfsr_out <= lfsr_out;
    end
  end

endmodule
