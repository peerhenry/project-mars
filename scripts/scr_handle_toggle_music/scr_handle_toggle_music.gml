function scr_handle_toggle_music() {
	if(global.music_is_playing)
	{
		global.music_is_playing = false;
		audio_stop_sound(global.current_song);
	}
	else
	{
		global.music_is_playing = true;
	}


}
