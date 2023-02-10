/// @Description Sets astronaut action
/// @param astronaut
/// @param construction_instance
/// @param action
function scr_update_astro_construction_action(argument0, argument1, argument2) {
	var arg_astronaut = argument0;
	var arg_construction = argument1;
	var arg_action = argument2;
	with(arg_astronaut)
	{
		construction = arg_construction;
		current_action = arg_action;
	}


}
