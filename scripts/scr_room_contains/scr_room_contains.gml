/// Check if given coordinate lies within given room.
/// @arg room
/// @arg x
/// @arg y
var le_room = argument0;
var arg_x = argument1;
var arg_y = argument2;

with(le_room){
	if(!point_in_rectangle(arg_x, arg_y, bb_left, bb_top, bb_right, bb_bottom))
	{
		return false;
	}
}

var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);
return scr_check_tile_in_room(le_room, arg_i, arg_j);