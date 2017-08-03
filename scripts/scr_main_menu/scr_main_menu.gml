/// @description script is called at main menu creation

cursor_sprite = spr_cursor;

// Play menu song
if(!audio_is_playing(song_menu))
{
	audio_play_sound(song_menu, 1, false);
}

scr_zoom_camera_to_resultion();