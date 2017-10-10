/// @arg mdu_count
/// @arg construction_cells
/// @arg prerequisite
/// @arg right
/// @arg top
/// @arg left
/// @arg bottom
/// @arg owner
/// @arg required_metal

debug_types( // argument2 is optional
	[argument0, argument1, argument3, argument4, argument5, argument6, argument7, argument8], 
	[macro_type_real, macro_type_array, macro_type_real, macro_type_real, macro_type_real, macro_type_real, macro_type_real, macro_type_real]
);

var arg_mdu_count = ceil(argument0); // must be a whole number
var arg_construction_cell_array = argument1;
var arg_prerequisite = argument2;
var arg_right = argument3;
var arg_top = argument4;
var arg_left = argument5;
var arg_bottom = argument6;
var arg_owner = argument7;
var arg_required_metal = argument8;

var new_construction = ds_map_create();
var initial_state = construction_state.awaiting_mdus;
if(arg_mdu_count == 0) initial_state = construction_state.ready;
else if(arg_prerequisite == noone) initial_state = construction_state.awaiting_mdus;
//var build_time = global.build_time_sec_minimum + arg_mdu_count*global.build_time_sec_per_mdu + arg_required_metal*0.01 + 100;
var build_time = scr_calculate_build_time(arg_mdu_count, arg_required_metal);
ds_map_add(new_construction, construction_completion, 0);
ds_map_add(new_construction, construction_build_state, initial_state);
ds_map_add(new_construction, construction_build_type, global.construct);
ds_map_add(new_construction, construction_cells, arg_construction_cell_array);
ds_map_add(new_construction, construction_astronaut, noone);
ds_map_add(new_construction, construction_time, build_time);
ds_map_add(new_construction, construction_prerequisite, arg_prerequisite);
ds_map_add(new_construction, construction_bb_bottom, arg_bottom);
ds_map_add(new_construction, construction_bb_right, arg_right);
ds_map_add(new_construction, construction_bb_left, arg_left);
ds_map_add(new_construction, construction_bb_top, arg_top);
ds_map_add(new_construction, construction_required_mdu_count, arg_mdu_count);
ds_map_add(new_construction, construction_required_mdu_remaining, arg_mdu_count);
ds_map_add(new_construction, construction_mdu_deliveries, 0);
ds_map_add(new_construction, construction_mdu_piles, ds_list_create());
ds_map_add(new_construction, construction_owner, arg_owner);
return new_construction;