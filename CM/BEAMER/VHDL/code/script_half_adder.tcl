analyze -format vhdl {./half_adder.vhd}
elaborate half_adder -architecture logic -library WORK

#link
uniquify
set basename half_adder
set runname gates_dc

######################################
# Save Database for further loading
######################################
write -hierarchy -format ddc -output ./${basename}.ddc

######################################
# Timing Constraints - Clock Frequency
######################################

set frequency  250.0
set clock_skew  0.05
set input_setup  0.2
set output_delay  0.5

set clock_period [expr 1000.0 / $frequency]

set input_delay [expr $clock_period - $input_setup]

set tdelay [expr $output_delay + 1]

######################################
# Create Clock
######################################
create_clock -name "clk" -period $clock_period -waveform [list 0.0 [expr $clock_period / 2.0]] [list "clk"]

set_wire_load_mode segmented

set_clock_uncertainty -hold $clock_skew "clk"

set_clock_uncertainty -setup $clock_skew "clk"

set_max_transition 0.5 ap_rst

######################################
# Synthesis and Optimization
######################################

set_fix_multiple_port_nets -all [all_designs]
set_fix_multiple_port_nets -outputs -feedthroughs -constants
compile -map_effort medium -boundary_optimization

######################################
# Report Power
######################################
report_power -analysis_effort high > ${basename}_${runname}_power.rep

######################################
# Report Area
######################################
report_area -nosplit  > ${basename}_${runname}_area.rep

######################################
# Report Timing
######################################
report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group > ${basename}_${runname}_timing.rep

######################################
# Verilog output settings
######################################

set verilogout_equation    false
set verilogout_no_tri    true
set verilogout_single_bit  false
set verilogout_show_unconnected_pins true

change_names -rules verilog -hierarchy -verbose > change_names_verilog

######################################
# Export Verilog Netlist
######################################
write -hierarchy -format verilog -output ${basename}_${runname}.v
write -hierarchy -format vhdl -output ${basename}_${runname}.vhd

######################################
# Generate SDF file
######################################
write_sdf ${basename}_${runname}.sdf

######################################
######################################
quit
