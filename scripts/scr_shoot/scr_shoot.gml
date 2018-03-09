/// @param script_container
/// @param shooter
/// @param target
var container = argument0;
var shooter = argument1;
var target = argument2;

if( scr_inventory_has_item_type(shooter.inventory, inv_space.rifle) )
{
	scr_create_rifle_shot(shooter, target);
}
else if( scr_inventory_has_item_type(shooter.inventory, inv_space.pistol) )
{
	var shot = scr_create_projectile(shooter, target);
	if(shot)
	{
		// play laser 1
		var play_sound = script_container_resolve(shooter.script_container, "play_sound");
		script_execute(play_sound, sound_fx_laser);
	}
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
			mask_sprite = sprite_mask_down;
		}
		else
		{
			// look east
			sprite_index = sprite_right;
			mask_sprite = sprite_mask_right;
			image_xscale = -1;
		}
	}
	else
	{
		if(dy > -dx)
		{
			// look west
			sprite_index = sprite_right;
			mask_sprite = sprite_mask_right;
			image_xscale = 1;
		}
		else
		{
			// look north
			sprite_index = sprite_up;
			mask_sprite = sprite_mask_up;
		}
	}
}

return true;