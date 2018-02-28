/// @descr cancels action, unassigns task and cancels walking
/// @arg entity
var arg_entity = argument0;


with(arg_entity)
{
	switch(action)
	{
		case cart_action.deploy:
			if(ghost != noone) instance_destroy(ghost);
			break;
		case cart_action.pickup:
			if(assigned_instance != noone)
			{
				if(variable_instance_exists(assigned_instance, "icon") && assigned_instance.icon != noone) instance_destroy(assigned_instance.icon);
				assigned_instance = noone;
			}
			break;
	}
	action = cart_action.idle;
	if(is_moving) scr_cancel_walking(id);
}