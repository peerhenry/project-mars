/// @description Shoot

var can_shoot = false;
var shootable = target;

// Determine if target exists and has not yet been killed/destroyed
var target_is_shootable = instance_exists(target);
if(target_is_shootable)
{
	var target_is_construction = object_is_ancestor(target.object_index, obj_constructable);
	if(target_is_construction)
	{
		target_is_shootable = target.damage < 100;
	}
}

// Either stop moving and shoot, or move towards target
if(target_is_shootable)
{
	var dx = target.x - x;
	var dy = target.y - y;
	if((dx*dx + dy*dy) <= (global.shooting_range_squared*1024))
	{
		can_shoot = mp_linear_path(shoot_path, target.x, target.y, global.projectile_speed, false);
		if(is_walking)
		{
			if(can_shoot)
			{
				scr_stop_moving(id);
			}
			else exit; // keep moving
		}
	}
	else if(!is_walking)
	{
		scr_navigate(id, target.x, target.y);
	}
}
else	// See if there is an enemy around to shoot
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
				can_shoot = mp_linear_path(shoot_path, auto_target.x, auto_target.y, global.projectile_speed, false);
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
			construction[@construction_build_state] = construction_state.ready;
		}
		current_action = astronaut_action.in_combat;
	}
}

alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));