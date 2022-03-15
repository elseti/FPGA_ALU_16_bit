set projDir "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/vivado"
set projName "Test1Intro"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/verilog/au_top_0.v" "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/verilog/sixteen_bit_adder_1.v" "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/verilog/sixteen_boolean_2.v" "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/verilog/comparator_3.v" "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/verilog/shifter_4.v" "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/verilog/multiplier_5.v" "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/verilog/counter_6.v" "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/verilog/tester_7.v" "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/verilog/reset_conditioner_8.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/constraint/custom_au.xdc" "C:/Users/Eliana/Documents/00.\ 1D\ Comptruct\ Term\ 4/Alchitry/ALU_group20/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
