/// @description Close
/*
if(is_active)
{
	if(confirm_state == true)
	{
		if(script_exists(yes_callback))
		{
			script_execute(yes_callback);
		}
	}
	else
	{
		if(script_exists(no_callback))
		{
			script_execute(no_callback);
		}
	}
}
*/
event_inherited();
instance_destroy();