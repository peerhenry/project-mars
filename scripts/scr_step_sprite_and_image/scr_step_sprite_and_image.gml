/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	if(is_walking)
	{
		image_speed = 1.2;
		var dx = x - prev_x;
		var dy = y - prev_y;
		if(dx > 0)
		{
			moveDir = right;
		}
		else if(dx < 0)
		{
			moveDir = left;
		}
		if(dy < 0)
		{
			if(dy < dx - 0.1) moveDir = up;
		}
		else if(dy > 0 && dy > dx + 0.1)
		{
			moveDir = down;
		}
	
		prev_x = x;
		prev_y = y;
	
		switch(moveDir)
		{
			case up:
			{
				if(sprite_index != sprite_walk_up)
				{
					sprite_index = sprite_walk_up;
					mask_sprite = sprite_mask_up;
				}
				break;
			}
			case down:
			{
				if(sprite_index != sprite_walk_down)
				{
					sprite_index = sprite_walk_down;
					mask_sprite = sprite_mask_down;
				}
				break;
			}
			case left:
			{
				if(sprite_index != sprite_walk_right || image_xscale != -1)
				{
					sprite_index = sprite_walk_right;
					mask_sprite = sprite_mask_right;
					image_xscale = -1;
				}
				break;
			}
			case right:
			{
				if(sprite_index != sprite_walk_right || image_xscale != 1)
				{
					sprite_index = sprite_walk_right;
					mask_sprite = sprite_mask_right;
					image_xscale = 1;
				}
				break;
			}
		}
	}
	else
	{
		image_speed = 0;
		image_index = 0;
	}
}