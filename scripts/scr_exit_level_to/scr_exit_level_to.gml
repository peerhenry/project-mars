function scr_exit_level_to(argument0) {
	var continuous_music = global.settings[? key_settings_sound_continuous_music]
	if(global.music_is_playing && !continuous_music)
	{
		global.music_is_playing = false;
		audio_stop_sound(global.current_song);
	}
	global.mission_is_active = false;
	room_persistent = false;

	with(obj_constructable)
	{
		instance_destroy();
	}
	with(all)
	{
		if(object_index == obj_persistent_listener) continue; //exclude
		if(continuous_music && object_index == obj_music) continue; // dont destroy obj_music if it's supposed to be continuous
		instance_destroy();
	}

	room_goto(argument0); // todo: find all places where this is called, check for memory leaks


}
