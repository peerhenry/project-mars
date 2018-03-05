/// @Description navigates to construction and begins action
/// @param astronaut
/// @param construction
/// @param reach_state
var arg_astronaut = argument0;
var arg_construction = argument1;
var arg_reach_state = argument2;

if(arg_reach_state == reach_state.adjacent)
{	
	scr_update_astro_and_construction(arg_astronaut, arg_construction, astronaut_action.constructing);
}
else
{
	scr_navigate_to_construction(arg_astronaut, arg_construction);
	scr_update_astro_and_construction(arg_astronaut, arg_construction, astronaut_action.moving_to_construction);
}

return true;