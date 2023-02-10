/// @description Standard gui item draw behavior
function scr_gui_item_draw_standard(argument0) {

	with(argument0)
	{
		// 1 draw panel
		if(should_draw_panel) scr_draw_panel(left, top, right, bottom);

		// 2 draw rectangle
		if(should_draw_rectangle)
		{
			draw_set_alpha(rectangle_alpha);
			draw_rectangle_color(left, top, right, bottom, rectangle_color_top, rectangle_color_top, rectangle_color_bottom, rectangle_color_bottom, false);
			draw_set_alpha(1.0);
		}

		// 3 draw sprite
		if(sprite != noone)
		{
			if(sprite_crop)
			{
				var sw = min(width, sprite_get_width(sprite));
				var sh = min(height, sprite_get_height(sprite));
				draw_sprite_part_ext(sprite, subimg, 0, 0, sw, sh, sprite_x - sw/2, sprite_y - sh/2, 1, 1, sprite_color, sprite_alpha);
			}
			else draw_sprite_ext(sprite, subimg, sprite_x, sprite_y, 1, 1, 0, sprite_color, sprite_alpha);
		}

		// 4 healthbar
		if(should_draw_healthbar)
		{
			draw_healthbar(
				bar_left, bar_top, bar_right, bar_bottom, 
				bar_amount, 
				c_black, bar_color, bar_color, // backcol, mincol, maxcol
				bar_direction, true, true); // direction, showback, showborder
		}

		// 5 draw text
		if(string_length(text) > 0)
		{
			draw_set_font(font);
			draw_set_halign(text_halign);
			draw_set_valign(text_valign);
			draw_set_color(text_color);
			draw_text(text_x, text_y, text);
		}
	}


}
