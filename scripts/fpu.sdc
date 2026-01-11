################
#SDC
################

#set scenario turo.ss0p6v125c_WC.RC_MAX

set ip [remove_from_collection [all_inputs] [get_ports gclk]]

if {[shell_is_in_topographical_mode]} {

#create_scenario $scenario

set_units -time ns

create_clock [get_ports gclk] -name gclk -period 1.66

set_input_delay 0.5 -clock [get_clocks gclk] [all_inputs]

set_output_delay 0.5 -clock [get_clocks gclk] [all_outputs]

set_max_fanout 200 [current_design]

set_max_transition 0.5 [current_design]

set_max_capacitance 50 [current_design]

set_load 0.2 -pin_load [all_outputs]

set_voltage 0.6 -object_list VDD

set_voltage 0.72 -object_list VDDH

set_voltage 0.0 -object_list VSS

#set_operating_condition -max ss0p6v125c

########## TLU PLUS FILES ###########

set_tlu_plus_files\
		-max_tluplus ../../../../../../14_nmts/14_nmts/tech/star_rc/max/saed14nm_1p9m_Cmax.tluplus \
		-tech2itf_map ../../../../../../14_nmts/14_nmts/tech/star_rc/saed14nm_tf_itf_tluplus.map \
		-min_tluplus ../../../../../../14_nmts/14_nmts/tech/star_rc/min/saed14nm_1p9m_Cmin.tluplus


check_tlu_plus_files

#set_scenario_options -setup true -hold false -leakage_power false

#report_scenario_options

} else {

create_clock [get_ports gclk] -name gclk -period 1.66

set_input_delay 0.5 -clock [get_clocks gclk] [all_inputs]

set_output_delay 0.5 -clock [get_clocks gclk] [all_outputs]

set_max_fanout 200 [current_design]

set_max_transition 0.5 [current_design]

set_max_capacitance 50 [current_design]

set_load 0.2 -pin_load [all_outputs]

set_voltage 0.6 -object_list VDD

set_voltage 0.72 -object_list VDDH

set_voltage 0.0 -object_list VSS

#set_operating_condition -max ss0p6v125c

}

