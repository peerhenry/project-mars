if(global.music_is_playing)
{
	if (!audio_is_playing(global.current_song)) // song is finished
	{
		song_count = array_length_1d(songs);
		index = ( index + 1 ) % song_count;
		var next_song = songs[index];
		audio_play_sound(next_song, 1, false);
		global.current_song = next_song;
	}
}