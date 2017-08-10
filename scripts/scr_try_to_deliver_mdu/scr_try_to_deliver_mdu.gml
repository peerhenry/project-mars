/// @param astronaut
/// @param construction
var arg_astronaut = argument0;
var arg_construction = argument1;

if(scr_astronaut_is_next_to_construction(arg_astronaut, arg_construction))
{
	scr_deliver_mdu(arg_astronaut, arg_construction);
	return true;
}

var result = scr_find_navigation_target_to_construction(arg_astronaut, arg_construction);
if(is_array(result))
{
	scr_navigate_once(arg_astronaut, result[0], result[1]);
	scr_pick_up_construction(arg_astronaut, arg_construction, astronaut_action.delivering_mdu);
	return true;
}

return false;