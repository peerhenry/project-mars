/// @arg astronaut
function scr_kill_astronaut(argument0) {
	var astronaut = argument0;

	// create corpse
	var create_corpse = script_container_resolve(astronaut.script_container, "create_corpse");
	script_execute(create_corpse, astronaut);

	// stop moving
	if(path_exists(astronaut.path)) scr_stop_moving(astronaut);
	scr_cancel_all(astronaut);

	// play sound if owner is player
	with(astronaut)
	{
		has_died = true;
		if(owner == macro_player)
		{
			if(!audio_is_playing(sound_fx_flatline))
			{
				var play_sound = script_container_resolve(script_container, "play_sound");
				script_execute(play_sound, sound_fx_flatline);
			}
		}
	}

	instance_destroy(astronaut);


}
