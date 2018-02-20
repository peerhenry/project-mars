/// @param script_container
/// @param shooter
/// @param target
var container = argument0;
var shooter = argument1;
var target = argument2;

if( scr_inventory_has_item(shooter.inventory, macro_inventory_rifle) )
{
	scr_create_rifle_shot(shooter, target);
}
else if( scr_inventory_has_item(shooter.inventory, macro_inventory_pistol) )
{
	scr_create_projectile(shooter, target);
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
			sprite_index = sprite_active_down;
			mask_sprite = sprite_mask_down;
		}
		else
		{
			// look east
			sprite_index = sprite_active_right;
			mask_sprite = sprite_mask_right;
			image_xscale = -1;
		}
	}
	else
	{
		if(dy > -dx)
		{
			// look west
			sprite_index = sprite_active_right;
			mask_sprite = sprite_mask_right;
			image_xscale = 1;
		}
		else
		{
			// look north
			sprite_index = sprite_active_up;
			mask_sprite = sprite_mask_up;
		}
	}
}

return true;