/// @arg construction_cells
/// @arg prerequisite
/// @arg right
/// @arg top
/// @arg left
/// @arg bottom
/// @arg owner
/// @arg required_metal

debug_types( // argument2 is optional
	[argument0, argument1, argument3, argument4, argument5, argument6, argument7], 
	[macro_type_list, macro_type_real, macro_type_real, macro_type_real, macro_type_real, macro_type_real, macro_type_real]
);

//var arg_mdu_count = ceil(argument0); // must be a whole number

var arg_construction_cell_list = argument0;
var arg_prerequisite = argument1;
var arg_right = argument2;
var arg_top = argument3;
var arg_left = argument4;
var arg_bottom = argument5;
var arg_owner = argument6;
var arg_required_metal = argument7;
var script_container = global.script_container;
var calc_mdu = script_container_resolve(script_container, "calculate_required_mdu_count");
var mdu_count = script_execute(calc_mdu, arg_construction_cell_list);

var new_construction = ds_map_create();
var initial_state = construction_state.awaiting_mdus;
if(mdu_count <= 0) initial_state = construction_state.ready;
else if(arg_prerequisite == noone) initial_state = construction_state.awaiting_mdus;
//var build_time = global.build_time_sec_minimum + arg_mdu_count*global.build_time_sec_per_mdu + arg_required_metal*0.01 + 100;
var build_time = scr_calculate_build_time(mdu_count, arg_required_metal);
ds_map_add(new_construction, construction_completion, 0);
ds_map_add(new_construction, construction_build_state, initial_state);
ds_map_add(new_construction, construction_type, scr_get_selected_constr_type());
ds_map_add(new_construction, construction_cells, arg_construction_cell_list);
ds_map_add(new_construction, construction_astronaut, noone);
ds_map_add(new_construction, construction_time, build_time);
ds_map_add(new_construction, construction_prerequisite, arg_prerequisite);
ds_map_add(new_construction, construction_bb_bottom, arg_bottom);
ds_map_add(new_construction, construction_bb_right, arg_right);
ds_map_add(new_construction, construction_bb_left, arg_left);
ds_map_add(new_construction, construction_bb_top, arg_top);
ds_map_add(new_construction, construction_required_mdu_count, mdu_count);
ds_map_add(new_construction, construction_required_mdu_remaining, mdu_count);
ds_map_add(new_construction, construction_mdu_deliveries, 0);
ds_map_add(new_construction, construction_mdu_piles, ds_list_create());
ds_map_add(new_construction, construction_owner, arg_owner);
ds_map_add(new_construction, construction_required_metal, arg_required_metal);

var av_x = (arg_left + arg_right)/2;
var av_y = (arg_top + arg_bottom)/2;
var create_instance = resolve_script(script_container, "create_instance");
var con_obj = script_execute(create_instance, av_x, av_y, obj_construction);
ds_map_add(new_construction, construction_object, con_obj);
with(con_obj) construction = new_construction;

return new_construction;