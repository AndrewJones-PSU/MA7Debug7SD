/**
    This module acts as a tester module for the MA7Debug7SD module. It maps buttons
        and switches to allow control over the MA7Debug7SD module.

    @author Andrew Jones (https://github.com/AndrewJones-PSU)
    @version v1.0.0

    @param {1} clk: input 100MHz clock from the MA7 Devboard
    @param {1} reset: input reset button from the MA7 Devboard
    @param {8} dips: input dip switches from the MA7 Devboard
    
    @param {8} leds: output LEDs to the MA7 Devboard
    @param {8} segDataOut: output 7SD segment data to the MA7 Devboard
    @param {4} segEnOut: output 7SD segment enable to the MA7 Devboard
*/

module TopTesterModule(
    input clk,
    input reset,
    input [7:0] dips,

    output [7:0] leds,
    output [7:0] segDataOut,
    output [3:0] segEnOut
);

    assign leds = dips;

    reg [24:0] clockCounter1;
    reg [21:0] clockCounter2;
    reg [16:0] clockCounter3;
    reg [10:0] clockCounter4;

    reg [31:0] clockCounterValue;

    MA7Debug7SD debug7SD(clk, dips[3:0], clockCounterValue, segDataOut, segEnOut);

    always @(posedge clk) begin
        clockCounter1 <= clockCounter1 + 1;
        clockCounter2 <= clockCounter2 + 1;
        clockCounter3 <= clockCounter3 + 1;
        clockCounter4 <= clockCounter4 + 1;

        // increment counter based on speed setting on dips
        case (dips[7:6])
            2'h0: if (clockCounter1 == 0) clockCounterValue <= clockCounterValue + 1;
            2'h1: if (clockCounter2 == 0) clockCounterValue <= clockCounterValue + 1;
            2'h2: if (clockCounter3 == 0) clockCounterValue <= clockCounterValue + 1;
            2'h3: if (clockCounter4 == 0) clockCounterValue <= clockCounterValue + 1;
        endcase

        if (reset == 1) begin
            clockCounter1 <= 1;
            clockCounter2 <= 1;
            clockCounter3 <= 1;
            clockCounter4 <= 1;
            clockCounterValue <= 0;
        end
    end

endmodule