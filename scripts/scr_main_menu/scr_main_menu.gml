/// @description script is called at main menu creation

// Play menu song
if(!global.dev_env && !audio_is_playing(song_menu))
{
	audio_play_sound(song_menu, 1, false);
}