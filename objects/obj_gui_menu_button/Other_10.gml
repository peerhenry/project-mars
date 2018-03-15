/// @description click callback

if(script_exists(callback))
{
	if(callback_arg != noone) script_execute(callback, callback_arg);
	else script_execute(callback);
}