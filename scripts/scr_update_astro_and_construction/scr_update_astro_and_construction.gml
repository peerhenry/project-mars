/// @Description navigates to construction and begins action
/// @param astronaut
/// @param construction
/// @param action
function scr_update_astro_and_construction(argument0, argument1, argument2) {
	var arg_astronaut = argument0;
	var arg_construction = argument1;
	var arg_action = argument2;

	scr_update_astro_construction_action(arg_astronaut, arg_construction, arg_action);
	scr_update_construction_props(arg_construction, arg_astronaut, arg_action);


}
