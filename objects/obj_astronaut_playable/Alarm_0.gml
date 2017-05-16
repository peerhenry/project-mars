if(!is_walking)
{
	target = instance_nearest(x, y, obj_astronaut_enemy);
}

if(target != noone)
{
	scr_shoot(x, y, target.x, target.y);
}

alarm[0] = 60;