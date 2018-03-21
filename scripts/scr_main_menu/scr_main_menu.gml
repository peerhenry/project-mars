/// @description script is called at main menu creation
application_surface_draw_enable(true);
cursor_sprite = spr_cursor;

// Play menu song
if(!global.dev_env && !audio_is_playing(song_menu))
{
	audio_play_sound(song_menu, 1, false);
}

scr_zoom_camera_to_resolution(); //todo: <-- check these calls are necessary otherwise remove?