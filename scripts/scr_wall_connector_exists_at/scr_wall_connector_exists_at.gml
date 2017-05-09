var arg_x = argument0;
var arg_y = argument1;

return
	instance_position(arg_x, arg_y, obj_wall) != noone
	|| instance_position(arg_x, arg_y, obj_door) != noone
	|| instance_position(arg_x, arg_y, obj_hatch) != noone;