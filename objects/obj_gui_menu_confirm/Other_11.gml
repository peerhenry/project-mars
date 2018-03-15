event_inherited();
if(confirm_state == true)
{
	if(yes_callback != noone && script_exists(yes_callback))
	{
		script_execute(yes_callback);
	}
}
else
{
	if(no_callback != noone && script_exists(no_callback))
	{
		script_execute(no_callback);
	}
}