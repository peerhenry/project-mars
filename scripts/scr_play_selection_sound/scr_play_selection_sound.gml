/// @arg entity
function scr_play_selection_sound(argument0) {
	var arg_entity = argument0;
	if(scr_instance_inherits(arg_entity, obj_astronaut))
	{
		scr_play_astro_selection_sound();
	}
	else
	{
		audio_play_sound(sound_robot_ask, 1, false);
	}


}
