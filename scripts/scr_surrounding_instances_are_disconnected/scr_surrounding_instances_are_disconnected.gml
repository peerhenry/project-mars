/// @description Checks if surrounding instances are disconnected
/// @param x
/// @param y
/// @param object_index
function scr_surrounding_instances_are_disconnected(argument0, argument1, argument2) {
	var arg_x = argument0;
	var arg_y = argument1;
	var arg_object = argument2;

	var surrounding_instances = scr_get_surrounding_instances_at(arg_x, arg_y, arg_object);
	return scr_surrounder_array_is_disconnected(surrounding_instances);


}
