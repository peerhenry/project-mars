if(global.music_is_playing)
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
	instance_destroy();
}

room_goto(argument0); // todo: find all places where this is called, check for memory leaks