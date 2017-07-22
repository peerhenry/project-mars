/// @param instance
/// @param object_index
/// @param show_popup
var arg_instance = argument0;
var arg_object_index = argument1;
var arg_show_popup = argument2;

var fail_message = "instance " + string(arg_instance) + " was of type: " + string(arg_instance.object_index) + " but expected: " + string(arg_object_index);
var success_message = "instance " + string(arg_instance) + " was of expected type: " + string(arg_instance.object_index);
var message = success_message;

if(arg_instance.object_index != arg_object_index)
{
	message = fail_message;
}

if(show_popup)
{
	show_message(message);
}
else show_debug_message(message)