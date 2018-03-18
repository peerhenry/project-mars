if(global.music_is_playing)
{
	global.music_is_playing = false;
	audio_stop_sound(global.current_song);
}
global.mission_is_active = false;
room_persistent = false;
room_goto(argument0);