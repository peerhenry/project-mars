/// @param instance
/// @param parent_object_index
var arg_instance = argument0;
var arg_object_index = argument1;

if(!debug_mode) exit;

if(!object_is_ancestor(arg_instance.object_index, arg_object_index))
{
	if(arg_instance.object_index != arg_object_index){
		show_error("ERROR: Instance of " + object_get_name(arg_instance.object_index) + " did not inherit from: " + object_get_name(arg_object_index), true);
	}
}