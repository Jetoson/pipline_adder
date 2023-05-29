# clock constraint
create_clock -period 10 [get_ports clk]

# Input constraints
set_input_delay -clock clk -max 1 [get_ports numar1]
set_input_delay -clock clk -max 1 [get_ports numar2]
set_input_delay -clock clk -max 1 [get_ports op]
set_input_delay -clock clk -max 1 [get_ports load]
set_input_delay -clock clk -max 1 [get_ports reset]

# Output constraints
set_output_delay -clock clk -max 1 [get_ports numar]

# Pin location constraints, assuming you're using a specific FPGA device
set_property PACKAGE_PIN W5 [get_ports clk]
set_property PACKAGE_PIN W6 [get_ports reset]
set_property PACKAGE_PIN W7 [get_ports load]
set_property PACKAGE_PIN V5 [get_ports op]

set_property PACKAGE_PIN Y5 [get_ports numar1[31:0]]
set_property PACKAGE_PIN Y6 [get_ports numar2[31:0]]

set_property PACKAGE_PIN Y7 [get_ports numar[31:0]]

# Set I/O standards
set_property IOSTANDARD LVCMOS33 [get_ports]
