/// @descr sets astronaut suit boolean and sprites
/// @arg astro
/// @arg wear_suit(bool)
var arg_astro = argument0;
var arg_wear = argument1;

with(arg_astro)
{
	wears_suit = arg_wear;
	var sprite_set = scr_get_sprite_set(id);

	// update sprite and mask
	switch(sprite_index)
	{
		case sprite_down:
			sprite_index = sprite_set[0]; 
			mask_sprite = sprite_set[3];
			break;
		case sprite_right:
			sprite_index = sprite_set[1]; 
			mask_sprite =  sprite_set[4];
			break;
		case sprite_up:
			sprite_index = sprite_set[2];
			mask_sprite = sprite_set[5];
			break;
	}
	sprite_down = sprite_set[0];
	sprite_right = sprite_set[1];
	sprite_up = sprite_set[2];
	sprite_mask_down = sprite_set[3];
	sprite_mask_right = sprite_set[4];
	sprite_mask_up = sprite_set[5];
	sprite_down_pistol = sprite_set[6];
	sprite_right_pistol = sprite_set[7];
	sprite_up_pistol = sprite_set[8];
	
	// update mask color
	if(arg_wear) mask_color = mask_color_suit;
	else mask_color = mask_color_clothes;
}