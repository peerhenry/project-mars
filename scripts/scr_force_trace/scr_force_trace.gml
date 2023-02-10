/// @description Trace method
/// @param {string} arg_text Message
/// @param {...number} var_args Optional extra aguments (max 15)
function scr_force_trace() {

	var arg_text = argument[0];

	// var prefix = (object_index > 0) ? "(@" + object_get_name(object_index) + ") " : "";
	var prefix = "";
	var msg = "[TRACE-" + string(current_time) + "]: " + prefix + string(arg_text);
	for(var i = 1; i < argument_count; i++) msg += " " + string(argument[i]);

	show_debug_message(msg);


}
