/// @description retuns adjacent objects in order east, north, west, south
/// @param instance
/// @param object_index
var arg_instance = argument0;
var arg_object_index = argument1;

var result;
result[3] = instance_position(x, y + 32, arg_object_index);	// south
result[2] = instance_position(x - 32, y, arg_object_index);	// west
result[1] = instance_position(x, y - 32, arg_object_index);	// north
result[0] = instance_position(x + 32, y, arg_object_index);	// east

return result;