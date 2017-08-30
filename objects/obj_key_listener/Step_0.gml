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
	var draw_tall_walls = !global.draw_tall_walls;
	global.draw_tall_walls = draw_tall_walls;
	if(draw_tall_walls)
	{
		with(obj_wall)
		{
			sprite_index = spr_wall_tall;
		}
		with(obj_door)
		{
			if(sprite_index == spr_door) sprite_index = spr_door_tall;
			if(sprite_index == spr_door_vertical) sprite_index = spr_door_tall_vertical;
		}
		with(obj_hatch)
		{
			if(sprite_index == spr_hatch) sprite_index = spr_hatch_tall;
			if(sprite_index == spr_hatch_vertical) sprite_index = spr_hatch_tall_vertical;
		}
	}
	else
	{
		with(obj_wall)
		{
			sprite_index = spr_wall;
		}
		with(obj_door)
		{
			if(sprite_index == spr_door_tall) sprite_index = spr_door;
			if(sprite_index == spr_door_tall_vertical) sprite_index = spr_door_vertical;
		}
		with(obj_hatch)
		{
			if(sprite_index == spr_hatch_tall) sprite_index = spr_hatch;
			if(sprite_index == spr_hatch_tall_vertical) sprite_index = spr_hatch_vertical;
		}
	}
}