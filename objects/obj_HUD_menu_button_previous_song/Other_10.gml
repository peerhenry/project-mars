audio_stop_sound(global.current_song);
with(obj_music)
{
	if(index - 2 < -1) index = array_length_1d(songs) - 2;
	else index -= 2;
}