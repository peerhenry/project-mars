if(show_details) // todo: menu must not be showing...
{
	var display_height = display_get_gui_height();
	var icon_top = display_height - 40;
	var window_mouse_y = window_mouse_get_y();
	if(window_mouse_y > icon_top && window_mouse_y < icon_top + 32)
	{
		var window_mouse_x = window_mouse_get_x();
		var display_width = display_get_gui_width();
		var atw = 4*32 + 2*8 + 3*4; // icons + padding + spacing
		var icon_x_or = display_width - atw + 8;
		var icon_left1 = icon_x_or;
		var icon_left2 = icon_x_or + (32+4);
		var icon_left3 = icon_x_or + (32+4)*2;
		var icon_left4 = icon_x_or + (32+4)*3;
		if(window_mouse_x > icon_left1 && window_mouse_x < icon_left1 + 32){
			auto_attack = !auto_attack;
		}
		else if(window_mouse_x > icon_left2 && window_mouse_x < icon_left2 + 32){
			auto_construct = !auto_construct;
		}
		else if(window_mouse_x > icon_left3 && window_mouse_x < icon_left3 + 32){
			auto_sleep = !auto_sleep;
		}
		else if(window_mouse_x > icon_left4 && window_mouse_x < icon_left4 + 32){
			auto_eat = !auto_eat;
		}
		
		// DEBUG
		//auto_attack = !auto_attack;
		//auto_construct = !auto_construct;
		//auto_sleep = !auto_sleep;
		//auto_eat = !auto_eat;
	}
}