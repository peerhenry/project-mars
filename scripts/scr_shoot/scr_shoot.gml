/// @param script_container
/// @param shooter
/// @param target
var container = argument0;
var shooter = argument1;
var target = argument2;

var lid = layer_get_id("astronauts");
var new_projectile = instance_create_layer(shooter.x, shooter.y, lid, obj_projectile);
with(new_projectile)
{
	var can_shoot = mp_linear_path(path, target.x, target.y, global.projectile_speed, false);
	if(!can_shoot)
	{
		instance_destroy();
		return false;
	}
	path_start(path, global.projectile_speed, path_action_stop, false);	// false: don't go along an absolute path, go relative to your position	
	
	var pd = point_direction(shooter.x, shooter.y, target.x, target.y);
	var dd = angle_difference(image_angle, pd);
	image_angle -= dd;
}

// orient shooter towards target
with(shooter)
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
}

var play_sound = script_container_resolve(container, "play_sound");
script_execute(play_sound, sound_fx_laser);
return true;