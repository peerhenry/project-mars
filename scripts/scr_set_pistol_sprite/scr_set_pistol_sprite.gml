/// @arg task_actor
/// @arg direaction
/// @arg should_use_pistol
var arg_task_actor = argument0;
var arg_direction = argument1;
var arg_should_shoot = argument2;

with(arg_task_actor)
{
	var use_sprite_up = sprite_up_pistol;
	var use_sprite_right = sprite_right_pistol;
	var use_sprite_down = sprite_down_pistol;
	if(!arg_should_shoot)
	{
		use_sprite_up = sprite_up;
		use_sprite_right = sprite_right;
		use_sprite_down = sprite_down;
	}

	switch(arg_direction)
	{
		case macro_up:
			sprite_index = use_sprite_up;
			mask_sprite = sprite_mask_up;
			image_xscale = 1;
			break;
		case macro_down:
			sprite_index = use_sprite_down;
			mask_sprite = sprite_mask_down;
			image_xscale = 1;
			break;
		case macro_left:
			sprite_index = use_sprite_right;
			mask_sprite = sprite_mask_right;
			image_xscale = -1;
			break;
		case macro_right:
			sprite_index = use_sprite_right;
			mask_sprite = sprite_mask_right;
			image_xscale = 1;
			break;
	}
}