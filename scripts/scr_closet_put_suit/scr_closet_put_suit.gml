var arg_closet = argument0;
var arg_astronaut = argument1;

if(arg_astronaut.wears_suit && !arg_closet.holds_suit){
	arg_astronaut.wears_suit = false;
	arg_closet.holds_suit = true;
	arg_closet.image_index -= 4;
	arg_closet.suit_oxygen = arg_astronaut.suit_oxygen;
	
	with(arg_astronaut)
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
	
	audio_play_sound(sound_fx_suit_pressure, 0, 0);
}