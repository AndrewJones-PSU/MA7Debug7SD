# these constraints are used for the TopTesterModule.sv module.

# dip switches
set_property IOSTANDARD LVCMOS33 [get_ports {dips[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dips[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dips[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dips[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dips[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dips[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dips[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dips[0]}]

set_property PACKAGE_PIN B21 [get_ports {dips[7]}]
set_property PACKAGE_PIN A21 [get_ports {dips[6]}]
set_property PACKAGE_PIN E22 [get_ports {dips[5]}]
set_property PACKAGE_PIN D22 [get_ports {dips[4]}]
set_property PACKAGE_PIN E21 [get_ports {dips[3]}]
set_property PACKAGE_PIN D21 [get_ports {dips[2]}]
set_property PACKAGE_PIN G21 [get_ports {dips[1]}]
set_property PACKAGE_PIN G22 [get_ports {dips[0]}]

set_property PULLUP true [get_ports {dips[7]}]
set_property PULLUP true [get_ports {dips[6]}]
set_property PULLUP true [get_ports {dips[5]}]
set_property PULLUP true [get_ports {dips[4]}]
set_property PULLUP true [get_ports {dips[3]}]
set_property PULLUP true [get_ports {dips[2]}]
set_property PULLUP true [get_ports {dips[1]}]
set_property PULLUP true [get_ports {dips[0]}]


# clock and reset
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

set_property PACKAGE_PIN H4 [get_ports {clk}]
set_property PACKAGE_PIN M2 [get_ports {reset}]

create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
set_property PULLDOWN true [get_ports {reset}]

# LEDs
set_property IOSTANDARD LVCMOS33 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[0]}]

set_property PACKAGE_PIN K17 [get_ports {leds[7]}]
set_property PACKAGE_PIN J17 [get_ports {leds[6]}]
set_property PACKAGE_PIN L14 [get_ports {leds[5]}]
set_property PACKAGE_PIN L15 [get_ports {leds[4]}]
set_property PACKAGE_PIN L16 [get_ports {leds[3]}]
set_property PACKAGE_PIN K16 [get_ports {leds[2]}]
set_property PACKAGE_PIN M15 [get_ports {leds[1]}]
set_property PACKAGE_PIN M16 [get_ports {leds[0]}]


