/// @arg instance
/// @arg object_index
function scr_instance_inherits(argument0, argument1) {
	var arg_instance = argument0;
	var arg_object = argument1;

	return arg_instance.object_index == arg_object || object_is_ancestor( arg_instance.object_index, arg_object );


}
