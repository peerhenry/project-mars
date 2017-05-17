var arg_closet = argument0;
var arg_astronaut = argument1;

if(!arg_astronaut.wears_suit && arg_closet.holds_suit){
	arg_astronaut.wears_suit = true;
	arg_closet.holds_suit = false;
	arg_closet.image_index += 4;
	arg_astronaut.suit_oxygen = arg_closet.suit_oxygen;
	
	with(arg_astronaut)
	{
		sprite_walk_down = sprite_down;
		sprite_walk_right = sprite_right;
		sprite_walk_up = sprite_up;
	}
}

audio_play_sound(sound_fx_suit_pressure, 0, 0);