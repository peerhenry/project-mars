if(global.music_is_playing)
{
	if (!audio_is_playing(global.current_song)) // song is finished
	{
		index = ( index + 1 ) % 4; // modulo song count
		var next_song = 0;
		switch(index)
		{
			case 0: next_song = song_work; break;
			case 1: next_song = song_explore; break;
			case 2: next_song = song_dig; break;
			case 3: next_song = song_claim; break;
		}
		audio_play_sound(next_song, 1, false);
		global.current_song = next_song;
	}
}