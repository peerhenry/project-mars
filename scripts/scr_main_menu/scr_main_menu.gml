/// @description script is called at main menu creation
function scr_main_menu() {

	// Play menu song
	if(!global.dev_env && !audio_is_playing(song_menu) && !instance_exists(obj_music))
	{
		audio_play_sound(song_menu, 1, false);
	}


}
