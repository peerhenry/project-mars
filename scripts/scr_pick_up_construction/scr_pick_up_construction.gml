/// @param astronaut
/// @param construction_instance
/// @param action

var arg_astronaut = argument0;
var arg_construction = argument1;
var arg_action = argument2;

if(ds_map_find_value(arg_construction, construction_build_state) == construction_state.ready)
{
	ds_map_replace(arg_construction, construction_build_state, construction_state.picked_up);
	ds_map_replace(arg_construction, construction_astronaut, arg_astronaut);
}

arg_astronaut.construction_instance = arg_construction;
arg_astronaut.current_action = arg_action;