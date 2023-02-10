function scr_gui_draw_build_category_button(argument0) {
	var arg_gui_item = argument0;

	scr_gui_item_draw_button(arg_gui_item);
	with(arg_gui_item)
	{
		if(build_select_panel == container.locked_build_panel)
		{
			//draw_set_color(c_white);
			//draw_rectangle_color(left, top, right, bottom, rectangle_color_top, rectangle_color_top, rectangle_color_bottom, rectangle_color_bottom, true);
			draw_set_colour(c_yellow);
			draw_rectangle(left, top, right, bottom, true);
		}
	}


}
