module RandomNumberGenerator(
    input [15:0] seed,
    input enable,
    output reg [15:0] pseudoRandomNumber
  );

  reg [15:0] lfsr;  // 16-bit Linear Feedback Shift Register

  always @(posedge enable)
  begin
    if (enable)
    begin
      // XOR taps for a 16-bit LFSR with polynomial x^16 + x^14 + x^13 + x^11 + 1
      lfsr[0] <= lfsr[15] ^ lfsr[14] ^ lfsr[13] ^ lfsr[11];
      lfsr[1] <= lfsr[0];
      lfsr[2] <= lfsr[1];
      lfsr[3] <= lfsr[2];
      lfsr[4] <= lfsr[3];
      lfsr[5] <= lfsr[4];
      lfsr[6] <= lfsr[5];
      lfsr[7] <= lfsr[6];
      lfsr[8] <= lfsr[7];
      lfsr[9] <= lfsr[8];
      lfsr[10] <= lfsr[9];
      lfsr[11] <= lfsr[10];
      lfsr[12] <= lfsr[11];
      lfsr[13] <= lfsr[12];
      lfsr[14] <= lfsr[13];
      lfsr[15] <= lfsr[14];
    end
  end

  always @(posedge enable or posedge seed)
  begin
    if (enable)
    begin
      lfsr <= seed;  // Load the seed value on the rising edge of enable
      pseudoRandomNumber <= lfsr;
    end
  end

endmodule
