if( show_details )
{
	var tl_x = display_get_gui_width() - width - ap_offset;
	var tl_y = 0;
	
	// panel
	var tl_x2 = tl_x + width;
	var tl_y2 = tl_y + height;
	scr_draw_panel(tl_x, tl_y, tl_x2, tl_y2);
		
	// text
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var x_or = tl_x + 8;
	var y_or = tl_y + 24 + 8;
	var half_bar = 8;
	var bar_x_or = tl_x;
	
	var grid_type_string = scr_grid_type_to_string(grid_type);
	draw_text(x_or, 8, grid_type_string);
	
	var line1_y = y_or;
	draw_text(x_or, line1_y, "storage: " + string(display_storage));
	
	var line2_y = y_or + 24;
	draw_text(x_or, line2_y, "storage capacity: " + string(display_storage_capacity));
	
	var line3_y = y_or + 48;
	draw_text(x_or, line3_y, "production: " + string(display_total_production));
	
	var line4_y = y_or + 72;
	draw_text(x_or, line4_y, "demand: " + string(display_total_demand));
	
	var line5_y = y_or + 96;
	draw_text(x_or, line5_y, "net output: " + string(display_net_output));
}