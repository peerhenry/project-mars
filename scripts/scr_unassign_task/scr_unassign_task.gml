/// @param assignable
var arg_assignable = argument0;

with(arg_assignable)
{
	assigned_astronaut.assigned_object = noone;
	assigned_astronaut.current_action = astronaut_action.idle;
	is_assigned = false;
	assigned_astronaut = noone;
	if(icon != noone)
	{
		instance_destroy(icon);
		icon = noone;
	}
}