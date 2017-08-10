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

// increment deliveries
if(arg_action == astronaut_action.delivering_mdu)
{
	var deliveries_incr = ds_map_find_value(arg_construction, construction_mdu_deliveries) + 1;
	ds_map_replace(arg_construction, construction_mdu_deliveries, deliveries_incr);
}

arg_astronaut.construction = arg_construction;
arg_astronaut.current_action = arg_action;