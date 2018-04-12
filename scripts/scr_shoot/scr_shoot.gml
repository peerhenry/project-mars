/// @param script_container
/// @param shooter
/// @param target
var container = argument0;
var shooter = argument1;
var target = argument2;

var weapon = shooter.equipped_item;
var shot = false;

if( weapon.type == inv_space.rifle  && weapon.charge > 0 )
{
	shot = scr_create_rifle_shot(shooter, target);
	weapon.charge -= 1;
	if(weapon.charge < 0) weapon.charge = 0;
}
else if( weapon.type == inv_space.pistol  && weapon.charge > 0 )
{
	shot = scr_create_projectile(shooter, target);
	if(shot)
	{
		// play laser 1
		weapon.charge -= 1;
		var play_sound = script_container_resolve(shooter.script_container, "play_sound");
		script_execute(play_sound, sound_fx_laser);
	}
}

if(!shot) return false;

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
			sprite_index = sprite_down_pistol;
			mask_sprite = sprite_mask_down;
		}
		else
		{
			// look east
			sprite_index = sprite_right_pistol;
			mask_sprite = sprite_mask_right;
			image_xscale = -1;
		}
	}
	else
	{
		if(dy > -dx)
		{
			// look west
			sprite_index = sprite_right_pistol;
			mask_sprite = sprite_mask_right;
			image_xscale = 1;
		}
		else
		{
			// look north
			sprite_index = sprite_up_pistol;
			mask_sprite = sprite_mask_up;
		}
	}
}

return true;