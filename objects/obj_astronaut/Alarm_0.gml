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

if(target != noone)
{
	scr_shoot(id, target);
}

alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));