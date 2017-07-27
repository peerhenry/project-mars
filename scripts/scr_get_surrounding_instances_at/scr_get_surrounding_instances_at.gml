/// @description Get array of surrounding instances in CCW order, starting east: E,NE,N,NW,W...
/// @param x
/// @param y
/// @param object_index
var arg_x = argument0;
var arg_y = argument1;
var arg_object_index = argument2;

var result;
result[7] = instance_position(arg_x + 32,	arg_y + 32, arg_object_index);	// south-east
result[6] = instance_position(arg_x,		arg_y + 32, arg_object_index);	// south
result[5] = instance_position(arg_x - 32,	arg_y + 32, arg_object_index);	// south-west
result[4] = instance_position(arg_x - 32,	arg_y,		arg_object_index);	// west
result[3] = instance_position(arg_x - 32,	arg_y - 32, arg_object_index);	// north-west
result[2] = instance_position(arg_x,		arg_y - 32, arg_object_index);	// north
result[1] = instance_position(arg_x + 32,	arg_y - 32,	arg_object_index);	// north-east
result[0] = instance_position(arg_x + 32,	arg_y,		arg_object_index);	// east

return result;