/**
    This module implements a simple output interface for the Mimas A7's Seven
        Segment Display. This module is primarily intended to be used as an output
        for debugging designs, but it can easily be used for other purposes, such
        as a general-purpose output module. This module fully handles mapping the
        correct segments to the correct pins, as well as multiplexing the segments.

    @author Andrew Jones (https://github.com/AndrewJones-PSU)
    @version v1.0.0

    @param {1} clk: input clock for the module, should be 100MHz. This can and should
        be directly connected to the oscillator signal onboard the MA7 board.
    @param {4} modeSel: input mode selection for the module. There are sixteen
        output modes that can be selected from:
        0 - disabled, no output
        1 - direct 1:1 control of 7SD
        2 - standard 16-bit hex output
        3 - unsigned 16-bit decimal integer output
        4 through F - reserved for future versions
    @param {32} data: input data for the module. This is the data that will be
        output to the Seven Segment Display.
    
    @param {8} segDataOut: output for the seven segment display. This will directly
        control the segments of the seven segment display.
    @param {4} segEnOut: output enable signals for the seven segment display. This
        will enable the necessary segments of the seven segment display.
*/

module MA7Debug7SD(
    input clk,
    input [3:0] modeSel,
    input [31:0] data,

    output reg [7:0] segDataOut,
    output reg [3:0] segEnOut
);
    // registers for clock and enable
    reg [17:0] clockCounter;
    reg [1:0] enState;

    // registers for decimal computation
    reg [3:0] thousandsPlace;
    reg [3:0] hundredsPlace;
    reg [3:0] tensPlace;
    reg [3:0] onesPlace;

    always @(posedge clk) begin
        clockCounter <= clockCounter + 1;
        if (clockCounter == 0) begin
            enState <= enState + 1;
        end
    end

    always_comb begin
        // set enable signals based on enState
        case (enState)
            2'h0: segEnOut = 4'b0111;
            2'h1: segEnOut = 4'b1011;
            2'h2: segEnOut = 4'b1101;
            2'h3: segEnOut = 4'b1110;
        endcase

        // compute binary coded decimal output, based on double dabble algorithm
        thousandsPlace = 0;
        hundredsPlace = 0;
        tensPlace = 0;
        onesPlace = 0;
        for (int i=15; i>=0; i--) begin
            // add 3 to any digit that is >= 5
            if (thousandsPlace >= 5)
                thousandsPlace = thousandsPlace + 3;
            if (hundredsPlace >= 5)
                hundredsPlace = hundredsPlace + 3;
            if (tensPlace >= 5)
                tensPlace = tensPlace + 3;
            if (onesPlace >= 5)
                onesPlace = onesPlace + 3;
            
            // shift left one
            thousandsPlace = thousandsPlace << 1;
            thousandsPlace[0] = hundredsPlace[3];
            hundredsPlace = hundredsPlace << 1;
            hundredsPlace[0] = tensPlace[3];
            tensPlace = tensPlace << 1;
            tensPlace[0] = onesPlace[3];
            onesPlace = onesPlace << 1;
            onesPlace[0] = data[i];
        end

        // set data based on modeSel
        case (modeSel)
            4'h0: begin // disabled
                segDataOut = 8'hFF;
            end

            4'h1: begin // direct 1:1 control of 7SD
                case (enState)
                    2'h0: segDataOut = data[31:24];
                    2'h1: segDataOut = data[23:16];
                    2'h2: segDataOut = data[15:8];
                    2'h3: segDataOut = data[7:0];
                endcase
            end

            4'h2: begin // standard 16-bit hex output
                case (enState)
                    2'h0: segDataOut = hexOutput(data[15:12]);
                    2'h1: segDataOut = hexOutput(data[11:8]);
                    2'h2: segDataOut = hexOutput(data[7:4]);
                    2'h3: segDataOut = hexOutput(data[3:0]);
                endcase
            end

            4'h3: begin // unsigned decimal integer output
                if (data >= 10000) begin // if over 10000, then display OL
                    case (enState)
                        2'h0: segDataOut = 8'hFF;
                        2'h1: segDataOut = 8'b00000011;
                        2'h2: segDataOut = 8'b11100011;
                        2'h3: segDataOut = 8'hFF;
                    endcase
                end else begin // if within range, then display decimal
                    case (enState)
                        2'h0: segDataOut = hexOutput(thousandsPlace);
                        2'h1: segDataOut = hexOutput(hundredsPlace);
                        2'h2: segDataOut = hexOutput(tensPlace);
                        2'h3: segDataOut = hexOutput(onesPlace);
                    endcase
                end
            end

            default: begin
                // reserved for future versions
            end
        endcase
    end

    // function for determining hex outputs
    function [7:0] hexOutput(input [3:0] data);
        case (data)
            4'h0: return 8'b00000011;
            4'h1: return 8'b10011111;
            4'h2: return 8'b00100101;
            4'h3: return 8'b00001101;
            4'h4: return 8'b10011001;
            4'h5: return 8'b01001001;
            4'h6: return 8'b01000001;
            4'h7: return 8'b00011111;
            4'h8: return 8'b00000001;
            4'h9: return 8'b00001001;
            4'hA: return 8'b00010001;
            4'hB: return 8'b11000001;
            4'hC: return 8'b01100011;
            4'hD: return 8'b10000101;
            4'hE: return 8'b01100001;
            4'hF: return 8'b01110001;
        endcase
    endfunction

endmodule