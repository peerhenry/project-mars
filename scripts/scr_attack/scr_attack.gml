/// @param attacker
/// @param target
function scr_attack(argument0, argument1) {
	var arg_attacker = argument0;
	var arg_target = argument1;

	with(arg_attacker)
	{
		target = arg_target;
	
		if(path_exists(path) || !scr_can_shoot(id, target))
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


}
