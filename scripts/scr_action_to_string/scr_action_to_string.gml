function scr_action_to_string(argument0) {
	switch(argument0)
	{
		case astronaut_action.idle:
			return "idle";
		case astronaut_action.moving_by_command:
			return "moving_by_command";
		case astronaut_action.moving_to_construction:
			return "moving_to_construction";
		case astronaut_action.moving_to_shoot:
			return "moving_to_shoot";
		case astronaut_action.fetching_mdu:
			return "fetching_mdu";
		case astronaut_action.delivering_mdu:
			return "delivering_mdu";
		case astronaut_action.constructing:
			return "constructing";
		case astronaut_action.executing_assignment:
			return "executing_assignment";
		case astronaut_action.in_combat:
			return "in_combat";
		default:
			return "unknown";
	}


}
