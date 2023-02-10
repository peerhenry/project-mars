/// @description Either transfers mdu, or brings it to the construction
/// @param container
/// @param astronaut
/// @param construction
/// @param reach_state
function scr_deliver_mdu(argument0, argument1, argument2, argument3) {
	var arg_container = argument0;
	var arg_astronaut = argument1;
	var arg_construction = argument2;
	var arg_reach_state = argument3;

	if(arg_reach_state == reach_state.adjacent)
	{
		scr_transfer_mdu(arg_container, arg_astronaut, arg_construction);
	}
	else if(arg_reach_state == reach_state.reachable)
	{
		var is_navigating = scr_navigate_to_construction(arg_astronaut, arg_construction);
		//if(!is_navigating) show_error("construction is reachable but astronaut does not navigate", true); // DEBUG
		scr_update_astro_and_construction(arg_astronaut, arg_construction, astronaut_action.delivering_mdu);
	}


}
