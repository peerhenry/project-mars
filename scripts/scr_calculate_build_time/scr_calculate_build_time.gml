/// @arg mdu_count
/// @arg required_metal
var arg_mdu_count = argument0;
var arg_required_metal = argument1;
return global.build_time_sec_minimum + arg_mdu_count*global.build_time_sec_per_mdu + arg_required_metal*0.01;