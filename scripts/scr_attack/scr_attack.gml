/// @param attacker
/// @param target
var arg_attacker = argument0;
var arg_target = argument1;

with(arg_attacker)
{
	target = arg_target;
	
	if(!scr_target_is_within_range(id, target))
	{
		var can_pursue = scr_pursue_target(id);
		if(!can_pursue)
		{
			// can't attack target
			target = noone;
		}
	}
	else if(!scr_can_shoot_unobstructed(id, target))
	{
		var can_navigate_to_target = scr_navigate(id, target.x, target.y);
		if(can_navigate_to_target)
		{
			current_action = astronaut_action.moving_to_target;	
		}
		else
		{
			// can't attack target
			target = noone;
		}
	}
	else
	{
		if(is_walking)
		{
			current_action = astronaut_action.moving_to_shoot;	
			scr_cancel_walking(id);
		}
	}
	return target != noone;
}