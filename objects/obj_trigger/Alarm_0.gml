if(!script_exists(script_condition))
{
	scr_warn("script_condition does not exist for trigger: " + name);
	alarm[0] = trigger_delay;
	exit;
}
if(!script_exists(script_trigger))
{
	scr_warn("script_trigger does not exist for trigger: " + name);	
	alarm[0] = trigger_delay;
	exit;
}

if(script_execute(script_condition, id))
{
	if(script_exists(script_trigger)) script_execute(script_trigger, id);
	with(level) event_user(macro_trigger_callback);
	trigger_count++;
	if(!once && continue_after_trigger) alarm[0] = trigger_delay;
}
else
{
	if(script_exists(script_else)) script_execute(script_else, id);
	with(level) event_user(macro_else_callback);
	if(!once) alarm[0] = trigger_delay;
}