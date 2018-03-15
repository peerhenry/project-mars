if(global.music_is_playing)
{
	global.music_is_playing = false;
	audio_stop_sound(global.current_song);
}
room_goto(room_menu);