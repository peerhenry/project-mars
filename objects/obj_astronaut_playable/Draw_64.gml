// todo: remove this
if(show_details && false)
{	
	// only stuff remaining is what hasn't been moved yet
	// todo: move that stuff
	
	/*
	
	#region debug info
	if(debug_mode || global.dev_env)
	{
		var after_grid_y = grid_y + 128;
		draw_text(x_or, after_grid_y, "construction: " + string(construction));
		draw_text(x_or, after_grid_y+24, "current_action: " + scr_action_to_string(current_action));
		draw_text(x_or, after_grid_y+48, "assigned_object: " + string(assigned_object));
		draw_text(x_or, after_grid_y+72, "path_exists(path): " + string(path_exists(path)));
		draw_text(x_or, after_grid_y+96, "path_position: " + string(path_position));
		draw_text(x_or, after_grid_y+120, "target: " + string(target));
		draw_text(x_or, after_grid_y+144, "last_cancel_walking_result: " + string(last_cancel_walking_result));
		draw_text(x_or, after_grid_y+168, "path_index: " + string(path_index));
		draw_text(x_or, after_grid_y+192, "path: " + string(path));
		draw_text(x_or, after_grid_y+216, "path_positionprevious: " + string(path_positionprevious));
	}
	#endregion
	
	#region	auto tasks -- second panel
	
	// panel
	var atw = 4*32 + 2*8 + 3*4; // icons + padding + spacing
	var ath = 48;
	scr_draw_panel(gui_width - atw, gui_height - ath, gui_width, gui_height);
	
	// icons
	var counter = 0;
	var icon_top = gui_height - ath + 8;
	var icon_x_or = gui_width - atw + 8;
	draw_sprite(spr_auto_attack, auto_attack, icon_x_or + (32+4)*counter, icon_top);
	counter++;
	draw_sprite(spr_auto_construct, auto_construct, icon_x_or + (32+4)*counter, icon_top);
	counter++;
	draw_sprite(spr_auto_sleep, auto_sleep, icon_x_or + (32+4)*counter, icon_top);
	counter++;
	draw_sprite(spr_auto_feed, auto_eat, icon_x_or + (32+4)*counter, icon_top);
	
	#endregion
	
	*/
}