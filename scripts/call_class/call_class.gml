/// @arg class
/// @arg instance
/// @arg method
/// @arg arguments
var class = argument0;
var instance = argument1;
var method = argument2;
var args = argument3;
if(!is_array(args)) args = [args];

#region trace call
var trace_it = debug_mode && class != c_result && method != get_object_index;
if(trace_it)
{
	var prefix = ""; //(object_index > 0) ? "(@" + object_get_name(object_index) + ") " : "";
	var argy = "";
	var arg_coount = is_array(args) ? scr_length(args) : 0;
	if(arg_coount > 0)
	{
		argy = string(args[0]);
		for(var n = 1; n < arg_coount; n++)
		{
			argy = argy + ", " + string(args[n]);
		}
	}
	show_debug_message("[CALL] " + script_get_name(class) + "." + method + "(" + argy + ")");
}
#endregion trace call

var result = script_execute(class, method, instance, args);
if(result.refused_request)
{
	instance_destroy(result);
	var parent = cs_get_parent_class(class);
	result = call_class(parent, instance, method, args);
}
else
{
	if(method == get_object_index && result.value == noone) scr_panic("result.value is noone in get_object_index for " + script_get_name(class));
}

#region trace result
if(trace_it)
{
	// don't trace return if return is a void OK
	if(result.status != STATUS.OK || result.value != noone)
	{
		var res_str = void_unwrap(result, "to_string");
		show_debug_message("[RETURN] " + res_str);
	}
}
#endregion

return result;