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
	var dx = target.x - x;
	var dy = target.y - y;
	
	if(dy > dx)
	{
		if(dy > -dx)
		{
			// look south
			sprite_index = sprite_down;
		}
		else
		{
			// look east
			sprite_index = sprite_right;
			image_xscale = -1;
		}
	}
	else
	{
		if(dy > -dx)
		{
			// look west
			sprite_index = sprite_right;
		}
		else
		{
			// look north
			sprite_index = sprite_up;
		}
	}
	
	scr_shoot(x, y, target.x, target.y);
}

alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));