/// @description Shoot

var can_shoot = false;
var shootable = target;

if(instance_exists(target))
{
	var dx = target.x - x;
	var dy = target.y - y;
	if((dx*dx + dy*dy) <= (global.shooting_range_squared*1024))
	{
		can_shoot = true;
		if(is_walking) scr_stop_moving(id);
	}
	else
	{
		scr_navigate(id, target.x, target.y);
	}
}
else
{
	if(!is_walking)
	{
		if(auto_target == noone)
		{
			auto_target = instance_nearest(x, y, enemy_object);
		}
		if(instance_exists(auto_target))
		{
			var dx = auto_target.x - x;
			var dy = auto_target.y - y;
			if((dx*dx + dy*dy) <= (global.shooting_range_squared*1024))
			{
				shootable = auto_target;
				can_shoot = true;
			}
			else auto_target = noone;
		}
		else auto_target = noone;
	}
}

// shoot at target
if(can_shoot && instance_exists(shootable))
{
	var has_shot = scr_shoot(id, shootable);
	if(has_shot)
	{
		if(current_action == astronaut_action.constructing)
		{
			construction_instance[@construction_build_state] = construction_state.ready;
		}
		current_action = astronaut_action.in_combat;
	}
}

alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));