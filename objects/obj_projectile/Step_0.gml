if(path_position == 1)
{
	var unlucky_astronaut = instance_position(x, y, obj_astronaut);
	if(unlucky_astronaut != noone)
	{
		with(unlucky_astronaut)
		{
			astronaut_health -= global.projectile_damage;
			if(astronaut_health < 0) astronaut_health = 0;	
		}
	}
	instance_destroy();
}