
var new_j = scr_rc_to_gi(y);
if(new_j != jj)
{
	jj = new_j;
	depth = -jj-1;
}


if(path_position == 1)
{
	//var unlucky_entity = instance_position(x, y, obj_astronaut);
	var unlucky_entity = instance_position(x, y, obj_movable);
	if(unlucky_entity != noone)
	{
		with(unlucky_entity)
		{
			entity_health -= other.damage;
			if(entity_health < 0) entity_health = 0;	
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