
var new_j = scr_rc_to_gi(y);
if(new_j != jj)
{
	jj = new_j;
	depth = -jj-1;
}


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
		var unlucky_constructable = scr_get_component(x, y);
		if(unlucky_constructable != noone)
		{
			with(unlucky_constructable)
			{
				damage += other.damage;
			}
		}
	}
	var rx = random(10) - 5;
	var ry = random(10) - 5;
	instance_create_depth(x + rx, y + ry, depth, obj_hit);
	instance_destroy();
}