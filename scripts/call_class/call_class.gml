/// @arg class
/// @arg instance
/// @arg method
/// @arg arguments
var class = argument0;
var instance = argument1;
var method = argument2;
var args = argument3;
if(debug_mode)
{
	var prefix = (object_index > 0) ? "(@" + object_get_name(object_index) + ") " : "";
	show_debug_message("[CALL " + prefix + "] " + script_get_name(class) + "." + method);
}
if(!is_array(args)) args = [args];
var result = script_execute(class, method, instance, args);
if(result.refused_request)
{
	instance_destroy(result);
	var parent = cs_get_parent_class(class);
	return call_class(parent, instance, method, args);
}
else
{
	if(method == get_object_index && result.value == noone) scr_panic("result.value is noone in get_object_index for " + script_get_name(class));
	return result;
}