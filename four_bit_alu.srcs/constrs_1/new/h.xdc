set_operating_conditions -process maximum
set_load 5.000 [all_outputs]
set_property LOAD 5 [get_ports carry]
set_property LOAD 5 [get_ports overflow]
set_property LOAD 5 [get_ports {result[0]}]
set_property LOAD 5 [get_ports {result[1]}]
set_property LOAD 5 [get_ports {result[2]}]
set_property LOAD 5 [get_ports {result[3]}]
set_property LOAD 5 [get_ports zero]
