/// @param instance
/// @param object_index
var arg_instance = argument0;
var arg_object_index = argument1;

if(!debug_mode) exit;

if(arg_instance.object_index != arg_object_index)
{
	show_error("ERROR: Expected: " + object_get_name(arg_object_index) + ", actual: " + object_get_name(arg_instance.object_index), true);
}