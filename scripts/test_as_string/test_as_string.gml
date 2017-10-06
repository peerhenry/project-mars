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
	default:
		return string(value);
}

// failsafe
return string(value);