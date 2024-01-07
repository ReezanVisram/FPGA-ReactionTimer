# FPGA Reaction Timer

## A test of your reaction time!

The FPGA Reaction Timer is a pure hardware implementation of a reaction time test, written in Verilog to run on the Arty S7-50 FPGA.

### Techonologies

- Xilinx Spartan-7 FPGA
- Vivado 2023.2
- Verilog

### How it works

1. The FPGA Reaction Timer starts by flashing the onboard LEDs, waiting for the user to press the Start button.
2. It then waits a random amount of time
3. One of the 4 onboard LEDs will turn on, and the user must quickly press the push button corresponding to that LED
4. The time it took the user to press the push button (minus time taken for debouncing the push buttons) is displayed on the 4-digit, 7-segment display in ms, with an accuracy of 1 decimal place, utilizing a fixed-point decimal representation.

### Setup Instructions

**To run this project on hardware, you will require the Arty S7-50 board from Digilent, which can be found [here](https://digilent.com/reference/programmable-logic/arty-s7/start), as well as a 4-Digit 7-Segment display, breadboard, 4 220 ohm resistors and some jumpers.**

It is not feasible for anyone who does not have the Arty S7-50 board and the rest of the required hardware to try out this project, so please check out the demo video below!

1. Follow the Circuit Diagram below to connect your Arty S7-50 board to your 4-Digit, 7-Segment Display
2. Clone this repo
3. Open the `ReactionTimer.xpr` file found in `Work_Dir` in Vivado 2023.2+
4. Run Synthesis, Implementation, and Generate Bitstream, before downloading the created `.bit` file to the board using a USB cable.
5. Start testing your reaction time!

### Circuit Diagram

Coming soon!

### Demo Video

Coming soon!
