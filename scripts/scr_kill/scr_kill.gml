/// @param astronaut
var astronaut = argument0;

// create corpse
var create_corpse = script_container_resolve(astronaut.script_container, "create_corpse");
script_execute(create_corpse, astronaut);

with(astronaut)
{
	has_died = true;
	if(object_index == obj_astronaut_playable)
	{
		var play_sound = script_container_resolve(script_container, "play_sound");
		script_execute(play_sound, sound_fx_flatline);
	}
}

instance_destroy(astronaut);