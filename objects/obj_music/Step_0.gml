/// @description Insert description here
// You can write your code in this editor

if index == 0
{
	if (!audio_is_playing(current_song)) // song is finished
	{
		audio_play_sound(song_explore, 1, false);
		index = 1;
		current_song = song_explore;
	}
}
else if(index == 1)
{
	if !audio_is_playing(current_song)
	{
		audio_play_sound(song_work, 1, false);
		index = 0;
		current_song = song_work;
	}
}