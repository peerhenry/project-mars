audio_stop_sound(song_menu);
audio_stop_sound(song_work);
global.music_is_playing = false;
index = 1;
current_song = -1;

if(!global.music_is_playing)
{

	switch(index)
	{
		case 0:
			audio_play_sound(song_work, 1, false);
			current_song = song_work;
			break;
		case 1:
			audio_play_sound(song_explore, 1, false);
			current_song = song_explore;
			break;
	}

	
	global.music_is_playing = true;
}