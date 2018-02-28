/// @arg instance
/// @arg object_index
var arg_instance = argument0;
var arg_object = argument1;

return arg_instance.object_index == arg_object || object_is_ancestor( arg_instance.object_index, arg_object );