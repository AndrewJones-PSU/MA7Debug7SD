# These are the constraints for the MA7Debug7SD module.
# The top module should instantiate segEnOut and segDataOut, which will be set by
# the MA7Debug7SD module. Use these constraints to ensure that proper signals
# are sent to the 7SD.

set_property IOSTANDARD LVCMOS33 [get_ports {segEnOut[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segEnOut[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segEnOut[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segEnOut[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {segDataOut[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segDataOut[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segDataOut[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segDataOut[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segDataOut[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segDataOut[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segDataOut[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segDataOut[0]}]

set_property PACKAGE_PIN N3 [get_ports {segEnOut[3]}]
set_property PACKAGE_PIN R1 [get_ports {segEnOut[2]}]
set_property PACKAGE_PIN P1 [get_ports {segEnOut[1]}]
set_property PACKAGE_PIN L4 [get_ports {segEnOut[0]}]

set_property PACKAGE_PIN M3 [get_ports {segDataOut[7]}]
set_property PACKAGE_PIN M5 [get_ports {segDataOut[6]}]
set_property PACKAGE_PIN L6 [get_ports {segDataOut[5]}]
set_property PACKAGE_PIN M6 [get_ports {segDataOut[4]}]
set_property PACKAGE_PIN P5 [get_ports {segDataOut[3]}]
set_property PACKAGE_PIN N4 [get_ports {segDataOut[2]}]
set_property PACKAGE_PIN P4 [get_ports {segDataOut[1]}]
set_property PACKAGE_PIN L5 [get_ports {segDataOut[0]}]
