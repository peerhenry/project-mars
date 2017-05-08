var arg_x = argument0;
var arg_y = argument1;

var no_wall = instance_position(arg_x, arg_y, obj_wall) == noone;
var no_door = instance_position(arg_x, arg_y, obj_door) == noone;
var no_adjacent_door = 
	instance_position(arg_x+32, arg_y, obj_door) == noone
	&& instance_position(arg_x-32, arg_y, obj_door) == noone
	&& instance_position(arg_x, arg_y+32, obj_door) == noone
	&& instance_position(arg_x, arg_y-32, obj_door) == noone;
	
return no_wall && no_door && no_adjacent_door;