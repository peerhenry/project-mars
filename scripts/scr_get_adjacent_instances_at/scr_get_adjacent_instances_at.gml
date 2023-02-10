/// @description retuns array of adjacent instances around a tile at given coordinates, ordered east, north, west, south
/// @param x
/// @param y
/// @param object_index
function scr_get_adjacent_instances_at(argument0, argument1, argument2) {
	var arg_x = argument0;
	var arg_y = argument1;
	var arg_object_index = argument2;

	var result;
	result[3] = instance_position(arg_x, arg_y + 32, arg_object_index);	// south
	result[2] = instance_position(arg_x - 32, arg_y, arg_object_index);	// west
	result[1] = instance_position(arg_x, arg_y - 32, arg_object_index);	// north
	result[0] = instance_position(arg_x + 32, arg_y, arg_object_index);	// east

	return result;



}
