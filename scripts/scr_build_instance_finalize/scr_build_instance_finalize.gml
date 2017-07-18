/// @param instance
/// @param layer
/// @param build_type
var added_instance = argument0;
var target_layer = argument1;
var build_type = argument2;

with(added_instance)
{
	under_construction = false;
	depth = layer_get_depth(target_layer);
	
	// keep these inside the with statement so they dont get executed if the instance doesn't exist
	scr_room_logic(build_type, added_instance);
	scr_wall_logic(added_instance);
	scr_grid_logic(added_instance);
	scr_post_completion(added_instance);
}