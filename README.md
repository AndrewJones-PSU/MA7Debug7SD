# Mimas A7 Debug 7-Segment-Display v1.0.0

This project is a simple SystemVerilog implementation of a debug 7-Segment Display.
This is intended to target the Mimas A7 Revision 3.0 development board.

## Repo Directory

Inside of MA7Debug7SD.src are the folders for the Design as well as the Constraints.

In the Design folder, TopTesterModule.sv contains a module that implements some
basic interaction with the MA7Debug7SD module. The actual MA7Debug7SD module is
in the MA7Debug7SD.sv file.

In the Constraints folder, there are two constraints files. TopTesterModule.xdc
holds constraints that only the TopTesterModule uses. MA7Debug7SD.xdc holds the
constraints for the outputs of the MA7Debug7SD module.

## Usage

To use the MA7Debug7SD in your own project, simply copy over the MA7Debug7SD.sv and
MA7Debug7SD.xdc files to your project directory and add the files in vivado. The
module holds the following inputs and outputs:

- input clk: clock input, this should be hooked up to a 100MHz clock signal.
- input [3:0] modeSel: mode selection, this can be hard-wired to a desired mode
    or controlled by a seperate module. The four modes are detailed below.
- input [31:0] data: input data for the module. This should be whatever data you
    want to display on the seven segment display.
- output [7:0] segDataOut: output signals for the seven segment display
- output [3:0] segEnOut: output enable signals for the seven segment display.

### Modes

The supported modes are listed below:
- 0 - disabled: outputs nothing to the seven segment displays
- 1 - direct control: outputs the exact bits in the data input. This allows for
    custom outputs to be displayed, such as a custom error message. A diagram for
    how bits are oriented is given below. Note that the seven segment display on
    the MA7 uses active-low inputs.
- 2 - hex output: outputs the 16 lowest bits of the data input represented in
    hexadecimal.
- 3 - unsigned decimal: outputs the 16 lowest bits of the data input represented in
    unsigned decimal. If the represented value exceeds 10000, "OL" is displayed.
- 4 through 15 are reserved for future versions


### Orientation of bits in direct control mode
![img](https://cdn.discordapp.com/attachments/601895458453061655/884285251172581407/unknown.png)