#region tooltip

if(hover)
{
	var gui_x = window_mouse_get_x();
	var gui_y = window_mouse_get_y();
	var tt_x = gui_x + 16;
	var tt_y = gui_y + 16;
	if(gui_x < left + need_bar_offset)
	{
		scr_draw_hud_tooltip(tt_x, tt_y, "health: " + string(floor(entity.entity_health)) + "/100");
	}
	else
	{
		var is_astro = scr_instance_inherits(entity, obj_astronaut);
		
		var next_bar_left = left + need_bar_offset + need_bar_space;
		var next_bar_right = next_bar_left + need_bar_width;
		if(gui_x >= next_bar_left && gui_x <= next_bar_right)
		{
			if(is_astro) scr_draw_hud_tooltip(tt_x, tt_y, "food: " + string(floor(entity.food_level)) + "/100");
			else if(entity.object_index == obj_robot) scr_draw_hud_tooltip(tt_x, tt_y, "battery charge: " + string(floor(entity.battery_charge)) + "/100");
			exit;
		}
		next_bar_left = next_bar_right + need_bar_space;
		next_bar_right = next_bar_left + need_bar_width;
		if(gui_x >= next_bar_left && gui_x <= next_bar_right && is_astro)
		{
			scr_draw_hud_tooltip(tt_x, tt_y, "sleep: " + string(floor(entity.sleep_level)) + "/100");
			exit;
		}
		next_bar_left = next_bar_right + need_bar_space;
		next_bar_right = next_bar_left + need_bar_width;
		if(gui_x >= next_bar_left && gui_x <= next_bar_right && is_astro && entity.wears_suit)
		{
			scr_draw_hud_tooltip(tt_x, tt_y, "suit oxygen: " + string(floor(entity.suit_oxygen)) + "/100");
			exit;
		}
		
		var next_icon_left = left + icon_offset + icon_space;
		var next_icon_right = next_icon_left + icon_width;
		with(entity)
		{
			if(gui_x > next_icon_left && gui_x < next_icon_right)
			{
				scr_draw_hud_tooltip(tt_x, tt_y, "toggle auto attack");
				exit;
			}
			next_icon_left = next_icon_right + other.icon_space;
			next_icon_right = next_icon_left + other.icon_width;
			if(gui_x > next_icon_left && gui_x < next_icon_right)
			{
				scr_draw_hud_tooltip(tt_x, tt_y, "toggle auto construct");
				exit;
			}
			if(is_astro)
			{
				next_icon_left = next_icon_right + other.icon_space;
				next_icon_right = next_icon_left + other.icon_width;
				if(gui_x > next_icon_left && gui_x < next_icon_right)
				{
					scr_draw_hud_tooltip(tt_x, tt_y, "toggle auto sleep");
					exit;
				}
				next_icon_left = next_icon_right + other.icon_space;
				next_icon_right = next_icon_left + other.icon_width;
				if(gui_x > next_icon_left && gui_x < next_icon_right)
				{
					scr_draw_hud_tooltip(tt_x, tt_y, "toggle auto eat");
					exit;
				}
			}
		}
	}
}

#endregion