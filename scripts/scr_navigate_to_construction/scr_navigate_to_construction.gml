/// @param astronaut
/// @param construction
var arg_astronaut = argument0;
var arg_construction = argument1;
var target = scr_find_navigation_target_to_construction(arg_astronaut, arg_construction);
if(is_array(target))
{
	scr_navigate_once(arg_astronaut, target[0], target[1]);
	return true;
}
return false;