/// @param astronaut
/// @param construction
function scr_get_reach_state(argument0, argument1) {
	var arg_astronaut = argument0;
	var arg_construction = argument1;

	if(scr_astronaut_is_next_to_construction(arg_astronaut, arg_construction))
	{
		return reach_state.adjacent;
	}

	var result = scr_find_navigation_target_to_construction(arg_astronaut, arg_construction); // [x, y]
	if(is_array(result))
	{
		return reach_state.reachable;
	}

	return reach_state.unreachable;


}
