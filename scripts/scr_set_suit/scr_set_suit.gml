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
		switch(sprite_index)
		{
			case sprite_walk_down: sprite_index = sprite_down; break;
			case sprite_walk_right: sprite_index = sprite_right; break;
			case sprite_walk_up: sprite_index = sprite_up; break;
		}
		sprite_walk_down = sprite_down;
		sprite_walk_right = sprite_right;
		sprite_walk_up = sprite_up;
	}
	else
	{
		switch(sprite_index)
		{
			case sprite_walk_down: sprite_index = sprite_suitless_down; break;
			case sprite_walk_right: sprite_index = sprite_suitless_right; break;
			case sprite_walk_up: sprite_index = sprite_suitless_up; break;
		}
		sprite_walk_down = sprite_suitless_down;
		sprite_walk_right = sprite_suitless_right;
		sprite_walk_up = sprite_suitless_up;
	}
}