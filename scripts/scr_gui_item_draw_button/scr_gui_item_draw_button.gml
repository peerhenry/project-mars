/// @description Gui button draw behavior

with(argument0)
{
	// 1 draw panel
	if(should_draw_panel)
	{
		if(button_down) scr_draw_panel_inverse(left, top, right, bottom);
		else if(button_hover) scr_draw_panel_light(left, top, right, bottom);
		else scr_draw_panel(left, top, right, bottom);
	}

	// 2 draw rectangle
	if(should_draw_rectangle)
	{
		draw_rectangle_color(left, top, right, bottom, rectangle_color_top, rectangle_color_top, rectangle_color_bottom, rectangle_color_bottom, false);
	}

	// 3 draw sprite
	if(sprite != noone)
	{
		draw_sprite_ext(sprite, subimg, sprite_x, sprite_y, 1, 1, 0, sprite_color, sprite_alpha);
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
		draw_set_halign(halign);
		draw_set_valign(valign);
		draw_set_color(text_color);
		draw_text(text_x, text_y, text);
	}
}