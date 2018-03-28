/// @description Click

if(script_exists(callback))
{
	resolve_execute(script_container, "play_sound", sound_click);
	if(callback_arg != noone) script_execute(callback, callback_arg);
	else script_execute(callback);
}