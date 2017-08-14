/// @param instance
/// @param object_index
var arg_instance = argument0;
var arg_object_index = argument1;

if(arg_instance.object_index != arg_object_index)
{
	show_error("Test failed, expected: " + object_get_name(arg_object_index) + ", actual: " + object_get_name(arg_instance.object_index), true);
}
else show_debug_message("test passed for " + object_get_name(arg_object_index));