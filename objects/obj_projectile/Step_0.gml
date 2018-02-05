if(path_position == 1)
{
	var unlucky_astronaut = instance_position(x, y, obj_astronaut); // HIT
	if(unlucky_astronaut != noone)
	{
		with(unlucky_astronaut)
		{
			astronaut_health -= other.damage;
			if(astronaut_health < 0) astronaut_health = 0;	
		}
	}
	else
	{
		var unlucky_construction = scr_get_component(x, y);
		if(unlucky_construction != noone)
		{
			with(unlucky_construction)
			{
				damage += other.damage;
			}
			show_debug_message("unlucky construction damage: " + string(unlucky_construction.damage));
		}
	}
	instance_destroy();
}