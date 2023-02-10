/// @arg astronaut
function scr_step_sprite_and_image(argument0) {
	var arg_astronaut = argument0;

	with(arg_astronaut)
	{
		if(path_exists(path))
		{
			image_speed = 1.2;
			var dx = x - prev_x;
			var dy = y - prev_y;
			if(dx > 0)
			{
				move_dir = macro_right;
			}
			else if(dx < 0)
			{
				move_dir = macro_left;
			}
			if(dy < 0)
			{
				if(dy < dx - 0.1) move_dir = macro_up;
			}
			else if(dy > 0 && dy > dx + 0.1)
			{
				move_dir = macro_down;
			}
	
			prev_x = x;
			prev_y = y;
	
			switch(move_dir)
			{
				case macro_up:
				{
					if(sprite_index != sprite_up)
					{
						sprite_index = sprite_up;
						mask_sprite = sprite_mask_up;
					}
					break;
				}
				case macro_down:
				{
					if(sprite_index != sprite_down)
					{
						sprite_index = sprite_down;
						mask_sprite = sprite_mask_down;
					}
					break;
				}
				case macro_left:
				{
					if(sprite_index != sprite_right || image_xscale != -1)
					{
						sprite_index = sprite_right;
						mask_sprite = sprite_mask_right;
						image_xscale = -1;
					}
					break;
				}
				case macro_right:
				{
					if(sprite_index != sprite_right || image_xscale != 1)
					{
						sprite_index = sprite_right;
						mask_sprite = sprite_mask_right;
						image_xscale = 1;
					}
					break;
				}
			}
		}
		else
		{
			if(object_index != obj_cart) image_speed = 0; // cart sprite keeps moving
			image_index = 0;
		}
	}


}
