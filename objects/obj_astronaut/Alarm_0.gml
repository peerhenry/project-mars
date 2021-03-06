/// @description Shoot

if(path_exists(path))
{
	alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));
	exit;
}

var can_shoot = true;
var shootable = target;

// Determine if target exists and has not yet been killed/destroyed
var target_is_shootable = false;
var target_exists = instance_exists(target);
if(target_exists)
{
	var target_is_constructable = object_is_ancestor(target.object_index, obj_constructable);
	if(target_is_constructable)
	{
		target_is_shootable = target.damage < 100;
	}
	else {
		target_is_shootable = true;
	}
}
else target = noone;

// if astronaut has a shootable target, persue it.
if(target_is_shootable)
{
	can_shoot = scr_attack(id, target);
}
else	// See if there is an enemy around to shoot
{
	if(!path_exists(path))
	{
		if(auto_target == noone)
		{
			auto_target = scr_get_nearest_astronaut(id, enemy);
		}
		if(instance_exists(auto_target))
		{
			if(scr_target_is_within_range(id, auto_target))
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
	var has_shot = scr_shoot(script_container, id, shootable);
	if(has_shot)
	{
		// scr_cancel_current_action(id);
		current_action = astronaut_action.in_combat;
	}
}

alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));