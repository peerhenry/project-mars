if(keyboard_check_pressed(vk_escape))
{
	room_goto(0); // should use fade shit
}

if(keyboard_check_pressed(ord("Z")))
{
	zoomed_in = !zoomed_in;
	if(zoomed_in) scr_zoom(960, 540);
	else scr_zoom(1920, 1080);
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