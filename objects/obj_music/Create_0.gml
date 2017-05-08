audio_stop_sound(song_menu);
audio_stop_sound(song_work);
global.music_is_playing = false;
global.current_song = -1;

var start_with_music = false; // you want music?
index = 0; // set initial song

if(!global.music_is_playing && start_with_music)
{
	switch(index)
	{
		case 0:
			audio_play_sound(song_work, 1, false);
			global.current_song = song_work;
			break;
		case 1:
			audio_play_sound(song_explore, 1, false);
			global.current_song = song_explore;
			break;
	}

	global.music_is_playing = true;
}