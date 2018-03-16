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

// show_debug_message("obj_trigger alarm[0] for " + name); // DEBUG

if(script_execute(script_condition, id))
{
	script_execute(script_trigger, id);
	trigger_count++;
	if(!once && continue_after_trigger) alarm[0] = trigger_delay;
}
else
{
	if(script_exists(script_else)) script_execute(script_else, id);
	if(!once) alarm[0] = trigger_delay;
}