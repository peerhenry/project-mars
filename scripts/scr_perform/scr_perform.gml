/// @description This script performs the interaction the astronaut will have with the assignable.
/// @param assignable
function scr_perform(argument0) {
	var arg_assignable = argument0;

	with(arg_assignable)
	{
		event_user(macro_event_interact);
	}




}
