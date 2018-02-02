/// @param astronaut
var astronaut = argument0;

// create corpse
var create_corpse = script_container_resolve(astronaut.script_container, "create_corpse");
script_execute(create_corpse, astronaut);

scr_cancel_current_action(astronaut);
with(astronaut)
{
	has_died = true;
	if(object_index == obj_astronaut_playable)
	{
		if(!audio_is_playing(sound_fx_flatline))
		{
			var play_sound = script_container_resolve(script_container, "play_sound");
			script_execute(play_sound, sound_fx_flatline);
		}
	}
}

instance_destroy(astronaut);