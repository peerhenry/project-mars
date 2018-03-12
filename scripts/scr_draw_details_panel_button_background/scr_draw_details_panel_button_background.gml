/// @arg button_dto
var arg_component = argument0;
with(arg_component)
{
	if(draw_as_panel)
	{
		if(hover)
		{
			if(mouse_check_button(mb_left)) scr_draw_panel_inverse(left, top, right, bottom);
			else scr_draw_panel_light(left, top, right, bottom);
		}
		else scr_draw_panel(left, top, right, bottom);
	}
	else
	{
		if(hover)
		{
			if(mouse_check_button(mb_left)) draw_rectangle_color(left, top, right, bottom, color_down_top, color_down_top, color_down_bottom, color_down_bottom, false);
			else draw_rectangle_color(left, top, right, bottom, color_hover_top, color_hover_top, color_hover_bottom, color_hover_bottom, false);
		}
		else draw_rectangle_color(left, top, right, bottom, rectangle_color_top, rectangle_color_top, rectangle_color_bottom, rectangle_color_bottom, false);
	}
}