/// @param attacker
/// @param target
var arg_attacker = argument0;
var arg_target = argument1;

with(arg_attacker)
{
	target = arg_target;
	
	if(is_moving || !scr_target_is_within_range(id, target) || !scr_can_shoot_unobstructed(id, target))
	{
		var can_pursue = scr_pursue_target(id);
		if(!can_pursue)
		{
			// can't attack target
			target = noone;
		}
	}

	return target != noone;
}