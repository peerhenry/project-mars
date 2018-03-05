var gui_x = window_mouse_get_x();
if(hover)
{
	if(gui_x < left + need_bar_offset)
	{
		var add_to_select = keyboard_check(vk_shift) || keyboard_check(vk_control);
		if( !add_to_select )
		{
			with(obj_movable) is_selected = false;
		}
		entity.is_selected = !entity.is_selected;
		if(entity.is_selected) scr_play_selection_sound(entity);
	}
	else
	{
		var next_icon_left = left + icon_offset + icon_space;
		var next_icon_right = next_icon_left + icon_width;
		with(entity)
		{
			if(gui_x > next_icon_left && gui_x < next_icon_right) auto_attack = !auto_attack;
			next_icon_left = next_icon_right + other.icon_space;
			next_icon_right = next_icon_left + other.icon_width;
			if(gui_x > next_icon_left && gui_x < next_icon_right) auto_construct = !auto_construct;
			if(scr_instance_inherits(id, obj_astronaut))
			{
				next_icon_left = next_icon_right + other.icon_space;
				next_icon_right = next_icon_left + other.icon_width;
				if(gui_x > next_icon_left && gui_x < next_icon_right) auto_sleep = !auto_sleep;
				next_icon_left = next_icon_right + other.icon_space;
				next_icon_right = next_icon_left + other.icon_width;
				if(gui_x > next_icon_left && gui_x < next_icon_right) auto_eat = !auto_eat;
			}
		}
	}
}