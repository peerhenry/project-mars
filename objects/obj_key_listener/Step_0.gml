if(keyboard_check_pressed(vk_f11))
{
	room_goto(0); // should use fade shit
}

if(keyboard_check_pressed(vk_f12))
{
	// application quit
	game_end();
}

if(keyboard_check_pressed(ord("Z")))
{
	scr_toggle_zoom();
}

if(keyboard_check_pressed(ord("R")))
{
	scr_increment_build_rotation(1);
}

if(keyboard_check_pressed(ord("N")))
{
	if(!global.music_is_playing)
	{
		global.music_is_playing = true;
	}
	else
	{
		audio_stop_sound(global.current_song);
	}
}

if(keyboard_check_pressed(ord("Y")))
{
	scr_toggle_tall_walls();
}