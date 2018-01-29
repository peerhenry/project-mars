/// @descr sets astronaut suit boolean and sprites
/// @arg astro
/// @arg wear_suit(bool)
var arg_astro = argument0;
var arg_wear = argument1;

with(arg_astro)
{
	wears_suit = arg_wear;
	if(arg_wear)
	{
		sprite_mask_down = spr_suit_mask_down;
		sprite_mask_right = spr_suit_mask_right;
		sprite_mask_up = spr_suit_mask_up;
		switch(sprite_index)
		{
			case sprite_walk_down: 
				sprite_index = sprite_down; 
				mask_sprite = sprite_mask_down;
				break;
			case sprite_walk_right: 
				sprite_index = sprite_right; 
				mask_sprite = sprite_mask_right;
				break;
			case sprite_walk_up: 
				sprite_index = sprite_up;
				mask_sprite = sprite_mask_up;
				break;
		}
		sprite_walk_down = sprite_down;
		sprite_walk_right = sprite_right;
		sprite_walk_up = sprite_up;
		mask_color = mask_color_suit;
	}
	else
	{
		sprite_mask_down = spr_male_mask_down;
		sprite_mask_right = spr_male_mask_right;
		sprite_mask_up = spr_male_mask_up;
		switch(sprite_index)
		{
			case sprite_walk_down: 
				sprite_index = sprite_suitless_down; 
				mask_sprite = sprite_mask_down;
				break;
			case sprite_walk_right: 
				sprite_index = sprite_suitless_right; 
				mask_sprite = sprite_mask_right;
				break;
			case sprite_walk_up: 
				sprite_index = sprite_suitless_up;
				mask_sprite = sprite_mask_up;
				break;
		}
		sprite_walk_down = sprite_suitless_down;
		sprite_walk_right = sprite_suitless_right;
		sprite_walk_up = sprite_suitless_up;
		mask_color = mask_color_clothes;
	}
}