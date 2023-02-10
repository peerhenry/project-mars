/// @arg instance
function scr_finalize(argument0) {
	var arg_instance = argument0;
	with(arg_instance)
	{
		event_user(macro_event_finalize);
	}


}
