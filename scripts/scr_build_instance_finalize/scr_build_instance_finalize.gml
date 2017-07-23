/// @param instance
/// @param layer
/// @param build_type
var added_instance = argument0;
var target_layer = argument1;
var build_type = argument2;

with(added_instance)
{
	under_construction = false;
	
	// keep these script calls inside the with statement: that way they wont get executed if the instance doesn't exist
	
	scr_room_logic(build_type, added_instance);
	// scr_wall_logic(added_instance);
	scr_grid_logic(added_instance);
	
	// Atm only sets pipe depth -= 1, maybe move this to a custom event
	scr_post_completion(added_instance);
}