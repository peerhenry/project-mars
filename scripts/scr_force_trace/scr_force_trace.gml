/// @arg message
var arg_text = argument0;
var prefix = "";
if(object_index > 0)
{
	prefix = "(@" + object_get_name(object_index) + ") ";
}
show_debug_message("[TRACE-" + string(current_time) + "]: " + prefix + string(arg_text));