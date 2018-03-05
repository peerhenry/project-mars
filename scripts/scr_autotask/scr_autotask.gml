/// @arg astronaut
// scr_trace("scr_autotask");
debug_instance_inherits(argument0, obj_astronaut);
var arg_astronaut = argument0;

var auto_task_found = false;

with(arg_astronaut)
{
	// food
	if(!auto_task_found && auto_eat)
	{
		//auto_task_found  = scr_auto_eat(arg_astronaut);
	}
	// sleep
	if(!auto_task_found && auto_sleep)
	{
		auto_task_found  = scr_auto_sleep(arg_astronaut);
	}
	// construct
	if(!auto_task_found && auto_construct)
	{
		auto_task_found  = scr_look_for_construction(arg_astronaut);
	}
}