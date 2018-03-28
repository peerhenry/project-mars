if(global.room_is_transitioning) exit;

//init text size
if(text_width < 0 || text_height < 0)
{
	draw_set_font(font);
	text_width = string_width(caption);
	text_height = string_height(caption);
}

//check hovered
if(enabled)
{
	var left = x + focus_indent;
	var right = left + text_width;
	var top = y;
	var bottom = y + text_height;
	if(mouse_x >= left && mouse_x < right && mouse_y >= top && mouse_y < bottom)
	{
		if(!hover)
		{
			// mouse enter
			audio_play_sound(sound_hover, 1, false);
		}
		hover = true;
	}
	else hover = false;
}

//check clicked
if(enabled && hover && mouse_check_button_released(mb_left))
{
	with(obj_menu)
	{
		audio_play_sound(sound_click, 1, false);
		event_user(0); //select focussed item
		break;
	}
}