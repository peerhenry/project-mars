function scr_closet_take_suit(argument0, argument1) {
	var arg_closet = argument0;
	var arg_astronaut = argument1;

	if(!arg_astronaut.wears_suit && arg_closet.holds_suit){
		arg_closet.holds_suit = false;
		arg_closet.image_index += 4;
		arg_astronaut.suit_oxygen = arg_closet.suit_oxygen;
	
		scr_set_suit(arg_astronaut, true);
	
		var play = script_container_resolve(arg_astronaut.script_container, "play_sound");
		script_execute(play, sound_fx_suit_pressure);
	}


}
