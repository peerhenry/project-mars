/// @Description Sets astronaut action, and modifies construction properties accordingly
/// @param construction_instance
/// @param astronaut
/// @param action
function scr_update_construction_props(argument0, argument1, argument2) {
	var arg_construction = argument0;
	var arg_astronaut = argument1;
	var arg_action = argument2;

	var state = arg_construction[? construction_build_state];

	switch(arg_action)
	{
		case astronaut_action.fetching_mdu:
		case astronaut_action.delivering_mdu:
			if(state != construction_state.awaiting_mdus) show_error("Astronaut is fetching or delivering mdu to a construction that is not waiting for it.", true);
			var deliveries_incr = arg_construction[? construction_mdu_deliveries] + 1;
			ds_map_replace(arg_construction, construction_mdu_deliveries, deliveries_incr);
			break;
		case astronaut_action.constructing:
		case astronaut_action.moving_to_construction:
			ds_map_replace(arg_construction, construction_astronaut, arg_astronaut);
			if(state == construction_state.ready)
			{
				ds_map_replace(arg_construction, construction_build_state, construction_state.picked_up);
			}
			else
			{
				show_error("Astronaut is going to construct while construction is not ready. state: " + string(state), true);
			}
			break;
	}


}
