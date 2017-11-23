event_inherited();

if(show_details)
{
	var width = 384;
	var height = 32 + 16 + 24*5 + 64*3 + 96;// padding + spaces + lines + inventory + avatar
	var display_width = display_get_gui_width();
	var display_height = display_get_gui_height();
	var left = display_width - width;
	var top = 0;
	
	// panel
	var right = left + width;
	var bottom = top + height;
	
	var window_mouse_x = window_mouse_get_x();
	var window_mouse_y = window_mouse_get_y();
	var mouse_over_details_panel = window_mouse_x > left 
		&& window_mouse_x < right
		&& window_mouse_y > top
		&& window_mouse_y < bottom;
	
	if(mouse_over_details_panel) global.hovering_over_hud_panel = true;
	else{
		var atw = 4*32 + 2*8 + 3*4; // icons + padding + spacing
		var ath = 48;
		var at_left = display_width - atw;
		var at_top = display_height - ath;
		var at_right = display_width;
		var at_bottom = display_height;
		var mouse_over_at_panel = window_mouse_x > at_left 
			&& window_mouse_x < at_right
			&& window_mouse_y > at_top
			&& window_mouse_y < at_bottom;
		if(mouse_over_at_panel) global.hovering_over_hud_panel = true;
	}
}