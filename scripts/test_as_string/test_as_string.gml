/// @description converts number values to strings that refer to proper enum or macro name
/// @arg value
/// @arg parameter_name
var value = argument0;
var name = argument1;

switch(name){
	case "reach_state":
	case "reach state":
		switch(value){
			case macro_unreachable:
				return "unreachable";
			case macro_reachable:
				return "reachable";
			case macro_adjacent:
				return "adjacent";
			default:
				return string(value);
		}
	case "astronaut_action":
	case "astronaut action":
	case "astro.current_action":
	case "current_action":
	case "current action":
		switch(value){
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
		}
	case "owner":
		switch(value){
			case macro_player:
				return "player";
			case macro_enemy:
				return "enemy";
			case macro_china:
				return "china";
			case macro_nau:
				return "nau";
			case macro_japan:
				return "japan";
			case macro_un:
				return "UN";
		}
	default:
		return string(value);
}

// failsafe
return string(value);