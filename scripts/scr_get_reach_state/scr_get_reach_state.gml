/// @param astronaut
/// @param construction
var arg_astronaut = argument0;
var arg_construction = argument1;

if(scr_astronaut_is_next_to_construction(arg_astronaut, arg_construction))
{
	return macro_adjacent; // todo: refactor to use the enum
}

var result = scr_find_navigation_target_to_construction(arg_astronaut, arg_construction); // [x, y]
if(is_array(result))
{
	return macro_reachable;
}

return macro_unreachable;