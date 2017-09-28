/// @description Either transfers mdu, or brings it to the construction
/// @param astronaut
/// @param construction
/// @param reach_state
var arg_astronaut = argument0;
var arg_construction = argument1;
var arg_reach_state = argument2;

if(arg_reach_state == macro_adjacent)
{
	scr_transfer_mdu(arg_astronaut, arg_construction);
}
else if(arg_reach_state == macro_reachable)
{
	scr_navigate_to_construction(arg_astronaut, arg_construction);
	scr_update_astro_and_construction(arg_astronaut, arg_construction, astronaut_action.delivering_mdu);
}