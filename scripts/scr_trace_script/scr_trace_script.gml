/// @param script_name
/// @param parameters_array
function scr_trace_script(argument0, argument1) {
	if(!global.enable_trace) exit;
	var arg_script_name = argument0;
	var arg_params = argument1;

	if(!is_array(arg_params)) show_error("trace_script should be called with an array", true);

	var prefix = "";
	if(object_index > 0)
	{
		prefix = "(@" + object_get_name(object_index) + ") ";
	}

	var msg = arg_script_name + "(";
	var p_length = array_length_1d(arg_params);
	for(var n = 0; n < p_length; n++)
	{
		msg += string(arg_params[n]);
		if(n < (p_length-1)) msg = msg + ", ";
	}
	msg = msg + ")";

	show_debug_message("[TRACE]: " + prefix + string(msg));


}
