/// @arg i
/// @arg j
/// @arg object_index
function scr_get_instance_at_ij(argument0, argument1, argument2) {
	var arg_i = argument0;
	var arg_j = argument1;
	var arg_object_index = argument2;

	var xx = scr_gi_to_rc(arg_i);
	var yy = scr_gi_to_rc(arg_j);
	return instance_position(xx, yy, arg_object_index);


}
