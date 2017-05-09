var arg_x = argument0;
var arg_y = argument1;

var w_type = scr_get_wall_type(arg_x, arg_y);
var wall_is_straight = w_type == wall_type.horizontal || w_type == wall_type.vertical; // or vertical
if(!wall_is_straight) return false;

if(w_type == wall_type.horizontal)
{
	// north or south must be outside
	var north_is_outside = instance_position(arg_x, arg_y-32, obj_base_tile) == noone;
	var south_is_outside = instance_position(arg_x, arg_y+32, obj_base_tile) == noone;
	return north_is_outside || south_is_outside;
}
else
{
	// east or west must be outside
	var west_is_outside = instance_position(arg_x-32, arg_y, obj_base_tile) == noone;
	var east_is_outside = instance_position(arg_x+32, arg_y, obj_base_tile) == noone;
	return west_is_outside || east_is_outside;
}

return true;