var arg_x = argument0;
var arg_y = argument1;

// relpace this with a build grid in the future;
var is_free = 
	instance_position(arg_x, arg_y, obj_wall) == noone
	&& instance_position(arg_x, arg_y, obj_door) == noone
	&& instance_position(arg_x, arg_y, obj_suit_closet) == noone;

if(!is_free) return false;

var has_adjacent_wall = 
	instance_position(arg_x+32, arg_y, obj_wall) != noone
	|| instance_position(arg_x-32, arg_y, obj_wall) != noone
	|| instance_position(arg_x, arg_y+32, obj_wall) != noone
	|| instance_position(arg_x, arg_y-32, obj_wall) != noone;
	
return has_adjacent_wall;