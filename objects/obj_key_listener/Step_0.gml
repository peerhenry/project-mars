if(keyboard_check_pressed(vk_escape))
{
	room_goto(0); // should use fade shit
}

if(keyboard_check_pressed(ord("Z")))
{
	var width = window_get_width();
	var height = window_get_height();
	zoomed_in = !zoomed_in;
	if(zoomed_in)
	{
		scr_zoom(width/2, height/2);
	}
	else
	{
		scr_zoom(width, height);
	}
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
	walls_tall = !walls_tall;
	if(walls_tall)
	{
		with(obj_wall)
		{
			sprite_index = spr_wall_tall;
		}
	}
	else
	{
		with(obj_wall)
		{
			sprite_index = spr_wall;
		}
	}
}