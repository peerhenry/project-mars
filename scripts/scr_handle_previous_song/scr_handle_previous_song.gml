function scr_handle_previous_song() {
	audio_stop_sound(global.current_song); // obj_music will move to next song
	with(obj_music)
	{
		if(index - 2 < -1) index = array_length_1d(songs) - 2;
		else index -= 2;
	}


}
