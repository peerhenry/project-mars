// 1. reset target
target = noone;

// 2. acquire target
if(!is_walking)
{
	target = instance_nearest(x, y, enemy_object);
	if(target != noone)
	{
		var dx = target.x - x;
		var dy = target.y - y;
		if((dx*dx + dy*dy) > (global.shooting_range_squared*1024))
		{
			target = noone;
		}
	}
}

// 3. shoot at target
if(target != noone)
{
	var can_shoot = scr_shoot(id, target);
	if(can_shoot)
	{
		if(current_action == astronaut_action.constructing || current_action == astronaut_action.moving_to_construction)
		{
			construction[@construction_build_state] = build_state.ready;
		}
		current_action = astronaut_action.in_combat;
	}
}

alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));